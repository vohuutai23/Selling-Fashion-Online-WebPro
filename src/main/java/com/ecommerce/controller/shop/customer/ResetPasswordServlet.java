package com.ecommerce.controller.shop.customer;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.model.entity.Customer;
import com.ecommerce.service.CustomerService;
import com.ecommerce.service.OrderService;

@WebServlet(name = "ResetPasswordServlet", value = "/reset_pass")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("email: ");
        CustomerService customerService = new CustomerService(request, response);

        customerService.sendEmailPassword(request);
    }
    /*private void sendEmailPassword(HttpServletRequest request) {
//		HttpSession session1 = request.getSession();
//		Customer customer = (Customer) session1.getAttribute("loggedCustomer");
        final String username = "21110157@student.hcmute.edu.vn";
        final String password = "Trongdung0607@";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        String emailTo = request.getParameter("email");
//		String emailTo = request.getParameter(customer.getEmail());
        String emailSubject = "Order Confirmation";
        String emailContent = "Thank you for your order. It has been successfully placed.";
        System.out.println("email to: "+emailTo);
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
            message.setSubject(emailSubject);
            message.setText(emailContent);
            Transport.send(message);
            System.out.println("Order confirmation email sent successfully.");
        } catch (Exception e) {
            e.printStackTrace();

        }
    }*/
}
