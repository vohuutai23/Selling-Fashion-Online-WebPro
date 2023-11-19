package com.ecommerce.service;


import com.ecommerce.DAO.CategoryDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.Category;
import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static com.ecommerce.utility.CommonUtility.*;
import static com.ecommerce.utility.CommonUtility.forwardToPage;

public class ProductService {
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final ProductDAO productDAO;
    private final CategoryDAO categoryDAO;

    public ProductService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
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

    public void listProductByCategory() throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
//        int categoryId = 1;
//        Category category = categoryDAO.get(categoryId);
        List<Product> listProducts = productDAO.listByCategory(categoryId);

//        System.out.println("Number of products: " + listProducts.size()); // In số lượng sản phẩm để kiểm tra
//        for (Product product : listProducts) {
//            System.out.println("Product ID: " + product.getId());
//            System.out.println("Product Name: " + product.getNameProduct());
//            System.out.println("Product Price: " + product.getPrice());
//            // ... In thông tin khác của sản phẩm nếu cần
//        }

        request.setAttribute("listProducts", listProducts);
//        request.setAttribute("listCategories", listCategories);
//        request.setAttribute("category", category);

        forwardToPage("shop/product_by_category.jsp", request, response);
    }
    public void viewProductDetail() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("id"));
//        Integer productId = 1;
        Product product = productDAO.get(productId);

        request.setAttribute("product", product);
        forwardToPage("shop/product_detail.jsp", request, response);
    }

    public void search() throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> result;

//        if (keyword.equals("")) {
//            result = productDAO.listActive();
//        } else {
//            result = productDAO.search(keyword);
//        }
        result = productDAO.search(keyword);
        if (result.size() == 0) {
            request.setAttribute("message", "Found no matching product(s).");
        }
        System.out.println("So luong ket qua tim kiem: " + result.size());
        for (Product product : result) {
            System.out.println("Product ID: " + product.getId());
            System.out.println("Product Name: " + product.getNameProduct());
            System.out.println("Product Price: " + product.getPrice());
            // ... In thông tin khác của sản phẩm nếu cần
        }
//        request.setAttribute("keyword", keyword);
        request.setAttribute("result", result);

        forwardToPage("shop/search.jsp", request, response);
    }



}

