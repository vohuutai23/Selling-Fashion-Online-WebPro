package com.ecommerce.model.entity;

import com.ecommerce.model.entity.Product;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private final Map<Product, Integer> cart = new HashMap<>();

    public void addItem(Product product) {
        if (cart.containsKey(product)) {
            Integer quantity = cart.get(product) + 1;
            cart.put(product, quantity);
        } else {
            cart.put(product, 1);
        }
    }

    public void removeItem(Product product) {
        cart.remove(product);
    }

    public int getTotalQuantity() {
        int total = 0;

        for (Product next : cart.keySet()) {
            Integer quantity = cart.get(next);
            total += quantity;
        }

        return total;
    }

    public float getTotalAmount() {
        float total = 0.0f;

        for (Product product : cart.keySet()) {
            Integer quantity = cart.get(product);
            double subTotal = quantity * product.getPrice();
            total += subTotal;
        }

        return total;
    }

    public void updateCart(int[] productIds, int[] quantities) {
        for (int i = 0; i < productIds.length; i++) {
            Product key = new Product(productIds[i]);
            Integer value = quantities[i];
            cart.put(key, value);
        }
    }

    public void clear() {
        cart.clear();
    }

    public int getTotalItems() {
        return cart.size();
    }

    public Map<Product, Integer> getItems() {
        return this.cart;
    }
}
