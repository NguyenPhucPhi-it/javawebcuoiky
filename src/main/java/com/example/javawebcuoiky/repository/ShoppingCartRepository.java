package com.example.javawebcuoiky.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.ShoppingCart;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {

    List<ShoppingCart> findByIdUser(int idUser);

    List<ShoppingCart> findBySessionId(String sessionId);

    Optional<ShoppingCart> findByIdUserAndIdProduct(int idUser, int idProduct);

    Optional<ShoppingCart> findBySessionIdAndIdProduct(String sessionId, int idProduct);
}