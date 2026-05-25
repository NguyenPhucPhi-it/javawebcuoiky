package com.example.javawebcuoiky.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;


@Entity
@Table(name="User")
public class User {
    
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank(message = "name khong duoc de trong")
    private String username;
    @NotBlank(message="password kong duoc trong")
    @Size(min=6, max=20, message="6-20 ky tu")
    private String password;
    private int role=0;
     @NotBlank(message = "email khong duoc de trong ")
    private String email;
    public User() {
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
   public String getUsername() { 
     return username; 
    }
    public void setUsername(String username) { 
     this.username = username; 
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getRole() {
        return role;
    }
    public void setRole(int role) {
        this.role = role;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    




}
