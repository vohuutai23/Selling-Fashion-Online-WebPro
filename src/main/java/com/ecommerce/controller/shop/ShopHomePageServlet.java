package com.ecommerce.controller.shop;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.Product;

@WebServlet(name = "ShopHomePageServlet", value = "")
public class ShopHomePageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();

        List<Product> listNewProducts = productDAO.listNewProducts();
//        List<Product> listBestSellingProducts = productDAO.listBestSellingProducts();
//        List<Product> listFavoredProducts = productDAO.listMostFavoredProducts();

        request.setAttribute("listNewProducts", listNewProducts);
//        request.setAttribute("listBestSellingProducts", listBestSellingProducts);
//        request.setAttribute("listFavoredProducts", listFavoredProducts);

        forwardToPage("shop/index.jsp", request, response);
    }

}
