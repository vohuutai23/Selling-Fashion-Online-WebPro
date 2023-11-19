package com.ecommerce.model.entity;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ProductOrderId implements Serializable {
    private static final long serialVersionUID = -722649907570787238L;
    @NotNull
    @Column(name = "id_orderDetail", nullable = false)
    private Integer idOrderdetail;

    @NotNull
    @Column(name = "id_product", nullable = false)
    private Integer idProduct;

    public Integer getIdOrderdetail() {
        return idOrderdetail;
    }

    public void setIdOrderdetail(Integer idOrderdetail) {
        this.idOrderdetail = idOrderdetail;
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
        ProductOrderId entity = (ProductOrderId) o;
        return Objects.equals(this.idOrderdetail, entity.idOrderdetail) &&
                Objects.equals(this.idProduct, entity.idProduct);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOrderdetail, idProduct);
    }

}