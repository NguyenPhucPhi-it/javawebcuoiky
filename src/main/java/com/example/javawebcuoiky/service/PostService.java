package com.example.javawebcuoiky.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Post;
import com.example.javawebcuoiky.repository.PostRepository;

@Service
public class PostService {
    private final PostRepository postRepository;

    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }

    public Post getPostById(int id) {
        return postRepository.findById(id).orElse(null);
    }

    public Post savePost(Post post) {
        return postRepository.save(post);
    }

    public void deletePost(int id) {
        postRepository.deleteById(id);
    }
}