package com.ecommerce.DAO;
import com.ecommerce.model.entity.Review;
import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class ReviewDAO extends JPADao<Review> implements iJPADao<Review>{
    @Override
    public Review create(Review review) {
        review.setTimeReview(Instant.now());
        return super.create(review);
    }

    @Override
    public Review update(Review review) {
        return super.update(review);
    }

    @Override
    public Review get(Object reviewId) {
        return super.find(Review.class, reviewId);
    }

    @Override
    public void delete(Object reviewId) {
        super.delete(Review.class, reviewId);
    }

    @Override
    public List<Review> listAll() {
        return super.findWithNamedQuery("Review.listAll");
    }

    @Override
    public long count() {
        return super.countWithNamedQuery("Review.countAll");
    }

    public Review findByCustomerAndProduct(Integer customerId, Integer productId) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("customerId", customerId);
        parameters.put("productId", productId);

        List<Review> result = super.findWithNamedQuery("Review.findByCustomerAndProduct", parameters);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }

    public long countByCustomer(int customerId) {
        return super.countWithNamedQuery("Review.countByCustomer", "customerId", customerId);
    }

    public List<Review> listMostRecent() {
        return super.findWithNamedQuery("Review.listAll", 0, 3);
    }

}
