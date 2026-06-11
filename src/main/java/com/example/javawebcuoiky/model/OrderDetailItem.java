package com.example.javawebcuoiky.model;

public class OrderDetailItem {
    private OrderDetail detail;
    private Product product;
    private Order order;

    public OrderDetailItem(OrderDetail detail, Product product, Order order) {
        this.detail  = detail;
        this.product = product;
        this.order   = order;
    }

    public OrderDetail getDetail()  { return detail; }
    public Product     getProduct() { return product; }
    public Order       getOrder()   { return order; }

    public double getLineTotal() {
        return detail.getQuantity() * detail.getUnitPrice();
    }
}