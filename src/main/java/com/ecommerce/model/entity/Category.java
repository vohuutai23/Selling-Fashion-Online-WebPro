package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "category")
@NamedQueries({ @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c ORDER BY c.nameCategory")})
//        @NamedQuery(name = "Category.countAll", query = "SELECT COUNT(c) FROM Category c"),
//        @NamedQuery(name = "Category.findByName", query = "SELECT c FROM Category c WHERE c.name = :categoryName") })
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