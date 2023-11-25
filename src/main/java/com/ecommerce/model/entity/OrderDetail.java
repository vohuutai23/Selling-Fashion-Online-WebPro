package com.ecommerce.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import java.time.Instant;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @Id
    @Column(name = "id_orderDetail", nullable = false)
    private Integer id;

    @Size(max = 50)
    @Column(name = "shipping_address", length = 50)
    private String shippingAddress;

    @Column(name = "fee")
    private Float fee;

    @Column(name = "total_price")
    private Float totalPrice;

    @Column(name = "date_order")
    private Instant dateOrder;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public Float getFee() {
        return fee;
    }

    public void setFee(Float fee) {
        this.fee = fee;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Instant getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Instant dateOrder) {
        this.dateOrder = dateOrder;
    }

}