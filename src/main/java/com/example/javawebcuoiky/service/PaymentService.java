package com.example.javawebcuoiky.service;

import org.springframework.stereotype.Service;

import com.example.javawebcuoiky.model.Payment;
import com.example.javawebcuoiky.repository.PaymentRepository;

@Service
public class PaymentService {

    private final PaymentRepository paymentRepository;

    public PaymentService(PaymentRepository paymentRepository) {
        this.paymentRepository = paymentRepository;
    }

    public Payment createPayment(int orderId, String paymentMethod, double amount) {
        Payment payment = new Payment();
        payment.setId_order(orderId);
        payment.setPayment_method(paymentMethod);
        payment.setAmount(amount);

        // COD → chờ thu tiền | BANK → chờ chuyển khoản
        if ("COD".equals(paymentMethod)) {
            payment.setPayment_status("Chờ thu tiền");
        } else {
            payment.setPayment_status("Chờ chuyển khoản");
        }

        String now = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                         .format(new java.util.Date());
        payment.setPayment_date(now);
        payment.setCreated_at(now);
        payment.setTransaction_id("TXN-" + orderId + "-" + System.currentTimeMillis());
        payment.setNote("");

        return paymentRepository.save(payment);
    }

    // Lấy payment theo orderId — dùng cho trang QR
    public Payment getByOrderId(int orderId) {
        return paymentRepository.findByIdOrder(orderId);
    }

    // Cập nhật trạng thái thanh toán — dùng khi xác nhận QR giả lập
    public void updatePaymentStatus(int orderId, String status) {
        Payment payment = paymentRepository.findByIdOrder(orderId);
        if (payment != null) {
            payment.setPayment_status(status);
            paymentRepository.save(payment);
        }
    }
}