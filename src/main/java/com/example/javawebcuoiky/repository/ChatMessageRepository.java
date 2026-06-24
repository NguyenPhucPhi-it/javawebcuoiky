package com.example.javawebcuoiky.repository;

import com.example.javawebcuoiky.model.ChatMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChatMessageRepository extends JpaRepository<ChatMessage, Long> {
    List<ChatMessage> findByUserIdOrderByCreatedAtAsc(int userId);

    @Query("SELECT DISTINCT c.userId FROM ChatMessage c")
    List<Integer> findDistinctUserIds();
}