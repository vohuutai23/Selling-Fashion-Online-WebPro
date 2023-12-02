package com.ecommerce.service;

import com.ecommerce.DAO.CartDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.Cart;
import com.ecommerce.model.entity.CartDetail;
import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import static com.ecommerce.util.CommonUtil.*;
import static com.ecommerce.utility.CommonUtility.forwardToPage;

public class CartService {

    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final CartDAO cartDAO;
    public CartService(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        this.request = request;
        this.response = response;
        this.cartDAO = new CartDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
    }

    public void viewCartDetail() throws ServletException, IOException {
        int cartId = Integer.parseInt(request.getParameter("id"));
        Cart cart =cartDAO.get(cartId);

        if (cart != null) {
            request.setAttribute("cart",cart);
            forwardToPage("cart_detail.jsp", request, response);
//            request.getSession().setAttribute("cart", cart);
        }
        else {
            messageForAdmin(String.format("Could not find cart with ID %s.", cartId), request, response);
        }
//        forwardToPage("shop/cart.jsp", request, response);
    }

    public void addToCart() throws IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.get(productId);

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("order");

        float subtotal = quantity * product.getPrice();

        CartDetail cartDetail = new CartDetail();
        CartDetail.setProduct(product);
        CartDetail.setQuantity(quantity);
        CartDetail.setSubtotal(subtotal);

        float newTotal = order.getTotal() + subtotal;
        order.setTotal(newTotal);

        order.getOrderDetails().add(orderDetail);

        request.setAttribute("product", product);
        session.setAttribute("NewProductPendingToAddToOrder", true);

        forwardToPage("add_product_result.jsp", request, response);
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
