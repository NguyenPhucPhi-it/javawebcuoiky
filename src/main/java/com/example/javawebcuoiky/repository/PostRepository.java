package com.example.javawebcuoiky.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {
}