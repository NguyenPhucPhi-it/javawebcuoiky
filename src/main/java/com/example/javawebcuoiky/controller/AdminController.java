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
import com.example.javawebcuoiky.model.OrderDetail;
import com.example.javawebcuoiky.model.Post;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.BrandService;
import com.example.javawebcuoiky.service.OrderDetailService;
import com.example.javawebcuoiky.service.OrderService;
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

    public AdminController(ProductService productService, BrandService brandService,PostService postService,OrderService orderService,
                       OrderDetailService orderDetailService) {
        this.productService = productService;
        this.brandService = brandService;
         this.postService = postService;
         this.orderService = orderService;
    this.orderDetailService = orderDetailService;
    }

    private boolean isAdmin(HttpSession session) {
        User user = (User) session.getAttribute("loggedUser");
        return user != null && user.getRole() == 1;
    }

    @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
    public String showDashboard(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        return "admin/dashboard";
    }

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
        model.addAttribute("orders", orderService.getAllOrders());
        return "admin/orders";
    }

    @RequestMapping(value = "/admin/orders/{id}", method = RequestMethod.GET)
    public String orderDetail(@PathVariable int id, Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        Order order = orderService.getOrderById(id);
        if (order == null) return "redirect:/admin/orders";
        List<OrderDetail> details = orderDetailService.getByOrderId(id);
        model.addAttribute("order", order);
        model.addAttribute("details", details);
        return "admin/orderDetail";
    }

    @PostMapping("/admin/orders/updateStatus")
    public String updateStatus(@RequestParam int orderId,
                            @RequestParam String status,
                            HttpSession session) {
        if (!isAdmin(session)) return "redirect:/auth/login";
        orderService.updateStatus(orderId, status);
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
       

    
}