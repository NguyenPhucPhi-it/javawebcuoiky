package com.example.javawebcuoiky.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Comment;
import com.example.javawebcuoiky.model.CommentAdminItem;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.repository.CommentRepository;

@Service
public class CommentService {

    private final CommentRepository commentRepository;

    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    // Lấy bình luận đã duyệt theo sản phẩm
    public List<Comment> getApprovedComments(int productId) {
        return commentRepository.findApprovedByProduct(productId);
    }

    // Kiểm tra đã đánh giá chưa
    public boolean hasReviewed(int userId, int productId, int orderId) {
        return !commentRepository.findByUserProductOrder(userId, productId, orderId).isEmpty();
    }

    // Lưu bình luận mới (status=0: chờ duyệt)
    public void saveComment(int userId, int productId, int orderId,
                            String message, int rating) {
        Comment c = new Comment();
        c.setId_user(userId);
        c.setId_product(productId);
        c.setId_order(orderId);
        c.setMessage(message);
        c.setRating(rating);
        c.setCreated_at(LocalDateTime.now());
        c.setStatus(0); // chờ admin duyệt
        commentRepository.save(c);
    }

    // Admin: lấy tất cả
    public List<Comment> getAllComments() {
        return commentRepository.findAll();
    }

    // Admin: duyệt / ẩn
    public void updateStatus(int id, int status) {
        Comment c = commentRepository.findById(id).orElse(null);
        if (c != null) {
            c.setStatus(status);
            commentRepository.save(c);
        }
    }
    public List<CommentAdminItem> getAllCommentItems(
        com.example.javawebcuoiky.repository.ProductRepository productRepository) {

    List<Comment> comments = commentRepository.findAll();
    List<CommentAdminItem> items = new java.util.ArrayList<>();
    for (Comment c : comments) {
        Product p = productRepository.findById(c.getId_product()).orElse(null);
        String name  = (p != null) ? p.getName()  : "SP #" + c.getId_product();
        String image = (p != null) ? p.getImage()  : "";
        items.add(new CommentAdminItem(c, name, image));
    }
    return items;
}
}