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

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");

        Cart cart = cartDAO.findByCustomer(customer.getId());
        List<CartDetail> cartDetails = cartDetailDAO.listByCart(cart.getId());
        request.setAttribute("cartDetails", cartDetails);
        List<CartDetail> listCartDetails = cartDetailDAO.listAll();
        request.setAttribute("listCartDetails", listCartDetails);

        Float totalPrice = cartDetailDAO.sumTotalPriceByCart(cart.getId());
        if (totalPrice == null) {
            totalPrice = 0.0f; // Thiết lập giá trị mặc định nếu cần
        }
        cart.setTotalPrice(totalPrice);
        cartDAO.update(cart);

        Integer idCustomer = null;

        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);
        request.setAttribute("totalPriceCart", cart.getTotalPrice());

        forwardToPage("shop/cart.jsp", request, response);

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


        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);

    }



    public void updateCart() throws IOException {
        Map<String, String[]> parameters = request.getParameterMap();

        for (String paramName : parameters.keySet()) {

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



        // Tìm CartDetail tương ứng với productId trong giỏ hàng
        CartDetail cartDetail = cartDetailDAO.findCartDetailByCartAndProduct(cart.getId(), productId);
        if (cartDetail != null) {

            cartDetailDAO.deleteByCartAndProduct(cartDetail.getCart().getId(),cartDetail.getProduct().getId()); // Sử dụng CartDetailId để xóa
        }


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

        }

        // Chuyển hướng người dùng trở lại trang giỏ hàng sau khi xóa
        String cartPage = request.getContextPath().concat("/view_cart");
        response.sendRedirect(cartPage);
    }


}