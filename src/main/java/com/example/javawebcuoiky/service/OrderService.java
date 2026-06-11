package com.example.javawebcuoiky.service;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Order;
import com.example.javawebcuoiky.model.OrderDetail;
import com.example.javawebcuoiky.model.OrderDetailItem;
import com.example.javawebcuoiky.model.Product;
import com.example.javawebcuoiky.model.ShoppingCartItem;
import com.example.javawebcuoiky.repository.OrderRepository;
import com.example.javawebcuoiky.repository.ProductRepository;

@Service
public class OrderService {

    private final OrderRepository    orderRepository;
    private final OrderDetailService orderDetailService;
    private final ShoppingCartService cartService;
    private final PaymentService     paymentService;
    private final ProductRepository  productRepository; // ← thêm

    public OrderService(OrderRepository orderRepository,
                        OrderDetailService orderDetailService,
                        ShoppingCartService cartService,
                        PaymentService paymentService,
                        ProductRepository productRepository) { // ← thêm
        this.orderRepository    = orderRepository;
        this.orderDetailService = orderDetailService;
        this.cartService        = cartService;
        this.paymentService     = paymentService;
        this.productRepository  = productRepository; // ← thêm
    }

    public Order placeOrder(String receiverName, String receiverEmail,
                            String receiverPhone, String address,
                            String paymentMethod, int userId,
                            List<ShoppingCartItem> cartItems) {
        Order order = new Order();
        order.setReceiverName(receiverName);
        order.setReceiverEmail(receiverEmail);
        order.setReceiverPhone(receiverPhone);
        order.setAddress(address);
        order.setStatus("Chờ xác nhận");
        order.setId_user(userId);
        order.setOrderDate(new Time(System.currentTimeMillis()));
        Order savedOrder = orderRepository.save(order);

        double total = 0;
        for (ShoppingCartItem item : cartItems) {
            OrderDetail detail = new OrderDetail();
            detail.setId_order(savedOrder.getId());
            detail.setId_product(item.getProduct().getId());
            detail.setQuantity(item.getCart().getQuantity());
            detail.setUnitPrice(item.getCart().getPrice());
            detail.setDiscount(0);
            detail.setShippingFee(0);
            orderDetailService.save(detail);
            total += item.getSubtotal();
        }

        paymentService.createPayment(savedOrder.getId(), paymentMethod, total);

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

    public List<Order> getOrdersByUserId(int userId) {
        return orderRepository.findByUserId(userId);
    }

    // ← THÊM MỚI: lấy toàn bộ sản phẩm đã mua của user
    public List<OrderDetailItem> getPurchasedItems(int userId) {
        List<Order> orders = orderRepository.findByUserId(userId);
        List<OrderDetailItem> items = new ArrayList<>();
        for (Order order : orders) {
            List<OrderDetail> details = orderDetailService.getByOrderId(order.getId());
            for (OrderDetail d : details) {
                Product p = productRepository.findById(d.getId_product()).orElse(null);
                items.add(new OrderDetailItem(d, p, order));
            }
        }
        return items;
    }

    public boolean cancelOrder(int orderId, int userId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        if (order == null) return false;
        if (order.getId_user() != userId) return false;
        if (!"Chờ xác nhận".equals(order.getStatus())) return false;
        order.setStatus("Đã hủy");
        orderRepository.save(order);
        return true;
    }

    public boolean confirmReceived(int orderId, int userId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        if (order == null) return false;
        if (order.getId_user() != userId) return false;
        if (!"Thành công".equals(order.getStatus())) return false;
        order.setStatus("Đã nhận hàng");
        orderRepository.save(order);
        return true;
    }
    public List<com.example.javawebcuoiky.model.OrderDetailItem> getDetailItemsByOrderId(int orderId) {
    Order order = orderRepository.findById(orderId).orElse(null);
    List<OrderDetail> details = orderDetailService.getByOrderId(orderId);
    List<com.example.javawebcuoiky.model.OrderDetailItem> items = new ArrayList<>();
    for (OrderDetail d : details) {
        Product p = productRepository.findById(d.getId_product()).orElse(null);
        items.add(new com.example.javawebcuoiky.model.OrderDetailItem(d, p, order));
    }
    return items;
}
}