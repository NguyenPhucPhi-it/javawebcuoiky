package com.example.javawebcuoiky.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    // san pham moi
    @Query("SELECT p FROM Product p ORDER BY p.id DESC")
    List<Product> findNewProducts(Pageable pageable);
    // san pham khuyen mai 
    @Query("SELECT p FROM Product p WHERE p.discount>0")
    List<Product> findSaleProducts(Pageable pageable);
    // san pham hot
    
}