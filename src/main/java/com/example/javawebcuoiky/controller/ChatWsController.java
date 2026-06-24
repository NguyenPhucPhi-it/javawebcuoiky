package com.example.javawebcuoiky.controller;

import com.example.javawebcuoiky.dto.ChatMessageDTO;
import com.example.javawebcuoiky.model.ChatMessage;
import com.example.javawebcuoiky.service.ChatMessageService;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class ChatWsController {
    private final ChatMessageService chatMessageService;
    private final SimpMessagingTemplate messagingTemplate;

    public ChatWsController(ChatMessageService chatMessageService, SimpMessagingTemplate messagingTemplate) {
        this.chatMessageService = chatMessageService;
        this.messagingTemplate = messagingTemplate;
    }

    @MessageMapping("/chat/{userId}")
    public void processMessage(@DestinationVariable int userId, ChatMessageDTO dto) {
        ChatMessage saved = chatMessageService.saveMessage(userId, dto.getSenderRole(), dto.getContent());

        // Gửi tới đúng thread (cả user và admin đang mở thread này đều nhận)
        messagingTemplate.convertAndSend("/topic/chat/" + userId, saved);

        // Báo cho admin biết có tin mới (để cập nhật sidebar danh sách thread)
        messagingTemplate.convertAndSend("/topic/chat/admin/notify", saved);
    }
}