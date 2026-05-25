package com.example.javawebcuoiky.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.javawebcuoiky.model.User;

@Repository
public interface  UserRepository extends JpaRepository<User, Integer>{
    List<User> findByRole(int role);
    User findByEmail(String email);
}
