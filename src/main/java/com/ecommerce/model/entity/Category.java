package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "category")
@NamedQueries({ @NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c"),
        @NamedQuery(name = "Category.listNameCategoryByGroup", query = "SELECT c.nameCategory FROM Category c WHERE c.groupCategory = :groupCategory"),
        @NamedQuery(name = "Category.findDistinctGroupCategories",
                query = "SELECT DISTINCT c.groupCategory FROM Category c"),
        @NamedQuery(
                name = "Category.findByNameAndGroup",
                query = "SELECT c FROM Category c WHERE c.nameCategory = :nameCategory AND c.groupCategory = :groupCategory"
        ),
        @NamedQuery(name = "Category.findNameCategory", query = "SELECT c FROM Category c WHERE c.nameCategory = :nameCategory"),
        @NamedQuery(name = "Category.countAll", query = "SELECT COUNT(c) FROM Category c"),
        @NamedQuery(name = "Category.findByName", query = "SELECT c FROM Category c WHERE c.nameCategory = :nameCategory") })
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



    @Size(max = 30)
    @NotNull
    @Column(name = "group_category", nullable = false, length = 30)
    private String groupCategory;

    public String getGroupCategory() {
        return groupCategory;
    }

    public void setGroupCategory(String groupCategory) {
        this.groupCategory = groupCategory;
    }



    public Category()
    {

    }
    public Category(String nameCategory, String groupCategory) {
        this.nameCategory = nameCategory;
        this.groupCategory = groupCategory;
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