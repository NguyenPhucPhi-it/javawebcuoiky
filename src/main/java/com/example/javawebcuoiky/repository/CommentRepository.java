package com.example.javawebcuoiky.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

    @Query("SELECT c FROM Comment c WHERE c.id_product = :productId AND c.status = 1")
    List<Comment> findApprovedByProduct(int productId);

    @Query("SELECT c FROM Comment c WHERE c.id_user = :userId AND c.id_product = :productId AND c.id_order = :orderId")
    List<Comment> findByUserProductOrder(int userId, int productId, int orderId);
}