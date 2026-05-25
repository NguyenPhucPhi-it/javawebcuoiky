package com.example.javawebcuoiky.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.repository.UserRepository;

@Service
public class UserSevice {
    private final UserRepository userRepository;
    public UserSevice(UserRepository userRepository){
        this.userRepository=userRepository;
    }
    public void save(User user){
        userRepository.save(user);
    }
    public List<User> getAllroles(int role){
        return userRepository.findAll();
    }
    public  User findByEmail(String email){
        return userRepository.findByEmail(email);
    }
    

}
