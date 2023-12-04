package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "cart")
@NamedQueries({ @NamedQuery(
        name = "Cart.findByNameAndGroup",
        query = "SELECT c FROM Cart c WHERE c.id = :idCart AND c.customer.id = :idCustomer"),
        @NamedQuery(
                name = "Cart.findByCustomer",
                query = "SELECT c FROM Cart c WHERE  c.customer.id = :idCustomer"),

         })
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cart", nullable = false)
    private Integer id;

    @NotNull
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_customer", nullable = false)
    private Customer customer;

    @NotNull
    @Column(name = "total_price", nullable = false)
    private Float totalPrice;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "cart" , cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CartDetail> cartDetails = new HashSet<>(0);
//    private Set<CartDetail> cartDetails = new LinkedHashSet<>();

    public Set<CartDetail> getCartDetails() {

        return this.cartDetails;
    }

    public void setCartDetails(Set<CartDetail> cartDetails) {
        this.cartDetails = cartDetails;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", idcus='" + customer.getId() + '\'' +
                ", price=" + totalPrice +
                // Thêm các trường khác bạn muốn hiển thị
                '}';
    }
}