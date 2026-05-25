package com.example.javawebcuoiky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {
    @RequestMapping(value="/user/product", method=RequestMethod.GET)
    public String showProduct(Model model) {
        return "user/product";
    }
    @RequestMapping(value="/user/home", method=RequestMethod.GET)
    public String showHome(Model model) {
        return "user/home";
    }
    

    
}
