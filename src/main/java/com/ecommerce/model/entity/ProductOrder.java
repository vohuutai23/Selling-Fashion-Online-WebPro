package com.ecommerce.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "product_order")
public class ProductOrder {
    @EmbeddedId
    private ProductOrderId id;

    @MapsId("idOrderdetail")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_orderDetail", nullable = false)
    private OrderDetail idOrderdetail;

    @MapsId("idProduct")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_product", nullable = false)
    private Product idProduct;

    @Column(name = "quantity")
    private Integer quantity;

    public ProductOrderId getId() {
        return id;
    }

    public void setId(ProductOrderId id) {
        this.id = id;
    }

    public OrderDetail getIdOrderdetail() {
        return idOrderdetail;
    }

    public void setIdOrderdetail(OrderDetail idOrderdetail) {
        this.idOrderdetail = idOrderdetail;
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

}