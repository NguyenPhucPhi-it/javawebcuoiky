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

import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.ShoppingCartItem;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.ProductService;
import com.example.javawebcuoiky.service.ShoppingCartService;

import jakarta.servlet.http.HttpSession;




@Controller
public class UserController {
    private final ProductService productService;
    private final ShoppingCartService cartService;
    public UserController(ProductService productService,ShoppingCartService cartService){
        this.productService=productService;
        this.cartService = cartService;
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
                            HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        cartService.addToCart(loggedUser, session.getId(), productId, quantity);
        return "redirect:/user/shoppingcart";
    }
    // ───── Xóa khỏi giỏ ─────
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
    
    
}
