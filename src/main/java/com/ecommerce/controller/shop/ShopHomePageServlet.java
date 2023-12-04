package com.ecommerce.controller.shop;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

import java.io.IOException;
import java.util.List;

import com.ecommerce.DAO.CartDetailDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.Cart;
import com.ecommerce.model.entity.CartDetail;
import com.ecommerce.model.entity.Product;
import com.ecommerce.model.entity.Category;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.DAO.CategoryDAO;

@WebServlet(name = "ShopHomePageServlet", value = "")
public class ShopHomePageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        CartDetailDAO cartDetailDAO = new CartDetailDAO();
        List<Product> listNewProducts = productDAO.listNewProducts();
//        List<Product> listBestSellingProducts = productDAO.listBestSellingProducts();
//        List<Product> listFavoredProducts = productDAO.listMostFavoredProducts();
        List<Category> listCategories = categoryDAO.listAll();
        List<CartDetail> listCartDetails = cartDetailDAO.listAll();
        request.setAttribute("listCartDetails", listCartDetails);
        request.setAttribute("listNewProducts", listNewProducts);
        request.setAttribute("listCategories", listCategories);

//        request.setAttribute("listBestSellingProducts", listBestSellingProducts);
//        request.setAttribute("listFavoredProducts", listFavoredProducts);

        forwardToPage("shop/index.jsp", request, response);
    }

}
