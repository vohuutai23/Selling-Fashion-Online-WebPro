package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "cart_detail")
@NamedQueries({
        @NamedQuery(name = "CartDetail.findByCustomer", query = "SELECT DISTINCT cd.p FROM CartDetail cd WHERE cd.cart.customer.id = :customerId GROUP BY cd.product.id")})
public class CartDetail {
    @EmbeddedId
    @AttributeOverrides({ @AttributeOverride(name = "", column = @Column(name = "id_cart")),
            @AttributeOverride(name = "idProduct", column = @Column(name = "id_product")) })
    private CartDetailId id = new CartDetailId();

//    @MapsId("idCart")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_cart", nullable = false)
    private Cart cart;

//    @MapsId("idProduct")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_product", nullable = false)
    private Product product;

    @NotNull
    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @NotNull
    @Column(name = "total_price", nullable = false)
    private Float totalPrice;


    public CartDetail() {
    }

    public CartDetail(CartDetailId id) {
        this.id = id;
    }

    public CartDetail(CartDetailId id, Product product, Cart cart, int quantity, float totalPrice) {
        this.id = id;
        this.product = product;
        this.cart = cart;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }
    public CartDetailId getId() {
        return id;
    }

    public void setId(CartDetailId id) {
        this.id = id;
    }

    public Cart getCart() {
        return this.cart;
    }

    public void setCart(Cart cart) {

        this.cart = cart;
        this.id.setCart(cart);
    }

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {

        this.product = product;
        this.id.setProduct(product);
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