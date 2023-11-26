package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.Instant;
import java.util.*;
@Entity
@Table(name = "product")
@NamedQueries({ @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "Product.findActive", query = "SELECT p FROM Product p")})
public class Product {
    @Id
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
    private String base64Image;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category idCategory) {
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
   /* @OneToMany(fetch = FetchType.EAGER, mappedBy = "product")
    public Set<Review> getReviews() {
        TreeSet<Review> sortedReviews = new TreeSet<>(
                (review1, review2) -> review2.getReviewTime().compareTo(review1.getReviewTime()));
        sortedReviews.addAll(reviews);
        return sortedReviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
    public Set<OrderDetail> getOrderDetails() {
        return this.orderDetails;
    }

    public void setOrderDetails(Set<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }*/

    @Transient
    public String getBase64Image() {
        this.base64Image = Base64.getEncoder().encodeToString(this.imageProduct);
        return this.base64Image;
    }

    @Transient
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Product product = (Product) o;
        return id.equals(product.id);
    }

    /*@Override
    public int hashCode() {
        return Objects.hash(productId);
    }*/
}