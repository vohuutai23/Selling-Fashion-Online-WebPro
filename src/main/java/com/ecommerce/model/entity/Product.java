package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;
import java.util.Base64;

@Entity
@Table(name = "product")
@NamedQueries({ @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "Product.findByCategory", query = "SELECT p FROM Product p WHERE p.idCategory = :categoryId"),
        @NamedQuery(name = "Product.search", query = "SELECT p FROM Product p WHERE p.nameProduct LIKE '%' || :keyword || '%' OR p.description LIKE '%' || :keyword || '%'"),
        @NamedQuery(name = "Product.findByTitle", query = "SELECT p FROM Product p WHERE p.nameProduct = :nameProduct"),
        @NamedQuery(name = "Product.findNew", query = "SELECT p FROM Product p ORDER BY p.postDate DESC"),
        @NamedQuery(name = "Product.findByProductAndNewest", query = "SELECT p FROM Product p ORDER BY p.postDate DESC "),
        @NamedQuery(name = "Product.findByProductAndPriceDec", query = "SELECT p FROM Product p ORDER BY p.price DESC"),
        @NamedQuery(name = "Product.findByProductAndPriceInc", query = "SELECT p FROM Product p ORDER BY p.price ASC"),
        @NamedQuery(name = "Product.findByCategoryAndPriceInc", query = "SELECT p FROM Product p JOIN Category c ON p.idCategory = c.id AND c.id = :categoryId ORDER BY p.postDate DESC "),
        @NamedQuery(name = "Product.findByCategoryAndPriceDec", query = "SELECT p FROM Product p JOIN Category c ON p.idCategory = c.id AND c.id = :categoryId ORDER BY p.price DESC"),
        @NamedQuery(name = "Product.findByCategoryAndPriceInc", query = "SELECT p FROM Product p JOIN Category c ON p.idCategory = c.id AND c.id = :categoryId ORDER BY p.price ASC")})
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_product", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "id_category", nullable = false)
    private Integer idCategory;

    @Size(max = 100)
    @NotNull
    @Column(name = "name_product", nullable = false, length = 100)
    private String nameProduct;

    @NotNull
    @Lob
    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "image_product")
    private byte[] imageProduct;

    @NotNull
    @Column(name = "price", nullable = false)
    private Float price;

    @NotNull
    @Column(name = "post_date", nullable = false)
    private Instant postDate;

    @NotNull
    @Column(name = "update_date", nullable = false)
    private Instant updateDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(Integer idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
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

    public Instant getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Instant updateDate) {
        this.updateDate = updateDate;
    }


    public String getBase64Image() {
        // Kiểm tra nếu imageProduct không phải là null và chuyển đổi nó thành chuỗi Base64
        return this.imageProduct != null ? Base64.getEncoder().encodeToString(this.imageProduct) : "";
    }
}