package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "Cart_detail")
@NamedQueries({@NamedQuery(name = "CartDetail.findAll", query = "SELECT cd FROM CartDetail cd"),
        @NamedQuery(name = "CartDetail.findByID", query = "SELECT cd FROM CartDetail cd WHERE cd.id =:cartDetailId"),
        @NamedQuery(name = "CartDetail.findByCartAndProduct",
                query = "SELECT cd FROM CartDetail cd WHERE cd.cart.id = :cartId AND cd.product.id = :productId"),
        @NamedQuery(
                name = "CartDetail.findByCart",
                query = "SELECT cd FROM CartDetail cd WHERE  cd.cart.id = :idCart"),
        @NamedQuery(
                name = "CartDetail.sumTotalPriceByCart",
                query = "SELECT SUM(cd.totalPrice) FROM CartDetail cd WHERE cd.cart.id = :idCart"
        )
})
public class CartDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    private CartDetailId id = new CartDetailId();

    @MapsId("cartId")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_cart", nullable = false)
    private Cart cart;

    @MapsId("productId")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
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
        return this.id;
    }

    public void setId(CartDetailId id) {
        this.id = id;
    }

    public Cart getCart() {
        return this.cart;
    }

    public void setCart(Cart cart) {

        this.cart = cart;
        //this.id.setCart(cart);
        this.id.setCartId(cart.getId());
    }
    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {
        this.product = product;
        // this.id.setProduct(product);
        this.id.setProductId(product.getId());
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
        return "CartDetail{"+ cart +
                "product=" + product.getId() +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                // Thêm các trường khác bạn muốn hiển thị
                '}';
    }
}