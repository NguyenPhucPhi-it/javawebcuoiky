package com.example.javawebcuoiky.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.repository.UserRepository;

@Service
public class UserSevice {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;  

    public UserSevice(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;     
    }


    public void save(User user) {
        String hashed = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashed);
        userRepository.save(user);
    }

  
    public User login(String email, String rawPassword) {
        User user = userRepository.findByEmail(email);
        if (user == null) return null;
        if (!passwordEncoder.matches(rawPassword, user.getPassword())) return null;
        return user;
    }

    public List<User> getAllroles(int role) {
        return userRepository.findAll();
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}