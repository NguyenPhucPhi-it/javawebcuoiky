package com.example.javawebcuoiky.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.javawebcuoiky.model.Brand;
import com.example.javawebcuoiky.model.Order;
import com.example.javawebcuoiky.model.Payment;
import com.example.javawebcuoiky.model.Post;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.repository.ProductRepository;
import com.example.javawebcuoiky.service.BrandService;
import com.example.javawebcuoiky.service.CommentService;
import com.example.javawebcuoiky.service.OrderDetailService;
import com.example.javawebcuoiky.service.OrderService;
import com.example.javawebcuoiky.service.PaymentService;
import com.example.javawebcuoiky.service.PostService;
import com.example.javawebcuoiky.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    private final ProductService productService;
    private final BrandService brandService;
    private final PostService postService;
    private final OrderService orderService;
    private final OrderDetailService orderDetailService;
    private final CommentService commentService;
    private final ProductRepository productRepository;
     private final PaymentService paymentService;

    public AdminController(ProductService productService, BrandService brandService,PostService postService,OrderService orderService,CommentService commentService,
                       OrderDetailService orderDetailService,ProductRepository productRepository,PaymentService paymentService) {
        this.productService = productService;
        this.brandService = brandService;
        this.postService = postService;
        this.orderService = orderService;
        this.orderDetailService = orderDetailService;
        this.commentService=commentService;
        this.productRepository  = productRepository;
        this.paymentService = paymentService;
    }

    private boolean isAdmin(HttpSession session) {
        User user = (User) session.getAttribute("loggedUser");
        return user != null && user.getRole() == 1;
    }

    // @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
    // public String showDashboard(HttpSession session) {
    //     if (!isAdmin(session)) return "redirect:/auth/login";
    //     return "admin/dashboard";
    // }

    @RequestMapping(value = "/admin/products", method = RequestMethod.GET)
    public String showProduct(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";

        List<Product> products = productService.getAllProducts();
        List<Brand> brands = brandService.getAllBrands();
        Map<Integer, String> brandMap = new HashMap<>();
        for (Brand b : brands) {
            brandMap.put(b.getId(), b.getBrandName());
        }
        model.addAttribute("products", products);
        model.addAttribute("brandMap", brandMap);
        return "admin/products";
    }

    @RequestMapping(value = "/admin/products/add", method = RequestMethod.GET)
    public String showAddProduct(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        model.addAttribute("product", new Product());
        model.addAttribute("brands", brandService.getAllBrands());
        return "admin/addProduct";
    }

    @RequestMapping(value = "/admin/products/add", method = RequestMethod.POST)
    public String addProducts(@ModelAttribute Product product,
                              @RequestParam("imageFile") MultipartFile imageFile,
                              HttpSession session) throws IOException {
        if (!isAdmin(session)) return "redirect:/auth/login";

        String uploadDir = "src/main/webapp/assets/uploads/";
        Path uploadPath = Paths.get(uploadDir);
        if (!imageFile.isEmpty()) {
            if (!Files.exists(uploadPath)) Files.createDirectories(uploadPath);
            String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
            Files.copy(imageFile.getInputStream(), uploadPath.resolve(fileName),
                       StandardCopyOption.REPLACE_EXISTING);
            product.setImage(fileName);
        }
        productService.saveProduct(product);
        return "redirect:/admin/products";
    }

    @RequestMapping(value = "/admin/brands", method = RequestMethod.GET)
    public String showBrands(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        model.addAttribute("brands", brandService.getAllBrands());
        return "admin/brands";
    }

    @RequestMapping(value = "/admin/brands/add", method = RequestMethod.GET)
    public String showAddBrandForm(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        model.addAttribute("brand", new Brand());
        return "admin/addBrand";
    }

    @RequestMapping(value = "/admin/brands/add", method = RequestMethod.POST)
    public String addBrand(@ModelAttribute Brand brand, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        brandService.saveBrand(brand);
        return "redirect:/admin/brands";
    }
    @RequestMapping(value="/admin/updateBrand/{id}", method=RequestMethod.GET)
    public String showUpdateBrandForm(@PathVariable("id") int id, Model model, HttpSession session) {
        if(!isAdmin(session)) return "redirect:/auth/login";
        Brand brand = brandService.getBrandById(id);
        if(brand ==null){
            return "redirect:/admin/brands";
        }
         model.addAttribute("brand", brand);
        return "admin/updateBrand";
    }
    @RequestMapping(value="/admin/updateBrand", method=RequestMethod.POST)
    public String updateBrand(@ModelAttribute Brand brand, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        brandService.saveBrand(brand);
        return "redirect:/admin/brands";
    }
    @RequestMapping(value="/admin/products/update/{id}", method=RequestMethod.GET)
    public String showUpdateProduct(@PathVariable int id,Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        Product product = productService.getProductById(id);
        if(product == null)  return "redirect:/admin/products";
        model.addAttribute("product", product);
        model.addAttribute("brands", brandService.getAllBrands());
        return "admin/updateProduct";
    }
    @RequestMapping(value = "/admin/products/update", method = RequestMethod.POST)
    public String updateProduct(@ModelAttribute Product product,
                             @RequestParam("imageFile") MultipartFile imageFile,
                             HttpSession session) throws IOException {
    if (!isAdmin(session)) return "redirect:/auth/login";

    // Nếu có upload ảnh mới thì thay, không thì giữ ảnh cũ
    if (!imageFile.isEmpty()) {
        String uploadDir = "src/main/webapp/assets/uploads/";
        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) Files.createDirectories(uploadPath);
        String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
        Files.copy(imageFile.getInputStream(), uploadPath.resolve(fileName),
                   StandardCopyOption.REPLACE_EXISTING);
        product.setImage(fileName);
    }
    // imageFile rỗng → product.image vẫn giữ giá trị từ hidden input
    productService.saveProduct(product);
    return "redirect:/admin/products";
    }
    @RequestMapping(value="/admin/products/delete/{id}", method=RequestMethod.GET)
    public String deleteProduct(@PathVariable int id, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        productService.deletProducts(id);
        return "redirect:/admin/products";
    }
    @RequestMapping(value="/admin/brands/delete/{id}", method=RequestMethod.GET)
    public String deleteBrand(@PathVariable int id, HttpSession session) {
         if (!isAdmin(session)) return "redirect:/auth/login";
         brandService.deleteBrand(id);
        return "redirect:/admin/brands";
    }
    

    // post
    @RequestMapping(value="/admin/post", method=RequestMethod.GET)
    public String listPost(Model model, HttpSession session) {
           if (!isAdmin(session)) return "redirect:/auth/login";
        List<Post> posts=postService.getAllPosts();
        model.addAttribute("posts", posts);
        return "admin/post";
    }
    @RequestMapping(value="/admin/post/add", method=RequestMethod.GET)
    public String addPost(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        model.addAttribute("post", new Post());
        return "admin/post-form";
    }
    @RequestMapping(value="/admin/post/update/{id}", method=RequestMethod.GET)
    public String updateFormPost(@PathVariable int id, Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        Post post = postService.getPostById(id);
        if (post == null) return "redirect:/admin/post";
        model.addAttribute("post", post);
        return "admin/post-form";
    }
     @PostMapping("/admin/post/save")
    public String savePost(@ModelAttribute Post post,
                           @RequestParam("file") MultipartFile file, HttpSession session) throws IOException {
                               if (!isAdmin(session)) return "redirect:/auth/login";
        if (!file.isEmpty()) {
            String uploadDir = "src/main/resources/static/assets/uploads/";
            String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            Path path = Paths.get(uploadDir + filename);
            Files.createDirectories(path.getParent());
            Files.write(path, file.getBytes());
            post.setImage(filename);
        }
        postService.savePost(post);
        return "redirect:/admin/post";
    }

    @GetMapping("/admin/post/delete/{id}")
    public String deletePost(@PathVariable int id, HttpSession session) {
           if (!isAdmin(session)) return "redirect:/auth/login";
        postService.deletePost(id);
        return "redirect:/admin/post";
    }
    // quan ly don hang 
    
   @RequestMapping(value = "/admin/orders", method = RequestMethod.GET)
public String listOrders(Model model, HttpSession session) {
    if (!isAdmin(session)) return "redirect:/auth/login";

    List<Order> orders = orderService.getAllOrders();

    Map<Integer, Payment> paymentMap = new HashMap<>();
    for (Order o : orders) {
        Payment p = paymentService.getByOrderId(o.getId());
        if (p != null) paymentMap.put(o.getId(), p);
    }

    model.addAttribute("orders", orders);
    model.addAttribute("paymentMap", paymentMap); 
    return "admin/orders";
}

  @RequestMapping(value = "/admin/orders/{id}", method = RequestMethod.GET)
public String orderDetail(@PathVariable int id, Model model, HttpSession session) {
    if (!isAdmin(session)) return "redirect:/auth/login";
    Order order = orderService.getOrderById(id);
    if (order == null) return "redirect:/admin/orders";

    List<com.example.javawebcuoiky.model.OrderDetailItem> details =
            orderService.getDetailItemsByOrderId(id);

    Payment payment = paymentService.getByOrderId(id); // ← thêm

    model.addAttribute("order", order);
    model.addAttribute("details", details);
    model.addAttribute("payment", payment); // ← thêm
    return "admin/orderDetail";
}
@PostMapping("/admin/orders/updateStatus")
public String updateStatus(@RequestParam int orderId,
                           @RequestParam String status,
                           HttpSession session) {
    if (!isAdmin(session)) return "redirect:/auth/login";

    Order order = orderService.getOrderById(orderId);
    if (order == null) return "redirect:/admin/orders";

    String current = order.getStatus();
    boolean valid = false;

    switch (current) {
        case "Chờ xác nhận": valid = "Đã xác nhận".equals(status) || "Đã hủy".equals(status); break;
        case "Đã xác nhận":  valid = "Đang giao".equals(status)   || "Đã hủy".equals(status); break;
        case "Đang giao":    valid = "Thành công".equals(status);  break;
        default: valid = false;
    }

    if (valid) {
        orderService.updateStatus(orderId, status);

        // Đồng bộ trạng thái xuống từng OrderDetail trong đơn
        List<com.example.javawebcuoiky.model.OrderDetail> details =
                orderDetailService.getByOrderId(orderId);
        for (com.example.javawebcuoiky.model.OrderDetail d : details) {
            // Chỉ cascade khi sản phẩm chưa bị hủy riêng lẻ
            if (!"Đã hủy".equals(d.getStatus())) {
                orderDetailService.updateStatus(d.getId(), status);
            }
        }
    }

    return "redirect:/admin/orders";
}
    @PostMapping("/admin/orders/detail/updateStatus")
    public String updateDetailStatus(@RequestParam int detailId,
                                    @RequestParam String status,
                                    @RequestParam int orderId,
                                    HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        orderDetailService.updateStatus(detailId, status);
        return "redirect:/admin/orders/" + orderId;
    }
       
@RequestMapping(value = "/admin/comments", method = RequestMethod.GET)
public String listComments(Model model, HttpSession session) {
    if (!isAdmin(session)) return "redirect:/auth/login";

    List<com.example.javawebcuoiky.model.CommentAdminItem> comments =
            commentService.getAllCommentItems(productRepository); 

    long total    = comments.size();
    long pending  = comments.stream().filter(c -> c.getStatus() == 0).count();
    long approved = comments.stream().filter(c -> c.getStatus() == 1).count();
    long hidden   = comments.stream().filter(c -> c.getStatus() == 2).count();

    model.addAttribute("comments",      comments);
    model.addAttribute("totalCount",    total);
    model.addAttribute("pendingCount",  pending);
    model.addAttribute("approvedCount", approved);
    model.addAttribute("hiddenCount",   hidden);
    return "admin/comments";
}
    @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
public String showDashboard(Model model, HttpSession session) {
    if (!isAdmin(session)) return "redirect:/auth/login";

    model.addAttribute("totalProducts", productService.getAllProducts().size());
    model.addAttribute("totalOrders",   orderService.getAllOrders().size());
    model.addAttribute("totalBrands",   brandService.getAllBrands().size());
    model.addAttribute("totalComments", commentService.getAllComments().size());

    model.addAttribute("totalRevenue",     orderService.getTotalRevenue());
    model.addAttribute("revenueToday",     orderService.getRevenueThisDay());
    model.addAttribute("revenueThisWeek",  orderService.getRevenueThisWeek());
    model.addAttribute("revenueThisMonth", orderService.getRevenueThisMonth());
    model.addAttribute("revenueThisYear",  orderService.getRevenueThisYear());

    // ── Thêm năm hiện tại ──
    model.addAttribute("currentYear",
            java.util.Calendar.getInstance().get(java.util.Calendar.YEAR));

    // ── Đồng bộ tên status với thực tế ──
    List<Order> allOrders = orderService.getAllOrders();

    long choXacNhan = allOrders.stream()
            .filter(o -> "Chờ xác nhận".equals(o.getStatus())).count();
    long daXacNhan  = allOrders.stream()
            .filter(o -> "Đã xác nhận".equals(o.getStatus())).count();
    long dangGiao   = allOrders.stream()
            .filter(o -> "Đang giao".equals(o.getStatus())).count();   // ← sửa ở đây
    long thanhCong  = allOrders.stream()
            .filter(o -> "Thành công".equals(o.getStatus())).count();
    long daHuy      = allOrders.stream()
            .filter(o -> "Đã hủy".equals(o.getStatus())).count();

    model.addAttribute("choXacNhan", choXacNhan);
    model.addAttribute("daXacNhan",  daXacNhan);
    model.addAttribute("dangGiao",   dangGiao);
    model.addAttribute("thanhCong",  thanhCong);
    model.addAttribute("daHuy",      daHuy);

    long pendingComments = commentService.getAllComments().stream()
            .filter(c -> c.getStatus() == 0).count();
    model.addAttribute("pendingComments", pendingComments);

    List<Order> recentOrders = orderService.getAllOrders();
    int fromIndex = Math.max(0, recentOrders.size() - 5);
    List<Order> last5 = new java.util.ArrayList<>(
            recentOrders.subList(fromIndex, recentOrders.size()));
    java.util.Collections.reverse(last5);
    model.addAttribute("recentOrders", last5);

    return "admin/dashboard";
}
    @PostMapping("/admin/comments/updateStatus")
    public String updateCommentStatus(@RequestParam int commentId,
                                    @RequestParam int status,
                                    HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        commentService.updateStatus(commentId, status);
        return "redirect:/admin/comments";
    }

    
}