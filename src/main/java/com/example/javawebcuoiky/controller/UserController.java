package com.example.javawebcuoiky.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.javawebcuoiky.model.Order;
import com.example.javawebcuoiky.model.Post;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.ShoppingCart;
import com.example.javawebcuoiky.model.ShoppingCartItem;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.BrandService;
import com.example.javawebcuoiky.service.CommentService;
import com.example.javawebcuoiky.service.OrderDetailService;
import com.example.javawebcuoiky.service.OrderService;
import com.example.javawebcuoiky.service.PaymentService;
import com.example.javawebcuoiky.service.PostService;
import com.example.javawebcuoiky.service.ProductService;
import com.example.javawebcuoiky.service.ShoppingCartService;

import jakarta.servlet.http.HttpSession;




@Controller
public class UserController {
    private final ProductService productService;
    private final ShoppingCartService cartService;
    private final  BrandService brandService;
      private final OrderService orderService;
      private final PostService postService;
      private final OrderDetailService orderDetailService;
      private final CommentService commentService;
      private final PaymentService paymentService;
    public UserController(ProductService productService,ShoppingCartService cartService, BrandService brandService,
         OrderService orderService,PostService postService,OrderDetailService orderDetailService,CommentService commentService,PaymentService paymentService){
        this.productService=productService;
        this.cartService = cartService;
        this.brandService=brandService;
        this.orderService = orderService;
        this.postService=postService;
        this.orderDetailService = orderDetailService;
        this.commentService=commentService;
        this.paymentService = paymentService;
        
    }
    @RequestMapping(value="/user/home", method=RequestMethod.GET)
    public String showHome(Model model) {
        List<Product> newProducts =productService.getNewProducts();
        List<Product> saleProducts = productService.getSaleProducts();
        List<Product> hotProducts = productService.getHotProducts();
        model.addAttribute("newProducts", newProducts);
        model.addAttribute("saleProducts",saleProducts);
         model.addAttribute("hotProducts", hotProducts);
        return "user/home";
    }
   @RequestMapping(value = "/user/product", method = RequestMethod.GET)
public String showProduct(Model model,
                          @RequestParam(defaultValue = "0") int page,
                          @RequestParam(defaultValue = "9") int size,
                          @RequestParam(required = false) Integer brandId,     
                          @RequestParam(required = false) Double minPrice,      
                          @RequestParam(required = false) Double maxPrice,
                          @RequestParam(required = false) String keyword) {

    Page<Product> productPage = productService.getProductByPage(page, size, brandId, minPrice, maxPrice, keyword);
    model.addAttribute("products", productPage.getContent());
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", productPage.getTotalPages());
    model.addAttribute("brands", brandService.getAllBrands());
    model.addAttribute("selectedBrand", brandId);             
    model.addAttribute("minPrice", minPrice);              
    model.addAttribute("maxPrice", maxPrice);
    model.addAttribute("keyword", keyword);
    return "user/product";
}

    @RequestMapping(value = "/user/shoppingcart", method = RequestMethod.GET)
    public String showGioHang(Model model, HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        String sessionId = session.getId();

        List<ShoppingCartItem> cartItems = cartService.getCartItemsWithProduct(loggedUser, sessionId);
        double total = cartItems.stream()
                .mapToDouble(ShoppingCartItem::getSubtotal)
                .sum();

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", total);
        return "user/shoppingcart";
    }

   @PostMapping("/user/cart/add")
public String addToCart(@RequestParam int productId,
                    @RequestParam(defaultValue = "1") int quantity,
                    @RequestParam(defaultValue = "") String returnUrl,
                    HttpSession session,
                    RedirectAttributes redirectAttributes) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    try {
        cartService.addToCart(loggedUser, session.getId(), productId, quantity);
    } catch (RuntimeException e) {
        redirectAttributes.addFlashAttribute("errorMsg", e.getMessage());
        if (!returnUrl.isEmpty()) return "redirect:" + returnUrl;
        return "redirect:/user/product";
    }

    if (!returnUrl.isEmpty()) return "redirect:" + returnUrl;
    return "redirect:/user/shoppingcart";
}
    // Xóa khỏi giỏ 
    @PostMapping("/user/cart/remove")
    public String removeFromCart(@RequestParam int cartId) {
        cartService.removeFromCart(cartId);
        return "redirect:/user/shoppingcart";
    }
    @RequestMapping(value="/user/productDetails/{id}", method=RequestMethod.GET)
    public String showProductDetails(@PathVariable int id,Model model, HttpSession session) {
        Product product=productService.getProductById(id);
        if(product==null) return "redirect:/user/product";
        model.addAttribute("product", product);
        model.addAttribute("comments", commentService.getApprovedComments(id));
        return "user/productDetails";
    }


   // ───── Checkout – hiển thị form ─────
    @RequestMapping(value = "/user/checkout", method = RequestMethod.GET)
    public String showCheckout(Model model, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    List<ShoppingCartItem> cartItems = cartService.getCartItemsWithProduct(loggedUser, session.getId());
    if (cartItems == null || cartItems.isEmpty()) return "redirect:/user/shoppingcart";

    // Lọc theo sản phẩm đã chọn (nếu có)
    @SuppressWarnings("unchecked")
    List<Integer> selectedIds = (List<Integer>) session.getAttribute("selectedCartIds");
    if (selectedIds != null && !selectedIds.isEmpty()) {
        cartItems = cartItems.stream()
                .filter(i -> selectedIds.contains(i.getCart().getId()))
                .collect(java.util.stream.Collectors.toList());
        if (cartItems.isEmpty()) return "redirect:/user/shoppingcart";
    }

    double total = cartItems.stream()
            .mapToDouble(ShoppingCartItem::getSubtotal)
            .sum();

    model.addAttribute("cartItems", cartItems);
    model.addAttribute("total", total);
    model.addAttribute("loggedUser", loggedUser);
    return "user/checkout";
}

// ───── Checkout – xử lý đặt hàng ─────
@PostMapping("/user/checkout")
public String placeOrder(@RequestParam String receiverName,
                         @RequestParam String receiverEmail,
                         @RequestParam String receiverPhone,
                         @RequestParam String address,
                         @RequestParam(defaultValue = "COD") String paymentMethod,
                         HttpSession session,
                         Model model) {

    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    List<ShoppingCartItem> cartItems = cartService.getCartItemsWithProduct(loggedUser, session.getId());
    if (cartItems == null || cartItems.isEmpty()) return "redirect:/user/shoppingcart";

    @SuppressWarnings("unchecked")
    List<Integer> selectedIds = (List<Integer>) session.getAttribute("selectedCartIds");
    if (selectedIds != null && !selectedIds.isEmpty()) {
        cartItems = cartItems.stream()
                .filter(i -> selectedIds.contains(i.getCart().getId()))
                .collect(java.util.stream.Collectors.toList());
        if (cartItems.isEmpty()) return "redirect:/user/shoppingcart";
    }

    Order savedOrder = orderService.placeOrder(
            receiverName, receiverEmail, receiverPhone, address,
            paymentMethod,
            loggedUser.getId(), cartItems
    );

    session.removeAttribute("selectedCartIds");

    // ── BANK → sang trang QR giả lập, chưa coi là thành công ──
    if ("BANK".equals(paymentMethod)) {
        return "redirect:/user/payment-qr/" + savedOrder.getId();
    }

    // COD → vào thẳng trang thành công
    model.addAttribute("order", savedOrder);
    model.addAttribute("paymentMethod", paymentMethod);
    return "user/order-success";
}

// Hiển thị trang QR giả lập
@RequestMapping(value = "/user/payment-qr/{orderId}", method = RequestMethod.GET)
public String showPaymentQr(@PathVariable int orderId, Model model, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    Order order = orderService.getOrderById(orderId);
    if (order == null || order.getId_user() != loggedUser.getId())
        return "redirect:/user/orders";

    com.example.javawebcuoiky.model.Payment payment = paymentService.getByOrderId(orderId);
    if (payment == null) return "redirect:/user/orders";

    if ("Đã thanh toán".equals(payment.getPayment_status())) {
        return "redirect:/user/orders/" + orderId;
    }

    model.addAttribute("order", order);
    model.addAttribute("payment", payment);
    model.addAttribute("loggedUser", loggedUser); // ← cần cho ${loggedUser.username} trong JSP
    return "user/payment-qr";
}

// Xác nhận đã thanh toán (giả lập)
@PostMapping("/user/payment-qr/confirm")
public String confirmPaymentQr(@RequestParam int orderId, HttpSession session, Model model) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    Order order = orderService.getOrderById(orderId);
    if (order == null || order.getId_user() != loggedUser.getId())
        return "redirect:/user/orders";

    paymentService.updatePaymentStatus(orderId, "Đã thanh toán");

    model.addAttribute("order", order);
    model.addAttribute("paymentMethod", "BANK");
    return "user/order-success";
}


    // ───── Liên hệ ─────
    @RequestMapping(value = "/user/contact", method = RequestMethod.GET)
    public String showContact() {
        return "user/contact";
    }

    // ───── Bài viết ─────
@RequestMapping(value = "/user/blog", method = RequestMethod.GET)
public String showBlog(Model model) {
    List<Post> posts = postService.getAllPosts();
    model.addAttribute("posts", posts);
    return "user/blog";
}

@RequestMapping(value = "/user/blog/{id}", method = RequestMethod.GET)
public String showBlogDetail(@PathVariable int id, Model model) {
    Post post = postService.getPostById(id);
    if (post == null) return "redirect:/user/blog";
    model.addAttribute("post", post);
    return "user/blogDetail";
}

   
    // Lịch sử đơn hàng
@RequestMapping(value = "/user/orders", method = RequestMethod.GET)
public String showOrderHistory(Model model, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    List<com.example.javawebcuoiky.model.OrderDetailItem> items =
            orderService.getPurchasedItems(loggedUser.getId());

    model.addAttribute("items", items);
    return "user/order-history";
}
// Chi tiết đơn hàng
@RequestMapping(value = "/user/orders/{id}", method = RequestMethod.GET)
public String showOrderDetail(@PathVariable int id, Model model, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    Order order = orderService.getOrderById(id);
    if (order == null || order.getId_user() != loggedUser.getId())
        return "redirect:/user/orders";

    // ← đổi sang getPurchasedItems rồi filter theo orderId
    List<com.example.javawebcuoiky.model.OrderDetailItem> details =
            orderService.getDetailItemsByOrderId(id);

    model.addAttribute("order", order);
    model.addAttribute("details", details);
    return "user/order-detail";
}
// Hủy đơn hàng
@PostMapping("/user/orders/cancel")
public String cancelOrder(@RequestParam int orderId, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";
    orderService.cancelOrder(orderId, loggedUser.getId());
    return "redirect:/user/orders/" + orderId;
}

// Xác nhận đã nhận hàng
@PostMapping("/user/orders/confirm")
public String confirmReceived(@RequestParam int orderId, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";
    orderService.confirmReceived(orderId, loggedUser.getId());
    return "redirect:/user/orders/" + orderId;
}
    
    // Hủy từng sản phẩm
@PostMapping("/user/orders/cancelItem")
public String cancelItem(@RequestParam int detailId,
                         @RequestParam int orderId,
                         HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";
    orderDetailService.updateStatus(detailId, "Đã hủy");
    return "redirect:/user/orders/" + orderId;
}

// Xác nhận đã nhận từng sản phẩm
@PostMapping("/user/orders/confirmItem")
public String confirmItem(@RequestParam int detailId,
                          @RequestParam int orderId,
                          HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";
    orderDetailService.updateStatus(detailId, "Thành công");
    return "redirect:/user/orders/" + orderId;
}

// Hiển thị form đánh giá
@RequestMapping(value = "/user/review/{detailId}", method = RequestMethod.GET)
public String showReviewForm(@PathVariable int detailId, Model model, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    com.example.javawebcuoiky.model.OrderDetail detail = orderDetailService.getById(detailId);
    if (detail == null) return "redirect:/user/orders";

    // Lấy Order tương ứng để kiểm tra trạng thái
    Order order = orderService.getOrderById(detail.getId_order());
    if (order == null) return "redirect:/user/orders";

    // Chỉ cho review khi Order đã "Đã nhận hàng"
    if (!"Thành công".equals(order.getStatus()))
        return "redirect:/user/orders/" + detail.getId_order();

    if (commentService.hasReviewed(loggedUser.getId(),
            detail.getId_product(), detail.getId_order()))
        return "redirect:/user/orders/" + detail.getId_order() + "?reviewed=true";

    com.example.javawebcuoiky.model.Product product =
            productService.getProductById(detail.getId_product());

    model.addAttribute("detail", detail);
    model.addAttribute("product", product);
    return "user/review-form";
}

// Xử lý gửi đánh giá
@PostMapping("/user/review/submit")
public String submitReview(@RequestParam int detailId,
                           @RequestParam int productId,
                           @RequestParam int orderId,
                           @RequestParam String message,
                           @RequestParam int rating,
                           HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    if (!commentService.hasReviewed(loggedUser.getId(), productId, orderId)) {
        commentService.saveComment(loggedUser.getId(), productId, orderId, message, rating);
    }
   return "redirect:/user/review/" + detailId + "?success=true";
}
@RequestMapping(value = "/user/pending-reviews", method = RequestMethod.GET)
public String showPendingReviews(Model model, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    List<com.example.javawebcuoiky.model.OrderDetailItem> allItems =
            orderService.getPurchasedItems(loggedUser.getId());

    List<com.example.javawebcuoiky.model.OrderDetailItem> pendingItems = new java.util.ArrayList<>();
    for (com.example.javawebcuoiky.model.OrderDetailItem item : allItems) {
        // Dựa vào trạng thái của Order, không phải OrderDetail
        if ("Thành công".equals(item.getOrder().getStatus())) {
            boolean reviewed = commentService.hasReviewed(
                loggedUser.getId(),
                item.getDetail().getId_product(),
                item.getDetail().getId_order()
            );
            if (!reviewed) {
                pendingItems.add(item);
            }
        }
    }

    model.addAttribute("pendingItems", pendingItems);
    return "user/pending-reviews";
}
    @PostMapping("/user/cart/update")
    public String updateCartQuantity(@RequestParam int cartId,
                                    @RequestParam int quantity) {
        cartService.updateQuantity(cartId, quantity);
        return "redirect:/user/shoppingcart";
    }

    // Mua ngay 1 sản phẩm trong giỏ (không cần thanh toán hết giỏ)
    @PostMapping("/user/cart/buy-single")
    public String buySingleItem(@RequestParam int cartId, HttpSession session) {
        session.setAttribute("selectedCartIds", java.util.List.of(cartId));
        return "redirect:/user/checkout";
    }

    // Mua các sản phẩm được tick chọn
    @PostMapping("/user/cart/buy-selected")
public String buySelectedItems(@RequestParam(required = false) List<Integer> selectedIds,
                                HttpSession session) {
    if (selectedIds == null || selectedIds.isEmpty()) {
        // Không chọn gì → xóa filter cũ (nếu có), thanh toán toàn bộ giỏ
        session.removeAttribute("selectedCartIds");
    } else {
        session.setAttribute("selectedCartIds", selectedIds);
    }
    return "redirect:/user/checkout";
}
   @PostMapping("/user/buy-now")
public String buyNow(@RequestParam int productId,
                     @RequestParam(defaultValue = "1") int quantity,
                     HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    // Set đúng số lượng (không cộng dồn)
    ShoppingCart cart = cartService.addToCartExact(loggedUser, session.getId(), productId, quantity);

    // Chỉ checkout đúng sản phẩm này
    session.setAttribute("selectedCartIds", java.util.List.of(cart.getId()));
    return "redirect:/user/checkout";
}
@RequestMapping(value="/user/introduce", method=RequestMethod.GET)
public String showIntro() {
    return "user/introduce";
}
@PostMapping("/user/cart/add-ajax")
@org.springframework.web.bind.annotation.ResponseBody
public java.util.Map<String, Object> addToCartAjax(@RequestParam int productId,
                                                    @RequestParam(defaultValue = "1") int quantity,
                                                    HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    java.util.Map<String, Object> result = new java.util.HashMap<>();
    try {
        cartService.addToCart(loggedUser, session.getId(), productId, quantity);
        List<ShoppingCartItem> cartItems = cartService.getCartItemsWithProduct(loggedUser, session.getId());
        int cartCount = cartItems.stream().mapToInt(i -> i.getCart().getQuantity()).sum();
        result.put("success", true);
        result.put("cartCount", cartCount);
    } catch (RuntimeException e) {
        result.put("success", false);
        result.put("message", e.getMessage());
    }
    return result;
}

}
