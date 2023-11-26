package com.ecommerce.model.entity;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CartId implements Serializable {
    private static final long serialVersionUID = 5326685262579512102L;
    @NotNull
    @Column(name = "id_customer", nullable = false)
    private Integer idCustomer;

    @NotNull
    @Column(name = "id_product", nullable = false)
    private Integer idProduct;

    public Integer getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(Integer idCustomer) {
        this.idCustomer = idCustomer;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        CartId entity = (CartId) o;
        return Objects.equals(this.idProduct, entity.idProduct) &&
                Objects.equals(this.idCustomer, entity.idCustomer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProduct, idCustomer);
    }

}