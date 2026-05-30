package com.example.javawebcuoiky.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
  
    @Query("SELECT p FROM Product p WHERE p.id_brand = :brandId")
    Page<Product> findByBrandId(@Param("brandId") int brandId, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.price BETWEEN :min AND :max")
    Page<Product> findByPriceBetween(@Param("min") double min, @Param("max") double max, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.id_brand = :brandId AND p.price BETWEEN :min AND :max")
    Page<Product> findByBrandIdAndPriceBetween(@Param("brandId") int brandId,
                                               @Param("min") double min,
                                               @Param("max") double max,
                                               Pageable pageable);
    
    

}