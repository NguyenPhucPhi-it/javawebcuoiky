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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.javawebcuoiky.model.Brand;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.service.BrandService;
import com.example.javawebcuoiky.service.ProductService;
@Controller
public class AdminController {

    private final ProductService productService;

    private final BrandService brandService;

    public AdminController(ProductService productService, BrandService brandService) {
        this.productService = productService;
        this.brandService = brandService;
    }
    @RequestMapping(value = "/admin/products", method = RequestMethod.GET)
    public String showProduct(Model model) {
    List<Product> products = productService.getAllProducts();
    List<Brand> brands = brandService.getAllBrands();

    // Tạo map id → tên brand
    Map<Integer, String> brandMap = new HashMap<>();
    for (Brand b : brands) {
        brandMap.put(b.getId(), b.getBrandName());
    }

    model.addAttribute("products", products);
    model.addAttribute("brandMap", brandMap);
    return "admin/products";
}
    @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
    public String showDashboard(Model model) {
        return "admin/dashboard";
    }

    @RequestMapping(value = "/admin/products/add", method = RequestMethod.GET)
    public String showAddProduct(Model model) {
        model.addAttribute("product", new Product());
         model.addAttribute("brands", brandService.getAllBrands());
        return "admin/addProduct";
    }

    // luu sp
    @RequestMapping(value = "/admin/products/add", method = RequestMethod.POST)
    public String addProducts(@ModelAttribute Product product,
                              @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

        String uploadDir = "src/main/webapp/assets/uploads/";
        Path uploadPath = Paths.get(uploadDir);

        if (!imageFile.isEmpty()) {
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
            Files.copy(imageFile.getInputStream(),
                       uploadPath.resolve(fileName),
                       StandardCopyOption.REPLACE_EXISTING);
            product.setImage(fileName);
        }

        productService.saveProduct(product);
        return "redirect:/admin/products";
    }
    // 1. Danh sách brands
    @RequestMapping(value = "/admin/brands", method = RequestMethod.GET)
    public String showBrands(Model model) {
        List<Brand> brands = brandService.getAllBrands();
        model.addAttribute("brands", brands);
        return "admin/brands";
    }

    // 2. Hiển thị form thêm brand (GET)
    @RequestMapping(value = "/admin/brands/add", method = RequestMethod.GET)
    public String showAddBrandForm(Model model) {
        model.addAttribute("brand", new Brand());
        return "admin/addBrand";
    }

    // brand
    @RequestMapping(value = "/admin/brands/add", method = RequestMethod.POST)
    public String addBrand(@ModelAttribute Brand brand) {
        brandService.saveBrand(brand);
        return "redirect:/admin/brands";
    }

        
}