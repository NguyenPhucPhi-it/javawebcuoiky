package com.example.javawebcuoiky.dto;

public class ChatMessageDTO {
    private String senderRole;
    private String content;

    public String getSenderRole() { return senderRole; }
    public void setSenderRole(String senderRole) { this.senderRole = senderRole; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
}