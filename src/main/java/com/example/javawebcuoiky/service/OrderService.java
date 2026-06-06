package com.example.javawebcuoiky.service;

import java.sql.Time;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Order;
import com.example.javawebcuoiky.model.OrderDetail;
import com.example.javawebcuoiky.model.ShoppingCartItem;
import com.example.javawebcuoiky.repository.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailService orderDetailService;
    private final ShoppingCartService cartService;

    public OrderService(OrderRepository orderRepository,
                        OrderDetailService orderDetailService,
                        ShoppingCartService cartService) {
        this.orderRepository = orderRepository;
        this.orderDetailService = orderDetailService;
        this.cartService = cartService;
    }

    public Order placeOrder(String receiverName,
                            String receiverEmail,
                            String receiverPhone,
                            String address,
                            int userId,
                            List<ShoppingCartItem> cartItems) {

        // 1. Lưu Order
        Order order = new Order();
        order.setReceiverName(receiverName);
        order.setReceiverEmail(receiverEmail);
        order.setReceiverPhone(receiverPhone);
        order.setAddress(address);
        order.setStatus("Chờ xác nhận");
        order.setId_user(userId);
        order.setOrderDate(new Time(System.currentTimeMillis()));
        Order savedOrder = orderRepository.save(order);

        // 2. Lưu OrderDetail từng sản phẩm
        for (ShoppingCartItem item : cartItems) {
            OrderDetail detail = new OrderDetail();
            detail.setId_order(savedOrder.getId());
            detail.setId_product(item.getProduct().getId());
            detail.setQuantity(item.getCart().getQuantity());
            detail.setUnitPrice(item.getCart().getPrice());
            detail.setDiscount(0);
            detail.setShippingFee(0);
            orderDetailService.save(detail);
        }

        // 3. Xóa giỏ hàng
        for (ShoppingCartItem item : cartItems) {
            cartService.removeFromCart(item.getCart().getId());
        }

        return savedOrder;
    }
    public List<Order> getAllOrders() {
    return orderRepository.findAll();
}

public Order getOrderById(int id) {
    return orderRepository.findById(id).orElse(null);
}

public void updateStatus(int orderId, String status) {
    Order order = orderRepository.findById(orderId).orElse(null);
    if (order != null) {
        order.setStatus(status);
        orderRepository.save(order);
    }
}
}