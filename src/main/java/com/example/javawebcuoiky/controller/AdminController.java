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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.javawebcuoiky.model.Brand;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.BrandService;
import com.example.javawebcuoiky.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    private final ProductService productService;
    private final BrandService brandService;

    public AdminController(ProductService productService, BrandService brandService) {
        this.productService = productService;
        this.brandService = brandService;
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
    
       

    
}