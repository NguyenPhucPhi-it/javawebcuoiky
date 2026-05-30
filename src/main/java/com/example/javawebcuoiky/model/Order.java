package com.example.javawebcuoiky.model;

import java.sql.Time;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    private Time orderDate;
    private String status;
    private String receiverName;
    private String receiverEmail;
    private String receiverPhone;
    @Column(name = "id_user") 
    private int id_user;
    private String address;
    public Order() {
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Time getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Time orderDate) {
        this.orderDate = orderDate;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getReceiverName() {
        return receiverName;
    }
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }
    public String getReceiverEmail() {
        return receiverEmail;
    }
    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }
    public String getReceiverPhone() {
        return receiverPhone;
    }
    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }
    public int getId_user() {
        return id_user;
    }
    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
 
}
