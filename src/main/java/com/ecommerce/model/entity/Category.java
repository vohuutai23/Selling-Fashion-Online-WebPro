package com.ecommerce.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @Column(name = "id_category", nullable = false)
    private Integer idCategory;

    @Size(max = 30)
    @Column(name = "name_category", length = 30)
    private String nameCategory;

    public Integer getId() {
        return idCategory;
    }

    public void setId(Integer id) {
        this.idCategory = id;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

}