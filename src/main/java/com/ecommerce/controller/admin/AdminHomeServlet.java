package com.ecommerce.controller.admin;
import static com.ecommerce.util.CommonUtil.forwardToPage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;

import com.ecommerce.DAO.*;

@WebServlet(name = "AdminHomeServlet", value = "/admin/")
public class AdminHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        OrderDAO orderDAO = new OrderDAO();
        ReviewDAO reviewDAO = new ReviewDAO();
        ProductDAO productDAO = new ProductDAO();
        CustomerDAO customerDAO = new CustomerDAO();


        long totalUsers = userDAO.count();
        long totalProducts = productDAO.count();
        long totalCustomers = customerDAO.count();
//        long totalReviews = reviewDAO.count();
        long totalOrders = orderDAO.count();
        float totalPrice = orderDAO.sumTotalPrice();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalCustomers", totalCustomers);
//        request.setAttribute("totalReviews", totalReviews);
        request.setAttribute("totalOrders", totalOrders);

        request.setAttribute("totalPrice", totalPrice);
        forwardToPage("index.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
