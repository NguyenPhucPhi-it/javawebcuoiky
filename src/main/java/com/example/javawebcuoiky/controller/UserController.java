package com.example.javawebcuoiky.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.service.ProductService;




@Controller
public class UserController {
    private final ProductService productService;
    public UserController(ProductService productService){
        this.productService=productService;
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
                              @RequestParam(defaultValue = "9") int size) {

        Page<Product> productPage = productService.getProductByPage(page, size);
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        return "user/product";
    }

    @RequestMapping(value="/user/shoppingcart", method=RequestMethod.GET)
    public String showGioHang(Model model) {
        return "user/shoppingcart";
    }


    


    
    

    
}
