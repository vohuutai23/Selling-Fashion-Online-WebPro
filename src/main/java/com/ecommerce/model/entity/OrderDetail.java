package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @EmbeddedId
    private OrderDetailId id;

    @MapsId("idOrder")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_order", nullable = false)
    private ProductOrder idOrder;

    @MapsId("idProduct")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_product", nullable = false)
    private Product idProduct;

    @NotNull
    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @NotNull
    @Column(name = "total_price", nullable = false)
    private Float totalPrice;

    public OrderDetailId getId() {
        return id;
    }

    public void setId(OrderDetailId id) {
        this.id = id;
    }

    public ProductOrder getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(ProductOrder idOrder) {
        this.idOrder = idOrder;
    }

    public Product getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Product idProduct) {
        this.idProduct = idProduct;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

}