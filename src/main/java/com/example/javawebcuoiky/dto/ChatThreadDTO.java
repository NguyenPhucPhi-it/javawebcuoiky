package com.example.javawebcuoiky.dto;

import java.time.LocalDateTime;

public class ChatThreadDTO {
    private int userId;
    private String userName;
    private String lastMessage;
    private LocalDateTime lastTime;

    public ChatThreadDTO(int userId, String userName, String lastMessage, LocalDateTime lastTime) {
        this.userId = userId;
        this.userName = userName;
        this.lastMessage = lastMessage;
        this.lastTime = lastTime;
    }
    public int getUserId() { return userId; }
    public String getUserName() { return userName; }
    public String getLastMessage() { return lastMessage; }
    public LocalDateTime getLastTime() { return lastTime; }
}