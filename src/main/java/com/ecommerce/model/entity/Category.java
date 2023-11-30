package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "category")
@NamedQueries({ @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c"),
        @NamedQuery(name = "Category.countAll", query = "SELECT COUNT(c) FROM Category c"),
        @NamedQuery(name = "Category.findByName", query = "SELECT c FROM Category c WHERE c.detailCategory = :detailCategory") })
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_category", nullable = false)
    private Integer id;

    @Size(max = 30)
    @Column(name = "name_category", length = 30)
    private String nameCategory;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
    private Set<Product> products = new LinkedHashSet<>();

    @Size(max = 50)
    @Column(name = "detail_category", length = 50)
    private String detailCategory;

    public String getDetailCategory() {
        return detailCategory;
    }

    public void setDetailCategory(String detailCategory) {
        this.detailCategory = detailCategory;
    }


    public Category()
    {

    }
    public Category(String nameCategory, String detailCategory) {
        this.nameCategory = nameCategory;
        this.detailCategory = detailCategory;
    }

    public Category(String nameCategory, Set<Product> products) {
        this.nameCategory = nameCategory;
        this.products = products;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

}