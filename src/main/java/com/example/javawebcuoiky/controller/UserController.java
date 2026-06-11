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

import com.example.javawebcuoiky.model.Order;
import com.example.javawebcuoiky.model.Post;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.ShoppingCartItem;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.BrandService;
import com.example.javawebcuoiky.service.CommentService;
import com.example.javawebcuoiky.service.OrderDetailService;
import com.example.javawebcuoiky.service.OrderService;
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
    public UserController(ProductService productService,ShoppingCartService cartService, BrandService brandService, OrderService orderService,PostService postService,OrderDetailService orderDetailService,CommentService commentService){
        this.productService=productService;
        this.cartService = cartService;
        this.brandService=brandService;
        this.orderService = orderService;
        this.postService=postService;
        this.orderDetailService = orderDetailService;
        this.commentService=commentService;
        
    }
    @RequestMapping(value="/user/home", method=RequestMethod.GET)
    public String showHome(Model model) {
        List<Product> newProducts =productService.getNewProducts();
        List<Product> saleProducts = productService.getSaleProducts();
        model.addAttribute("newProducts", newProducts);
        model.addAttribute("saleProducts",saleProducts);
        return "user/home";
    }
    @RequestMapping(value = "/user/product", method = RequestMethod.GET)
    public String showProduct(Model model,
                              @RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "9") int size,
                              @RequestParam(required = false) Integer brandId,     
                              @RequestParam(required = false) Double minPrice,      
                              @RequestParam(required = false) Double maxPrice)
                               {

           Page<Product> productPage = productService.getProductByPage(page, size, brandId, minPrice, maxPrice);
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("brands", brandService.getAllBrands());
        model.addAttribute("selectedBrand", brandId);             
        model.addAttribute("minPrice", minPrice);              
        model.addAttribute("maxPrice", maxPrice);   
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
    //  @PostMapping("/user/cart/add")
    // public String addToCart(@RequestParam int productId,
    //                         @RequestParam(defaultValue = "1") int quantity,
    //                         HttpSession session) {
    //     User loggedUser = (User) session.getAttribute("loggedUser");
    //     cartService.addToCart(loggedUser, session.getId(), productId, quantity);
        
    //     return "redirect:/user/shoppingcart";
    // }
    @PostMapping("/user/cart/add")
public String addToCart(@RequestParam int productId,
                        @RequestParam(defaultValue = "1") int quantity,
                        @RequestParam(defaultValue = "") String returnUrl,
                        HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    cartService.addToCart(loggedUser, session.getId(), productId, quantity);

    if (!returnUrl.isEmpty()) {
        return "redirect:" + returnUrl;
    }
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
        return "user/productDetails";
    }


    // ───── Checkout – hiển thị form ─────
    @RequestMapping(value = "/user/checkout", method = RequestMethod.GET)
    public String showCheckout(Model model, HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser == null) return "redirect:/auth/login";

        List<ShoppingCartItem> cartItems = cartService.getCartItemsWithProduct(loggedUser, session.getId());
        if (cartItems == null || cartItems.isEmpty()) return "redirect:/user/shoppingcart";

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

    Order savedOrder = orderService.placeOrder(
            receiverName, receiverEmail, receiverPhone, address,
            paymentMethod,       // ← thêm
            loggedUser.getId(), cartItems
    );

    model.addAttribute("order", savedOrder);
    model.addAttribute("paymentMethod", paymentMethod); // ← để hiển thị ở order-success
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
    orderDetailService.updateStatus(detailId, "Đã nhận hàng");
    return "redirect:/user/orders/" + orderId;
}

// Hiển thị form đánh giá
@RequestMapping(value = "/user/review/{detailId}", method = RequestMethod.GET)
public String showReviewForm(@PathVariable int detailId, Model model, HttpSession session) {
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) return "redirect:/auth/login";

    // Lấy OrderDetailItem để biết sản phẩm và đơn hàng
    com.example.javawebcuoiky.model.OrderDetail detail =
            orderDetailService.getById(detailId);
    if (detail == null) return "redirect:/user/orders";

    // Chỉ cho review khi Hoàn thành
    if (!"Hoàn thành".equals(detail.getStatus()))
        return "redirect:/user/orders/" + detail.getId_order();

    // Kiểm tra đã review chưa
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
    return "redirect:/user/orders/" + orderId + "?reviewed=true";
}
}
