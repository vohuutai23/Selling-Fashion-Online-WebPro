package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;

@Entity
@Table(name = "product_order")
public class ProductOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_order", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_customer", nullable = false)
    private Customer idCustomer;

    @Size(max = 50)
    @NotNull
    @Column(name = "shipping_address", nullable = false, length = 50)
    private String shippingAddress;

    @NotNull
    @Column(name = "fee", nullable = false)
    private Float fee;

    @NotNull
    @Column(name = "total_price", nullable = false)
    private Float totalPrice;

    @NotNull
    @Column(name = "date_order", nullable = false)
    private Instant dateOrder;

    @Size(max = 30)
    @NotNull
    @Column(name = "status", nullable = false, length = 30)
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(Customer idCustomer) {
        this.idCustomer = idCustomer;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}