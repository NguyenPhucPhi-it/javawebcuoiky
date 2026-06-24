package com.example.javawebcuoiky.service;

import com.example.javawebcuoiky.dto.ChatThreadDTO;
import com.example.javawebcuoiky.model.ChatMessage;
import com.example.javawebcuoiky.model.User;
import com.example.javawebcuoiky.repository.ChatMessageRepository;
import com.example.javawebcuoiky.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChatMessageService {
    private final ChatMessageRepository chatMessageRepository;
    private final UserRepository userRepository;

    public ChatMessageService(ChatMessageRepository chatMessageRepository, UserRepository userRepository) {
        this.chatMessageRepository = chatMessageRepository;
        this.userRepository = userRepository;
    }

    public ChatMessage saveMessage(int userId, String senderRole, String content) {
        ChatMessage m = new ChatMessage();
        m.setUserId(userId);
        m.setSenderRole(senderRole);
        m.setContent(content);
        return chatMessageRepository.save(m);
    }

    public List<ChatMessage> getHistory(int userId) {
        return chatMessageRepository.findByUserIdOrderByCreatedAtAsc(userId);
    }

    public List<ChatThreadDTO> getThreads() {
        List<Integer> userIds = chatMessageRepository.findDistinctUserIds();
        List<ChatThreadDTO> result = new ArrayList<>();
        for (Integer uid : userIds) {
            List<ChatMessage> history = chatMessageRepository.findByUserIdOrderByCreatedAtAsc(uid);
            if (history.isEmpty()) continue;
            ChatMessage last = history.get(history.size() - 1);
            User u = userRepository.findById(uid).orElse(null);
            String name = (u != null) ? u.getUsername() : ("User #" + uid); // đổi getUsername() nếu field khác
            result.add(new ChatThreadDTO(uid, name, last.getContent(), last.getCreatedAt()));
        }
        // sắp xếp mới nhất lên đầu
        result.sort((a, b) -> b.getLastTime().compareTo(a.getLastTime()));
        return result;
    }
}