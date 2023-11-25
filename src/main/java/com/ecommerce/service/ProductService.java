package com.ecommerce.service;

import com.ecommerce.DAO.ProductDAO;

import com.ecommerce.DAO.UserDAO;
import com.ecommerce.model.entity.Product;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


import static com.ecommerce.util.CommonUtil.forwardToPage;

public class ProductService {
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final ProductDAO productDAO;


    public ProductService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        productDAO = new ProductDAO();



    }

    public void listProduct() throws ServletException, IOException {
        listProduct(null);
    }

    public void listProduct(String message) throws ServletException, IOException {
        List<Product> listProducts = productDAO.listAll();
        System.out.println("Users: " + listProducts);
        request.setAttribute("listProducts", listProducts);

        if (message != null) {
            request.setAttribute("message", message);
        }

        forwardToPage("shop/list_product.jsp", message, request, response);
    }
}
