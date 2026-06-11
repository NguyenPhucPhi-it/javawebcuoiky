package com.example.javawebcuoiky.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    private String message;
    private int rating;
    private LocalDateTime  created_at;
    @Column(name = "id_user") 
    private int id_user;
    @Column(name = "id_product") 
    private int id_product;
    @Column(name = "id_order") 
    private int id_order;
    private int status;
    public Comment() {
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }
    public LocalDateTime getCreated_at() {
        return created_at;
    }
    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }
    public int getId_user() {
        return id_user;
    }
    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
    public int getId_product() {
        return id_product;
    }
    public void setId_product(int id_product) {
        this.id_product = id_product;
    }
    public int getId_order() {
        return id_order;
    }
    public void setId_order(int id_order) {
        this.id_order = id_order;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    


}
