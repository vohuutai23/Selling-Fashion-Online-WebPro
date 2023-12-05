package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "Product_order")
@NamedQueries({
        @NamedQuery(name = "ProductOrder.findAll", query = "SELECT po FROM ProductOrder po"),
        @NamedQuery(name = "ProductOrder.countAll", query = "SELECT COUNT(*) FROM ProductOrder"),
        @NamedQuery(name = "ProductOrder.countByCustomer", query = "SELECT COUNT(po.orderId) FROM ProductOrder po WHERE po.customer.id = :customerId"),
        @NamedQuery(name = "ProductOrder.findByCustomer", query = "SELECT po FROM ProductOrder po WHERE po.customer.id = :customerId"),
        @NamedQuery(name = "ProductOrder.findByIdAndCustomer", query = "SELECT po FROM ProductOrder po WHERE po.orderId = :orderId AND po.customer.id = :customerId") })
public class ProductOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_order", nullable = false)
    private Integer orderId;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_customer", nullable = false)
    private Customer customer;

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
    private Date dateOrder;

    @Size(max = 30)
    @NotNull
    @Column(name = "status", nullable = false, length = 30)
    private String status;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "productOrder", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<OrderDetail> orderDetails = new LinkedHashSet<>();

    @Size(max = 50)
    @Column(name = "full_name", length = 50)
    private String fullName;

    @Size(max = 20)
    @Column(name = "phone", length = 20)
    private String phone;

    @Size(max = 50)
    @Column(name = "payment_method", length = 50)
    private String paymentMethod;

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }


    public ProductOrder() {
    }
    public Set<OrderDetail> getOrderDetails() {
        return this.orderDetails;
    }

    public void setOrderDetails(Set<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public Integer getId() {
        return orderId;
    }

    public void setId(Integer id) {
        this.orderId = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    @Override
    public String toString() {
        return "ProductOrder{" +
                "orderId=" + orderId +
                ", customer=" + (customer != null ? customer.getId() : null) + // Chỉ in ID của customer để tránh lấy tất cả thông tin khách hàng
                ", shippingAddress='" + shippingAddress + '\'' +
                ", fee=" + fee +
                ", totalPrice=" + totalPrice +
                ", dateOrder=" + dateOrder +
                ", status='" + status + '\'' +
                ", fullName='" + fullName + '\'' +
                ", phone='" + phone + '\'' +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", orderDetails=" + orderDetails + // Có thể cần phương thức toString() riêng cho OrderDetail
                '}';
    }

}