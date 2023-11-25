package com.ecommerce.model.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "review")
@NamedQueries({ @NamedQuery(name = "Review.listAll", query = "SELECT r FROM Review r ORDER BY r.timeReview DESC"),
        @NamedQuery(name = "Review.countAll", query = "SELECT COUNT(r) FROM Review r"),
        @NamedQuery(name = "Review.countByCustomer", query = "SELECT COUNT(r.id) FROM Review r WHERE r.customer.id = :customerId")})
/*        @NamedQuery(name = "Review.countByCustomer", query = "SELECT COUNT(r.id) FROM Review r WHERE r.customer.customerId = :customerId"),
        @NamedQuery(name = "Review.findByCustomerAndProduct", query = "SELECT r FROM Review r WHERE r.product.active = TRUE AND r.customer.customerId = :customerId AND r.product.productId = :productId"),
        @NamedQuery(name = "Review.mostFavored", query = "SELECT r.product, COUNT(r.product.productId) AS ReviewCount, AVG(r.rating) as AvgRating FROM Review r WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= 4.0 ORDER BY ReviewCount DESC, AvgRating DESC"),
        @NamedQuery(name = "Review.mostFavoredFindByCategory", query = "SELECT r.product, COUNT(r.product.productId) AS ReviewCount, AVG(r.rating) as AvgRating FROM Review r JOIN Category c ON r.product.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= 4.0 ORDER BY ReviewCount DESC, AvgRating DESC"),
        @NamedQuery(name = "Review.listRated", query = "SELECT r.product, AVG(r.rating) as AvgRating FROM Review r WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= :ratingStars ORDER BY AvgRating DESC"),
        @NamedQuery(name = "Review.listRatedFindByCategory", query = "SELECT r.product, AVG(r.rating) as AvgRating FROM Review r JOIN Category c ON r.product.category.categoryId = c.categoryId AND c.categoryId = :categoryId WHERE r.product.active = TRUE GROUP BY r.product.productId HAVING AVG(r.rating) >= :ratingStars ORDER BY AvgRating DESC") })*/

public class Review {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id_review", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_customer")
    private Customer customer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_product")
    private Product product;

    @Column(name = "rating")
    private Float rating;

    @Size(max = 50)
    @Column(name = "comment", length = 50)
    private String comment;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "time_review")
    private Date timeReview;


    public Review() {
    }

    public Review(Customer customer, Product product, float rating, String comment, Date timeReview) {
        this.customer = customer;
        this.product = product;
        this.rating = rating;
        this.comment = comment;
        this.timeReview = timeReview;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product idProduct) {
        this.product = product;
    }

    public Float getRating() {
        return rating;
    }

    public void setRating(Float rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getTimeReview() {
        return this.timeReview;
    }

    public void setTimeReview(Date timeReview) {
        this.timeReview = timeReview;
    }

}