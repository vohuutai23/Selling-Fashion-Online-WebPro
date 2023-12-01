package com.ecommerce.controller.admin.product;

import com.ecommerce.DAO.CategoryDAO;
import com.ecommerce.model.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.ecommerce.service.ProductService;
import com.google.gson.Gson;

@WebServlet("/admin/get-name-categories")
public class GetNameCategoriesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("chack1");
        ProductService productService = new ProductService(request, response);
        productService.loadSelectNameCategories();
        // Sử dụng Gson để chuyển đổi dữ liệu sang JSON
        String json = new Gson().toJson(productService.getSelectNameCategories());
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
        System.out.println("chack3");
    }
}

