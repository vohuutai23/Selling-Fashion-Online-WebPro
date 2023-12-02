package com.ecommerce.service;

import com.ecommerce.DAO.CartDAO;
import com.ecommerce.DAO.CartDetailDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.Cart;
import com.ecommerce.model.entity.CartDetail;
import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

import static com.ecommerce.util.CommonUtil.*;

public class CartService {

    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final CartDAO cartDAO;

    private  final CartDetailDAO cartDetailDAO;
    private final ProductDAO productDAO;
    public CartService(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        this.request = request;
        this.response = response;
        this.cartDAO = new CartDAO();
        this.productDAO = new ProductDAO();
        this.cartDetailDAO = new CartDetailDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
    }

    public void viewCartDetail() throws ServletException, IOException {
//        int cartId = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");

        Cart cart = cartDAO.findByCustomer(customer.getId());
        List<CartDetail> cartDetails = cartDetailDAO.listByCart(cart.getId());
        request.setAttribute("cartDetails", cartDetails);
        // Redirect to the cart page or another page

        forwardToPage("shop/cart.jsp", request, response);

        /*Cart cart =cartDAO.get(cartId);

        if (cart != null) {
            request.setAttribute("cart",cart);
            forwardToPage("cart_detail.jsp", request, response);
//            request.getSession().setAttribute("cart", cart);
        }
        else {
            messageForAdmin(String.format("Could not find cart with ID %s.", cartId), request, response);
        }
//        forwardToPage("shop/cart.jsp", request, response);*/
    }

    public void addToCart() throws IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = 1; // Mặc định số lượng là 1, bạn có thể thay đổi này tùy theo logic của bạn

        Product product = productDAO.get(productId);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        int idCustomer = customer.getId();
        Cart cart = cartDAO.findByCustomer(idCustomer);

        CartDetail existingCartDetail = cartDetailDAO.findCartDetailByCartAndProduct(cart.getId(), productId);

        if (existingCartDetail != null) {
            // Sản phẩm đã có trong giỏ hàng, cập nhật số lượng
            int newQuantity = existingCartDetail.getQuantity() + quantity;

            existingCartDetail.setQuantity(newQuantity);
            existingCartDetail.setTotalPrice(product.getPrice() * newQuantity);
            cartDetailDAO.updateCartDetail(existingCartDetail);
        } else {
            // Sản phẩm chưa có trong giỏ hàng, thêm mới
            CartDetail newCartDetail = new CartDetail();
            newCartDetail.setCart(cart);
            newCartDetail.setProduct(product);
            newCartDetail.setQuantity(quantity);
            newCartDetail.setTotalPrice(product.getPrice() * quantity);

            cart.getCartDetails().add(newCartDetail);
            cartDAO.update(cart);
        }
        viewCartDetail();
//        response.sendRedirect("shop/cart.jsp");
        // Xử lý phản hồi, chuyển hướng, v.v...
    }



    /*public void addToCart() throws IOException , ServletException{
        *//*HttpSession session = request.getSession();
        Integer productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = productDAO.get(productId);
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        cart.addProduct(product, quantity);
        cartDAO.update(cart);
        response.sendRedirect("cart.jsp");*//*
        System.out.println("check");
        int productId = Integer.parseInt(request.getParameter("productId"));
        System.out.println("check id product" + productId);
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int quantity = 1;
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.get(productId);

        System.out.println("check product" + product);

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");

        int idCustomer = customer.getId();
        System.out.println("check is cuss" + idCustomer);
        Cart cart = cartDAO.findByCustomer(idCustomer);
        System.out.println("check cart" + cart);
        float subtotal = quantity * product.getPrice();

        CartDetail cartDetail = new CartDetail();
        cartDetail.setCart(cart);
        cartDetail.setProduct(product);
        cartDetail.setQuantity(quantity);
        cartDetail.setTotalPrice(subtotal);

        float newTotal = cart.getTotalPrice() + subtotal;
        cart.setTotalPrice(newTotal);
        System.out.println("check cartdetail " + cartDetail);
        cart.getCartDetails().add(cartDetail);
        cartDAO.update(cart);
        System.out.println("final");
//        CartDAO cartDAO = new CartDAO();

        *//*request.setAttribute("product", product);
        session.setAttribute("NewProductPendingToAddToCart", true);

        forwardToPage("add_product_result.jsp", request, response);*//*
    }*/

    public void updateCart() throws IOException {

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = productDAO.get(productId);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        int idCustomer = customer.getId();
        Cart cart = cartDAO.findByCustomer(idCustomer);
        CartDetail existingCartDetail = cartDetailDAO.findCartDetailByCartAndProduct(cart.getId(), productId);
        int newQuantity = existingCartDetail.getQuantity() + quantity;

        existingCartDetail.setQuantity(newQuantity);
        existingCartDetail.setTotalPrice(product.getPrice() * newQuantity);
        cartDetailDAO.updateCartDetail(existingCartDetail);

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }

    public void removeFromCart() throws IOException {
        /*Integer productId = Integer.parseInt(request.getParameter("product_id"));

        Object cartObject = request.getSession().getAttribute("cart");

        Cart cart = (Cart) cartObject;

        cart.removeItem(new Product(productId));

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);*/
    }

    public void clearCart() throws IOException {
        /*Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.clear();

        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);*/
    }

}
