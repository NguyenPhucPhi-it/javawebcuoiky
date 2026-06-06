package com.example.javawebcuoiky.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="OrderDetail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;
    private int quantity;
    private double unitPrice;
    private double discount;
    private double shippingFee;
    @Column(name = "id_product") 
    private int id_product;
    @Column(name = "id_order") 
    private int id_order;
     private String status = "Chờ xác nhận";
    public OrderDetail() {
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
    public double getDiscount() {
        return discount;
    }
    public void setDiscount(double discount) {
        this.discount = discount;
    }
    public double getShippingFee() {
        return shippingFee;
    }
    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
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
     public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
