package com.example.javawebcuoiky.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private int id;

    private String name;
    private int hot;
    private int quantity;
    private Double discount;

    @Column(name = "id_brand") 
    private int id_brand;

    private Double price;
    private String image;
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    public Product() {}

    public int getId() {
         return id; 
        }
    public void setId(int id) { 
        this.id = id;
     }

    public String getName() { 
        return name;
     }
    public void setName(String name) { 
        this.name = name; 
    }

    public int getHot() {
         return hot; 
        }
    public void setHot(int hot) { 
        this.hot = hot;
     }

    public int getQuantity() {
         return quantity; 
        }
    public void setQuantity(int quantity) { 
        this.quantity = quantity; 
    }

    public Double getDiscount() {
         return discount; 
        }
    public void setDiscount(Double discount) { 
        this.discount = discount; 
    }

    public int getId_brand() {
         return id_brand; 
        }
    public void setId_brand(int id_brand) {
         this.id_brand = id_brand;
         }

    public Double getPrice() { 
        return price; 
    }
    public void setPrice(Double price) {
         this.price = price; 
        }

    public String getImage() { 
        return image; 
    }
    public void setImage(String image) {
         this.image = image;
         }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}