package com.example.javawebcuoiky.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer> {

    @Query("SELECT p FROM Payment p WHERE p.id_order = :orderId")
    Payment findByIdOrder(@Param("orderId") int orderId);
}