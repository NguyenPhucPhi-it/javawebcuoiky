package com.example.javawebcuoiky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.service.UserSevice;


@Controller
public class AuthController {
    private final UserSevice userSevice;
    AuthController(UserSevice userSevice) {
        this.userSevice = userSevice;
    }

    @RequestMapping("/auth/login")
    public String showLogin() {
        return "auth/login";
    }
   
    @RequestMapping("/auth/register")
    public String showRegister() {
        return "auth/register";
    }

    @RequestMapping(value="/auth/register", method=RequestMethod.POST)
    public String saveRegister(@ModelAttribute User user,Model model) {
        user.setRole(0);
       this.userSevice.save(user);
        return "redirect:/auth/login";
    } 
    @RequestMapping(value="/auth/login", method=RequestMethod.POST)
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        Model model) {
                            User user=userSevice.findByEmail(email);
        if( user==null || !user.getPassword().equals(password)){
            model.addAttribute("error","Sai email or pass");
            return "auth/login";

        }
        if(user.getRole()==0){
            return "redirect:/user/home"; 
        }else{
            return "admin/dashboard";
            //  return "redirect:/admin/dashboard";
        }
        
    }
    
  
    
}
