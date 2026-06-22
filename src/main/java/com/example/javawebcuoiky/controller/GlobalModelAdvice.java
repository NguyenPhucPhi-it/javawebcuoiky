package com.example.javawebcuoiky.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.ShoppingCartService;

import jakarta.servlet.http.HttpSession;

@ControllerAdvice
public class GlobalModelAdvice {

    private final ShoppingCartService cartService;

    public GlobalModelAdvice(ShoppingCartService cartService) {
        this.cartService = cartService;
    }

    @ModelAttribute("cartCount")
    public int cartCount(HttpSession session) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        return cartService.countCartItems(loggedUser, session.getId());
    }
}