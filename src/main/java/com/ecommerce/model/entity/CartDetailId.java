package com.ecommerce.model.entity;

import org.hibernate.Hibernate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CartDetailId implements Serializable {
//    private static final long serialVersionUID = 2561497485581998488L;
    private static final long serialVersionUID = 1L;

    /*@NotNull
    @Column(name = "id_cart", nullable = false)*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_cart", insertable = false, updatable = false, nullable = false)
    private Cart cart;

    /*@NotNull
    @Column(name = "id_product", nullable = false)*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_product", insertable = false, updatable = false, nullable = false)
    private Product product;

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        CartDetailId entity = (CartDetailId) o;
        return Objects.equals(this.cart, entity.cart) &&
                Objects.equals(this.product, entity.product);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cart, product);
    }

}