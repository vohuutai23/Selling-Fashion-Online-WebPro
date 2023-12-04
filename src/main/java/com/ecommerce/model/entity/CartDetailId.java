package com.ecommerce.model.entity;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CartDetailId implements Serializable {
    private static final long serialVersionUID = 1L;
    /*private static final long serialVersionUID = 2561497485581998488L;*/
    /*@NotNull
    @Column(name = "id_cart", nullable = false)*/
//    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_cart", referencedColumnName = "id_cart", insertable = false, updatable = false, nullable = false)
//    private Cart cart;
    private Integer cartId;

    /*@NotNull
    @Column(name = "id_product", nullable = false)*/
//    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_product", referencedColumnName = "id_product",insertable = false, updatable = false, nullable = false)
//    private Product product;
    private Integer productId;
    // Constructors
    public CartDetailId() {}

    public CartDetailId(Integer cartId, Integer productId) {
        this.cartId = cartId;
        this.productId = productId;
    }

    // Getters
    public Integer getCartId() {
        return cartId;
    }

    public Integer getProductId() {
        return productId;
    }

    // Setters
    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    // equals() and hashCode()
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartDetailId that = (CartDetailId) o;
        return Objects.equals(cartId, that.cartId) &&
                Objects.equals(productId, that.productId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cartId, productId);
    }
    /*public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        System.out.println("check product ben id" + product);
        this.product = product;
    }
*/
    /*@Override
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
    }*/
    @Override
    public String toString() {
        return "CartDetailID{"+ cartId +
                "product=" +  productId+


                // Thêm các trường khác bạn muốn hiển thị
                '}';}
}