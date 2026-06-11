package com.example.javawebcuoiky.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
     @Query("SELECT o FROM Order o WHERE o.id_user = :userId ORDER BY o.id DESC")
    List<Order> findByUserId(int userId);
}