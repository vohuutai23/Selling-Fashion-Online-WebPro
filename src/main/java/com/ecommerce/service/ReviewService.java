package com.ecommerce.service;

import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.DAO.ReviewDAO;
import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.Review;

import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static com.ecommerce.utility.CommonUtility.forwardToPage;
//import static com.ecommerce.utility.CommonUtility.messageForAdmin;

public class ReviewService {
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final ReviewDAO reviewDAO;

    public ReviewService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.reviewDAO = new ReviewDAO();
    }

    public void listReview() throws ServletException, IOException {
        listReview(null);
    }

    public void listReview(String message) throws ServletException, IOException {
        List<Review> listReviews = reviewDAO.listAll();

        request.setAttribute("listReviews", listReviews);

        forwardToPage("review_list.jsp", message, request, response);
    }

    public void editReview() throws ServletException, IOException {
        Integer reviewId = Integer.parseInt(request.getParameter("id"));
        Review review = reviewDAO.get(reviewId);

        if (review != null) {
            request.setAttribute("review", review);
            forwardToPage("review_form.jsp", request, response);
        }
//        } else {
//            messageForAdmin(String.format("Could not find the review with ID %s.", reviewId), request, response);
//        }
    }

    public void updateReview() throws ServletException, IOException {
        Integer reviewId = Integer.parseInt(request.getParameter("reviewId"));
        String headline = request.getParameter("headline");
        String comment = request.getParameter("comment");

        Review review = reviewDAO.get(reviewId);
//        review.setHeadline(headline);
        review.setComment(comment);

        reviewDAO.update(review);

        listReview("The review has been updated successfully.");
    }

    public void deleteReview() throws ServletException, IOException {
        Integer reviewId = Integer.parseInt(request.getParameter("id"));
        Review review = reviewDAO.get(reviewId);

        if (review != null) {
            reviewDAO.delete(reviewId);
            listReview("The review has been deleted successfully.");

//        } else {
//            messageForAdmin(
//                    String.format("Could not find the review with ID %s or it might have been deleted.", reviewId),
//                    request, response);
//        }
        }
    }

    public void showReviewForm() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("product_id"));
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.get(productId);

        HttpSession session = request.getSession();
        session.setAttribute("product", product);
        session.setAttribute("orderDetail", product);

        Customer customer = (Customer) session.getAttribute("loggedCustomer");

        Review existReview = reviewDAO.findByCustomerAndProduct(customer.getId(), productId);

        if (existReview != null) {
            request.setAttribute("review", existReview);
            forwardToPage("shop/review_info.jsp", request, response);

        } else {
            forwardToPage("shop/review_form.jsp", request, response);
        }
    }

    public void submitReview() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("productId"));
//        int rating = Integer.parseInt(request.getParameter("selectedRating"));
        int rating = 1;
//        String headline = request.getParameter("headline");
        String comment = request.getParameter("comment");
        int idcus = 1;
        int pro = 1;
        Review newReview = new Review(idcus, pro);
        newReview.setComment(comment);
        newReview.setRating(rating);

        Product product = new Product();
        product.setId(productId);
//        newReview.setIdProduct(product);

        Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
//        newReview.setCustomer(customer);

        reviewDAO.create(newReview);

        forwardToPage("shop/review_done.jsp", request, response);
    }

}
