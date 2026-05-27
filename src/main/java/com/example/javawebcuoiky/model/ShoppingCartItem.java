package com.example.javawebcuoiky.model;

public class ShoppingCartItem {
    private ShoppingCart cart;
    private Product product;

    public ShoppingCartItem(ShoppingCart cart, Product product) {
        this.cart = cart;
        this.product = product;
    }

    public ShoppingCart getCart() { return cart; }
    public Product getProduct() { return product; }

    public double getSubtotal() {
        return cart.getPrice() * cart.getQuantity();
    }
}