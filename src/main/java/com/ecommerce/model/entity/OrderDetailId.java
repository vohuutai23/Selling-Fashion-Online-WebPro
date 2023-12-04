package com.ecommerce.model.entity;

import org.hibernate.Hibernate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class OrderDetailId implements Serializable {
    private static final long serialVersionUID = 1L;
    @JoinColumn(name = "id_order", referencedColumnName = "id_order", insertable = false, updatable = false, nullable = false)

    @Column(name = "id_order", nullable = false)
    private Integer idOrder;

    @JoinColumn(name = "id_product", referencedColumnName = "id_product", insertable = false, updatable = false, nullable = false)

    @Column(name = "id_product", nullable = false)
    private Integer idProduct;


    public OrderDetailId()
    {

    }

    public OrderDetailId(Integer idOrder, Integer idProduct)
    {
        this.idOrder = idOrder;
        this.idProduct = idProduct;
    }
    public Integer getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(Integer idOrder) {
        this.idOrder = idOrder;
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
        OrderDetailId entity = (OrderDetailId) o;
        return Objects.equals(this.idOrder, entity.idOrder) &&
                Objects.equals(this.idProduct, entity.idProduct);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOrder, idProduct);
    }

}