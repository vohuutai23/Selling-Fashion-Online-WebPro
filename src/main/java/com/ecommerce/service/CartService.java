package com.ecommerce.service;

import com.ecommerce.DAO.CartDAO;
import com.ecommerce.DAO.CartDetailDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

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
//        viewCartDetail();
//        response.sendRedirect("shop/cart.jsp");
        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
        // Xử lý phản hồi, chuyển hướng, v.v...
    }



    public void updateCart() throws IOException {
        Map<String, String[]> parameters = request.getParameterMap();

        for (String paramName : parameters.keySet()) {
            System.out.println("test2");
            if (paramName.startsWith("quantity_")) {

                // Tách ra ID sản phẩm từ tên tham số
                int productId = Integer.parseInt(paramName.split("_")[1]);
                int quantity = Integer.parseInt(parameters.get(paramName)[0]);

                // Xử lý cập nhật số lượng cho mỗi sản phẩm
                Product product = productDAO.get(productId);
                HttpSession session = request.getSession();
                Customer customer = (Customer) session.getAttribute("loggedCustomer");
                int idCustomer = customer.getId();
                Cart cart = cartDAO.findByCustomer(idCustomer);
                CartDetail existingCartDetail = cartDetailDAO.findCartDetailByCartAndProduct(cart.getId(), productId);

                existingCartDetail.setQuantity(quantity);
                existingCartDetail.setTotalPrice(product.getPrice() * quantity);
                cartDetailDAO.updateCartDetail(existingCartDetail);
            }
        }
        System.out.println("test4");
    // Chuyển hướng sau khi xử lý
        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);

    }


    public void removeFromCart() throws ServletException,IOException {
        int productId = Integer.parseInt(request.getParameter("product_id"));

        // Lấy thông tin người dùng hiện tại từ session
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        int customerId = customer.getId();

        // Tìm giỏ hàng của người dùng
        Cart cart = cartDAO.findByCustomer(customerId);

        Set<CartDetail> cartDetails = cart.getCartDetails();
        System.out.println("check cos sn ko"+ cartDetails);


        // Tìm CartDetail tương ứng với productId trong giỏ hàng
        CartDetail cartDetail = cartDetailDAO.findCartDetailByCartAndProduct(cart.getId(), productId);
        if (cartDetail != null) {
            System.out.println("check id cart"+ cartDetail.getCart().getId());
            System.out.println("check id pro"+ cartDetail.getProduct().getId());
           // CartDetailId cartDetailId = cartDetail.getId(); // Lấy CartDetailId
            cartDetailDAO.deleteByCartAndProduct(cartDetail.getCart().getId(),cartDetail.getProduct().getId()); // Sử dụng CartDetailId để xóa
        }

        System.out.println("check sp");
        // Chuyển hướng người dùng trở lại trang giỏ hàng
        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);


    }

    public void clearCart() throws IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        if (customer != null) {
            // Lấy giỏ hàng của khách hàng
            Cart cart = cartDAO.findByCustomer(customer.getId());
            cartDetailDAO.deleteByCart(cart.getId());
            /*if (cart != null) {
                // Lấy danh sách tất cả CartDetail liên quan đến giỏ hàng
                List<CartDetail> cartDetails = cartDetailDAO.listByCart(cart.getId());
                System.out.println("check id cart"+ cart.getId());
                // Xóa mỗi CartDetail

                *//*for (CartDetail cartDetail : cartDetails) {
                    cartDetailDAO.delete(cartDetail.getId());
                }*//*
            }*/
        }

        // Chuyển hướng người dùng trở lại trang giỏ hàng sau khi xóa
        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }


}
