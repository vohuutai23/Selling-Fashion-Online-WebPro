package com.ecommerce.service;

import com.ecommerce.DAO.*;
//import com.ecommerce.DAO.Cart;
import com.ecommerce.model.entity.*;
/*import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;*/

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

import static com.ecommerce.util.CommonUtil.*;

public class OrderService {
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final OrderDAO orderDAO;
    private final  CartDAO cartDAO;

    private final CartDetailDAO cartDetailDAO;
    private final ProductDAO productDAO;

    private  final OrderDetailDAO orderDetailDAO;

    public OrderService(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        this.request = request;
        this.response = response;
        this.orderDAO = new OrderDAO();
        this.cartDAO = new CartDAO();
        this.cartDetailDAO = new CartDetailDAO();
        this.productDAO = new ProductDAO();
        this.orderDetailDAO = new OrderDetailDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
    }

    public void listOrder() throws ServletException, IOException {
        listOrder(null);
    }

    public void listOrder(String message) throws ServletException, IOException {
        List<ProductOrder> listOrder = orderDAO.listAll();
//        System.out.println(List<ProductOrder>);
        for (ProductOrder order : listOrder) {
            System.out.println(order); // Hoặc in thông tin cụ thể, ví dụ: System.out.println(order.getId());
        }
        request.setAttribute("listOrder", listOrder);

        if (message != null) {
            request.setAttribute("message", message);
        }

        forwardToPage("order_list.jsp", request, response);
    }

    public void viewOrderDetailForAdmin() throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));
        ProductOrder order = orderDAO.get(orderId);

        if (order != null) {
            request.setAttribute("order", order);
            forwardToPage("order_detail.jsp", request, response);

        } else {
            messageForAdmin(String.format("Could not find order with ID %s.", orderId), request, response);
        }
    }

    public void showCheckoutForm() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");

        Cart cart = cartDAO.findByCustomer(customer.getId());
        List<CartDetail> cartDetails = cartDetailDAO.listByCart(cart.getId());
        int numberOfCartDetails = cartDetails.size(); // Lấy số lượng và lưu vào biến
        request.setAttribute("cartDetails", cartDetails);
        request.setAttribute("numberOfCartDetails", numberOfCartDetails); // Lưu biến vào request để sử dụng sau này

        Float totalPrice = cartDetailDAO.sumTotalPriceByCart(cart.getId());
        if (totalPrice == null) {
            totalPrice = 0.0f; // Thiết lập giá trị mặc định nếu cần
        }
        cart.setTotalPrice(totalPrice);
        request.setAttribute("totalPriceCart", cart.getTotalPrice());

        float shippingFee = 20000;//art.getTotalPrice() * 5.0f;

        float total = cart.getTotalPrice() + shippingFee;

//        session.setAttribute("tax", tax);
        session.setAttribute("shippingFee", shippingFee);
        session.setAttribute("total", total);

//        generateCountryList(request);

        forwardToPage("shop/checkout.jsp", request, response);
    }

    public void placeOrder() throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");
        ProductOrder order = readOrderInfo();
        placeOrderCOD(order);
        forwardToPage("shop/thanks.jsp", request, response);

    }



    private Integer saveOrder(ProductOrder order) {
        // Kiểm tra xem order đã tồn tại hay chưa
        if (order.getId() == null) {
            System.out.println("Saving new order...");
            ProductOrder savedOrder = orderDAO.create(order);

            // Xử lý liên quan đến Customer và Cart
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("loggedCustomer");
            if (customer != null) {
                Cart cart = cartDAO.findByCustomer(customer.getId());
                if (cart != null) {
                    cart.setTotalPrice(0.0f);
                    cartDAO.update(cart);
                    cartDetailDAO.deleteByCart(cart.getId());

                }
            }
            return savedOrder.getId();
        } else {
            System.out.println("Order already exists with ID: " + order.getId());
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("loggedCustomer");
            if (customer != null) {
                Cart cart = cartDAO.findByCustomer(customer.getId());
                if (cart != null) {
                    cart.setTotalPrice(0.0f);
                    cartDAO.update(cart);
                    cartDetailDAO.deleteByCart(cart.getId());

                }
            }
            return order.getId();
        }
    }

    private ProductOrder saveOrder2(ProductOrder order) {
        System.out.println("Saving order...");
        ProductOrder savedOrder = orderDAO.create(order);
        System.out.println("Order saved with ID: " + savedOrder.getId());
        // thêm các bước xử lý khác nếu cần
        return savedOrder;
    }

    private ProductOrder readOrderInfo() {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");


        // Extracting order information from request parameters
        String recipientFullName = request.getParameter("recipientFullName");
        String recipientPhone = request.getParameter("recipientPhone");
        String recipientAddress = request.getParameter("recipientAddress");
        String paymentMethod = request.getParameter("paymentMethod");

        // Creating a new ProductOrder instance and setting its properties
        ProductOrder order = new ProductOrder();
//        ProductOrder orderSave = new ProductOrder();

        order.setCustomer(customer);
        order.setFullName(recipientFullName);
        order.setPhone(recipientPhone);
        order.setShippingAddress(recipientAddress);
        order.setPaymentMethod(paymentMethod);

        int idCustomer = customer.getId();
        Cart cart = cartDAO.findByCustomer(idCustomer);
        float shippingFee = (float) session.getAttribute("shippingFee");
        float total = cart.getTotalPrice() + shippingFee;

        order.setFee(shippingFee);
        order.setTotalPrice(total);

        Set<OrderDetail> orderDetails = new HashSet<>();
        System.out.println("check1");
        Map<String, String[]> parameters = request.getParameterMap();
        System.out.println("check2");

        int orderId = saveOrder(order);
        for (String paramName : parameters.keySet()) {
            System.out.println("check3" + paramName);

            if (paramName.startsWith("quantity_")) {

                // Tách ra ID sản phẩm từ tên tham số
                int productId = Integer.parseInt(paramName.split("_")[1]);
                int quantity = Integer.parseInt(parameters.get(paramName)[0]);

                // Xử lý cập nhật số lượng cho mỗi sản phẩm
                Product product = productDAO.get(productId);


                float subtotal = quantity * product.getPrice();
                Cart cart2 = cartDAO.findByCustomer(idCustomer);
                CartDetail existingCartDetail = cartDetailDAO.findCartDetailByCartAndProduct(cart2.getId(), productId);
                OrderDetail orderDetail= new OrderDetail();

                orderDetail.setProduct(product);
                orderDetail.setProductOrder(order);
                System.out.println("Check order_id" + order.getId());
                orderDetail.setQuantity(quantity);
                orderDetail.setTotalPrice(subtotal);
                System.out.println("Check order_detail" + orderDetail);
                orderDetails.add(orderDetail);
                //orderDetailDAO.create(orderDetail);
                order.getOrderDetails().add(orderDetail);

                orderDAO.update(order);
            }
        }

        System.out.println("check4");

        order.setOrderDetails(orderDetails);

        // Calculating total price, tax, and shipping fee


        order.setOrderDetails(orderDetails);
        return order;
    }


    private void placeOrderCOD(ProductOrder order) throws ServletException, IOException {
        saveOrder(order);
        /*messageForShop("Thank you. Your order has been received. Your product(s) will be delivered within a few days.",
                request, response);*/

    }

  public void listOrderByCustomer() throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        List<ProductOrder> listOrder = orderDAO.listByCustomer(customer.getId());

        request.setAttribute("listOrder", listOrder);

      Integer idCustomer = null;
      if (customer != null) {
          idCustomer = customer.getId();
      }

      // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
      List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
              ? cartDetailDAO.listAllByIdCustomer(idCustomer)
              : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
      request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);

        forwardToPage("shop/order_list.jsp", request, response);
    }

    public void showOrderDetailForCustomer() throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedCustomer");

        ProductOrder order = orderDAO.get(orderId, customer.getId());
        request.setAttribute("order", order);

        Integer idCustomer = null;
        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);

        forwardToPage("shop/order_detail.jsp", request, response);
    }

    public void showEditOrderForm() throws ServletException, IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));
        ProductOrder order = orderDAO.get(orderId);

        if (order == null) {
            messageForAdmin(String.format("Could not find order with ID %s.", orderId), request, response);
            return;
        }
        request.setAttribute("order", order);


        forwardToPage("order_form.jsp", request, response);
    }

    public void showAddProductForm() throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        List<Product> listProduct = productDAO.listAll();
        request.setAttribute("listProduct", listProduct);

        forwardToPage("add_product_form.jsp", request, response);
    }

   public void addToOrder() throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.get(productId);

        HttpSession session = request.getSession();
        ProductOrder order = orderDAO.get(orderId);

        float subtotal = quantity * product.getPrice();

        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setProductOrder(order);
        orderDetail.setProduct(product);
        orderDetail.setQuantity(quantity);
        orderDetail.setTotalPrice(subtotal);

        float newTotal = order.getTotalPrice() + subtotal;
        order.setTotalPrice(newTotal);

        order.getOrderDetails().add(orderDetail);
        orderDAO.update(order);
        request.setAttribute("product", product);


        forwardToPage("add_product_result.jsp", request, response);
    }

    public void removeFromOrder() throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        ProductOrder order = orderDAO.get(orderId);
        // Cập nhật thông tin order

        Set<OrderDetail> orderDetails = order.getOrderDetails();
        Iterator<OrderDetail> iterator = orderDetails.iterator();

        while (iterator.hasNext()) {
            OrderDetail orderDetail = iterator.next();

            if (orderDetail.getProduct().getId() == productId) {
                float newTotal = order.getTotalPrice() - orderDetail.getTotalPrice();
                order.setTotalPrice(newTotal);
                iterator.remove();
            }
        }

        orderDAO.update(order); // Cập nhật order trong cơ sở dữ liệu

        request.setAttribute("order", order); // Đặt lại order cho request
        forwardToPage("order_form.jsp", request, response); // Chuyển tiếp trở lại trang order_form
    }

    public void updateService() throws ServletException, IOException {
        HttpSession session = request.getSession();
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        ProductOrder order = orderDAO.get(orderId);
        String recipientFullName = request.getParameter("recipientFullName");

        String recipientPhone = request.getParameter("recipientPhone");
        String recipientAddress = request.getParameter("recipientAddress");


        float shippingFee = Float.parseFloat(request.getParameter("shippingFee"));

        String paymentMethod = request.getParameter("paymentMethod");
        String orderStatus = request.getParameter("orderStatus");
        order.setFullName(recipientFullName);
        order.setPhone(recipientPhone);
        order.setShippingAddress(recipientAddress);
        order.setFee(shippingFee);
        order.setPaymentMethod(paymentMethod);
        order.setStatus(orderStatus);

        String[] arrayProductId = request.getParameterValues("productId");
        String[] arrayPrice = request.getParameterValues("price");
        String[] arrayQuantity = new String[arrayProductId.length];

        for (int i = 1; i <= arrayQuantity.length; i++) {
            arrayQuantity[i - 1] = request.getParameter("quantity" + i);
        }

        Set<OrderDetail> orderDetails = order.getOrderDetails();
        orderDetails.clear();

        float totalAmount = 0.0f;

        for (int i = 0; i < arrayProductId.length; i++) {
            int productId = Integer.parseInt(arrayProductId[i]);
            int quantity = Integer.parseInt(arrayQuantity[i]);
            float price = Float.parseFloat(arrayPrice[i]);

            float subtotal = price * quantity;

            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProduct(new Product(productId));
            orderDetail.setQuantity(quantity);
            orderDetail.setTotalPrice(subtotal);
            orderDetail.setProductOrder(order);

            orderDetails.add(orderDetail);
            totalAmount += subtotal;
        }

        order.setTotalPrice(totalAmount);

        totalAmount += shippingFee;


        order.setTotalPrice(totalAmount);

        orderDAO.update(order);

        listOrder(String.format("The order %s has been updated successfully.", order.getId()));
    }

    public void deleteOrder() throws ServletException, IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));
        ProductOrder order = orderDAO.get(orderId);

        if (order != null) {
            orderDAO.delete(orderId);
            listOrder(String.format("The order ID %s has been deleted.", orderId));

        } else {
            messageForAdmin(
                    String.format("Could not find the order with ID %s or it might have been deleted.", orderId),
                    request, response);
        }
    }

}
