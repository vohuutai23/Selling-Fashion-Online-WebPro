package com.ecommerce.service;
import com.ecommerce.DAO.CustomerDAO;
import com.ecommerce.DAO.OrderDAO;
import com.ecommerce.DAO.ReviewDAO;
import com.ecommerce.model.entity.Customer;
//import com.ecommerce.utility.HashUtility;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static com.ecommerce.util.CommonUtil.*;
public class CustomerService {
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final CustomerDAO customerDAO;

    public CustomerService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        customerDAO = new CustomerDAO();
    }

    public void listCustomer() throws ServletException, IOException {
        listCustomer(null);
    }

    public void listCustomer(String message) throws ServletException, IOException {

        List<Customer> listCustomers = customerDAO.listAll();
        System.out.println("Customer: " + listCustomers);
        request.setAttribute("listCustomers", listCustomers);

        if (message != null) {
            request.setAttribute("message", message);
        }

        forwardToPage("list_customer.jsp", request, response);
    }

    private void updateCustomerFields(Customer customer) {
        String email = request.getParameter("email");
        String fullName = request.getParameter("nameCustomer");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String password = request.getParameter("password");
        if (email != null && !"".equals(email)) {
            customer.setEmail(email);
        }

        customer.setNameCustomer(fullName);

        if (password != null && !"".equals(password)) {
            // String encryptedPassword = HashUtility.generateMD5(password);
            customer.setPassword(password);
        }

        customer.setPhone(phone);
        customer.setAddress(address);

        customer.setCountry(country);
    }

    public void showCustomerNewForm() throws ServletException, IOException {
        generateCountryList(request);

        forwardToPage("customer_form.jsp", request, response);
    }

    public void createCustomer() throws ServletException, IOException {
        String email = request.getParameter("email");
        Customer existCustomer = customerDAO.findByEmail(email);

        if (existCustomer != null) {
            listCustomer(String.format(
                    "Could not create new customer. The email %s is already registered by another customer.", email));

        } else {
            Customer newCustomer = new Customer();

            updateCustomerFields(newCustomer);

            customerDAO.create(newCustomer);

            listCustomer("New customer has been created successfully.");
        }
    }

    public void editCustomer() throws ServletException, IOException {
        Integer customerId = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerDAO.get(customerId);

        if (customer == null) {
            System.out.println("loi");
/*            messageForAdmin(
                    String.format("Could not find the customer with ID %s or it might have been deleted.", customerId),
                    request, response);*/
        } else {
            customer.setPassword(null);

            request.setAttribute("customer", customer);

            generateCountryList(request);

            forwardToPage("customer_form.jsp", request, response);
        }
    }

    public void saveEditCustomer() throws ServletException, IOException {
        Integer customerId = Integer.parseInt(request.getParameter("customerId"));
        String email = request.getParameter("email");

        Customer customerByEmail = customerDAO.findByEmail(email);

        if (customerByEmail != null && !Objects.equals(customerByEmail.getId(), customerId)) {
            System.out.println("loi");

            /*messageForAdmin(String.format(
                    "Could not update the customer ID %s because there is an existing customer having the same email.",
                    customerId), request, response);*/
        } else {
            Customer customerById = customerDAO.get(customerId);

            updateCustomerFields(customerById);

            customerDAO.update(customerById);

            listCustomer("The customer has been updated successfully.");
        }
    }

    public void deleteCustomer() throws ServletException, IOException {
        Integer customerId = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerDAO.get(customerId);

        if (customer != null) {
            ReviewDAO reviewDAO = new ReviewDAO();
            long reviewCount = reviewDAO.countByCustomer(customerId);

            if (reviewCount > 0) {
                System.out.println("loi");

/*                messageForAdmin(String.format(
                        "Could not delete the customer with ID %s because the customer posted reviews for product(s).",
                        customerId), request, response);*/

            } else {
                OrderDAO orderDAO = new OrderDAO();
                //long orderCount = orderDAO.countByCustomer(customerId);
                long orderCount = 0;
                if (orderCount > 0) {
                    System.out.println("loi");

/*                    messageForAdmin(String.format(
                            "Could not delete the customer with ID %s because the customer placed order(s).",
                            customerId), request, response);*/

                } else {
                    customerDAO.delete(customerId);
                    listCustomer("The customer has been deleted successfully.");
                }
            }
        } else {
            System.out.println("loi");

/*            messageForAdmin(
                    String.format("Could not find the customer with ID %s or it might have been deleted.", customerId),
                    request, response);*/
        }
    }

    public void showCustomerRegisterForm() throws ServletException, IOException {
        generateCountryList(request);

        forwardToPage("shop/login.jsp", request, response);
    }

    public void registerCustomer() throws ServletException, IOException {
        String email = request.getParameter("email");
        Customer existCustomer = customerDAO.findByEmail(email);

        if (existCustomer != null) {
            String message = "Could not register. The email is already registered by another customer.";
            request.setAttribute("message", message);
            //request.setAttribute("showRegisterForm", true);
            request.setAttribute("action", "showRegisterForm");
            request.setAttribute("registerFailed", true); // Flag để biết rằng đăng ký thất bại
            forwardToPage("shop/login.jsp", request, response);
            /*request.setAttribute("message", "Could not register. The email is already registered by another customer.");
            showLogin();*/
            /*messageForShop(
                    String.format("Could not register. The email %s is already registered by another customer.", email),
                    request, response);*/

        } else {
            Customer newCustomer = new Customer();
            updateCustomerFields(newCustomer);
            customerDAO.create(newCustomer);
            request.setAttribute("message", "You have registered successfully! Thank you.");
            showLogin();

           /* messageForShop("You have registered successfully! Thank you.<br/><a href='login'>Click here</a> to login",
                    request, response);*/
        }
    }

    public void showLogin() throws ServletException, IOException {
        forwardToPage("shop/login.jsp", request, response);
    }

    public void doLogin() throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Customer customer = customerDAO.findByEmailAndPassword(email, password);

        if (customer == null) {
            request.setAttribute("message", "Login failed. Please check your email and password.");
            showLogin();

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("loggedCustomer", customer);

            Object objectRedirectURL = session.getAttribute("redirectURL");

            if (objectRedirectURL != null) {
                String redirectURL = (String) objectRedirectURL;
                session.removeAttribute("redirectURL");
                response.sendRedirect(redirectURL);

            } else {
//                showCustomerProfile();
                forwardToPage("shop/index.jsp", request, response);
            }
        }
    }

    public void logout() throws IOException {
        request.getSession().removeAttribute("loggedCustomer");
        response.sendRedirect(request.getContextPath());
    }

    public void showCustomerProfile() throws ServletException, IOException {
        forwardToPage("shop/customer_profile.jsp", request, response);
    }

    public void showCustomerProfileEditForm() throws ServletException, IOException {
        generateCountryList(request);
        forwardToPage("shop/edit_profile.jsp", request, response);
    }

    public void updateCustomerProfile() throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
        updateCustomerFields(customer);
        customerDAO.update(customer);
        showCustomerProfile();
    }
}
