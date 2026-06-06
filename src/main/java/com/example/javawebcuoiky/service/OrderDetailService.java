package com.example.javawebcuoiky.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.OrderDetail;
import com.example.javawebcuoiky.repository.OrderDetailRepository;

@Service
public class OrderDetailService {

    private final OrderDetailRepository orderDetailRepository;

    public OrderDetailService(OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
    }

    // Lưu một OrderDetail
    public OrderDetail save(OrderDetail orderDetail) {
        return orderDetailRepository.save(orderDetail);
    }

    // Lấy danh sách chi tiết theo orderId
    public List<OrderDetail> getByOrderId(int orderId) {
        return orderDetailRepository.findByIdOrder(orderId);
    }

    // Xóa theo id
    public void delete(int id) {
        orderDetailRepository.deleteById(id);
    }
     public void updateStatus(int detailId, String status) {
        OrderDetail detail = orderDetailRepository.findById(detailId).orElse(null);
        if (detail != null) {
            detail.setStatus(status);
            orderDetailRepository.save(detail);
        }
    }
}