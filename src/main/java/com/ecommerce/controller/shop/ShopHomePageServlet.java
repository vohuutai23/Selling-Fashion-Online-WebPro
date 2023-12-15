package com.ecommerce.controller.shop;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.DAO.CartDetailDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        HttpSession session = request.getSession();

        List<Product> listNewProducts = productDAO.listNewProducts();
        List<Category> listCategories = categoryDAO.listAll();
        List<CartDetail> listCartDetails = cartDetailDAO.listAll();

        Integer idCustomer = null;
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>();

        List<Product> listBestSellingProducts = productDAO.listBestSellingProducts();

        request.setAttribute("listCartDetails", listCartDetails);
        request.setAttribute("listNewProducts", listNewProducts);
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);
        request.setAttribute("listBestSellingProducts", listBestSellingProducts);

        forwardToPage("shop/index.jsp", request, response);
    }


}
