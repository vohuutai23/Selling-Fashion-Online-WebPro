package com.ecommerce.service;

import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.Cart;
import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

import static com.ecommerce.utility.CommonUtility.forwardToPage;

public class CartService {

    private final HttpServletRequest request;
    private final HttpServletResponse response;

    public CartService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public void viewCart() throws ServletException, IOException {
        Object cartObject = request.getSession().getAttribute("cart");

        if (cartObject == null) {
            Cart cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }

        forwardToPage("shop/cart.jsp", request, response);
    }

    public void addToCart() throws IOException {
        Integer productId = Integer.parseInt(request.getParameter("product_id"));

        Object cartObject = request.getSession().getAttribute("cart");

        Cart cart;

        if (cartObject instanceof Cart) {
            cart = (Cart) cartObject;
        } else {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.get(productId);

        cart.addItem(product);

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }

    public void updateCart() throws IOException {
        String[] arrayProductIds = request.getParameterValues("productId");
        String[] arrayQuantities = new String[arrayProductIds.length];

        for (int i = 1; i <= arrayQuantities.length; i++) {
            String aQuantity = request.getParameter("quantity" + i);
            arrayQuantities[i - 1] = aQuantity;
        }

        int[] productIds = Arrays.stream(arrayProductIds).mapToInt(Integer::parseInt).toArray();
        int[] quantities = Arrays.stream(arrayQuantities).mapToInt(Integer::parseInt).toArray();

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.updateCart(productIds, quantities);

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }

    public void removeFromCart() throws IOException {
        Integer productId = Integer.parseInt(request.getParameter("product_id"));

        Object cartObject = request.getSession().getAttribute("cart");

        Cart cart = (Cart) cartObject;

        cart.removeItem(new Product(productId));

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }

    public void clearCart() throws IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.clear();

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }

}
