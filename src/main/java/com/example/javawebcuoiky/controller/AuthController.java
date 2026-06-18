package com.example.javawebcuoiky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.ShoppingCartService;
import com.example.javawebcuoiky.service.UserSevice;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {
    
    private final UserSevice userSevice;
    private final ShoppingCartService cartService;
    AuthController(UserSevice userSevice, ShoppingCartService cartService) {
        this.userSevice = userSevice;
        this.cartService = cartService;
    }

   
    @GetMapping("/auth/login")
    public String showLogin(HttpSession session) {
        User u = (User) session.getAttribute("loggedUser");
        if (u != null) {
            return u.getRole() == 1 ? "redirect:/admin/dashboard" : "redirect:/user/home";
        }
        return "auth/login";
    }

    @PostMapping("/auth/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        Model model,
                        HttpSession session) {
        User user = userSevice.findByEmail(email);

        if (user == null || !user.getPassword().equals(password)) {
            model.addAttribute("error", "Sai email hoặc mật khẩu");
            return "auth/login";
        }
         String oldSessionId = session.getId(); // lấy sessionId trước khi gán user
         cartService.mergeSessionCart(oldSessionId, user);

        session.setAttribute("loggedUser", user);

        return user.getRole() == 1 ? "redirect:/admin/dashboard" : "redirect:/user/home";
    }

    @GetMapping("/auth/register")
    public String showRegister(HttpSession session) {
        if (session.getAttribute("loggedUser") != null) return "redirect:/user/home";
        return "auth/register";
    }

    @PostMapping("/auth/register")
    public String saveRegister(@ModelAttribute User user) {
        user.setRole(0);
        userSevice.save(user);
        return "redirect:/auth/login";
    }

    @GetMapping("/auth/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user/home";
    }
}