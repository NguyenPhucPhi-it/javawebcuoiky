package com.example.javawebcuoiky.controller;

import com.example.javawebcuoiky.dto.ChatThreadDTO;
import com.example.javawebcuoiky.model.ChatMessage;
import com.example.javawebcuoiky.service.ChatMessageService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/chat")
public class ChatApiController {
    private final ChatMessageService chatMessageService;

    public ChatApiController(ChatMessageService chatMessageService) {
        this.chatMessageService = chatMessageService;
    }

    @GetMapping("/history/{userId}")
    public List<ChatMessage> history(@PathVariable int userId) {
        return chatMessageService.getHistory(userId);
    }

    @GetMapping("/threads")
    public List<ChatThreadDTO> threads() {
        return chatMessageService.getThreads();
    }
}