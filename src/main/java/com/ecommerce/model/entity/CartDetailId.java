package com.ecommerce.model.entity;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CartDetailId implements Serializable {
    private static final long serialVersionUID = 2561497485581998488L;
    @NotNull
    @Column(name = "id_cart", nullable = false)
    private Integer idCart;

    @NotNull
    @Column(name = "id_product", nullable = false)
    private Integer idProduct;

    public Integer getIdCart() {
        return idCart;
    }

    public void setIdCart(Integer idCart) {
        this.idCart = idCart;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        CartDetailId entity = (CartDetailId) o;
        return Objects.equals(this.idCart, entity.idCart) &&
                Objects.equals(this.idProduct, entity.idProduct);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idCart, idProduct);
    }

}