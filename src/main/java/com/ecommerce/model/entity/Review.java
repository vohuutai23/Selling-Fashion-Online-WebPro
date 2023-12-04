package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.Instant;

@Entity
@Table(name = "review")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_review", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "id_customer", nullable = false)
    private Integer idCustomer;

    @NotNull
    @Column(name = "id_product", nullable = false)
    private Integer idProduct;

    @NotNull
    @Column(name = "rating", nullable = false)
    private Integer rating;

    @Size(max = 50)
    @NotNull
    @Column(name = "comment", nullable = false, length = 50)
    private String comment;

    @NotNull
    @Column(name = "time_review", nullable = false)
    private Instant timeReview;


    public Review(int idCustomer, int idProduct){
        idCustomer = idCustomer;
        idProduct = idProduct;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Instant getTimeReview() {
        return timeReview;
    }

    public void setTimeReview(Instant timeReview) {
        this.timeReview = timeReview;
    }

}