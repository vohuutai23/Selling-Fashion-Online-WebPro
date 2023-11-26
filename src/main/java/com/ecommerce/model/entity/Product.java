package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.Instant;

@Entity
@Table(name = "product")
@NamedQueries({ @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "Product.findByCategory", query = "SELECT p FROM Product p WHERE p.category.id = :categoryId"),
        @NamedQuery(name = "Product.search", query = "SELECT p FROM Product p WHERE p.nameProduct LIKE '%' || :keyword || '%' OR p.description LIKE '%' || :keyword || '%'"),
        @NamedQuery(name = "Product.findByTitle", query = "SELECT p FROM Product p WHERE p.nameProduct = :nameProduct"),
        @NamedQuery(name = "Product.findNew", query = "SELECT p FROM Product p ORDER BY p.postDate DESC")})
public class Product {
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_product", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_category")
    private Category category;

    @Size(max = 100)
    @Column(name = "name_product", length = 100)
    private String nameProduct;

    @Size(max = 100)
    @Column(name = "type", length = 100)
    private String type;

    @Lob
    @Column(name = "description")
    private String description;

    @Column(name = "image_product")
    private byte[] imageProduct;

    @Size(max = 20)
    @Column(name = "size", length = 20)
    private String size;

    @Column(name = "price")
    private Float price;

    @Column(name = "post_date")
    private Instant postDate;

    public Product() {
    }

    public Product(Integer productId) {
        super();
        this.id = productId;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    public Category getIdCategory() {
//        return idCategory;
//    }
//
//    public void setIdCategory(Category idCategory) {
//        this.idCategory = idCategory;
//    }
    public Category getCategory() {
        return this.category;
    }

    public void setCategory(Category category) {

        this.category = category;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(byte[] imageProduct) {
        this.imageProduct = imageProduct;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Instant getPostDate() {
        return postDate;
    }

    public void setPostDate(Instant postDate) {
        this.postDate = postDate;
    }

}