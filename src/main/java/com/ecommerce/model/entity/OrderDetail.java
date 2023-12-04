package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @EmbeddedId
//    private OrderDetailId id;
   /* @AttributeOverrides({ @AttributeOverride(name = "idOrder", column = @Column(name = "id_order")),
            @AttributeOverride(name = "idProduct", column = @Column(name = "id_product")) })*/
    private OrderDetailId id = new OrderDetailId();

    @MapsId("idOrder")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_order", nullable = false)
    private ProductOrder productOrder;

    @MapsId("idProduct")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_product", nullable = false)
    private Product product;

    @NotNull
    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @NotNull
    @Column(name = "total_price", nullable = false)
    private Float totalPrice;


    public OrderDetail() {
    }

    public OrderDetail(OrderDetailId id) {
        this.id = id;
    }

    public OrderDetail(OrderDetailId id, Product product, ProductOrder productOrder, int quantity, float totalPrice) {
        this.id = id;
        this.product = product;
        this.productOrder = productOrder;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }
    public OrderDetailId getId() {
        return id;
    }

    public void setId(OrderDetailId id) {
        this.id = id;
    }

    public ProductOrder getProductOrder() {
        return productOrder;
    }

    public void setProductOrder(ProductOrder ProductOrder) {

        this.productOrder = ProductOrder;
        this.id.setIdOrder(ProductOrder.getId());
    }

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {

        this.product = product;
        this.id.setIdProduct(product.getId());
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
    @Override
    public String toString() {
        return "OrderDetail{"+  productOrder.getId()+
                "product=" + product.getId() +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                // Thêm các trường khác bạn muốn hiển thị
                '}';
    }
}