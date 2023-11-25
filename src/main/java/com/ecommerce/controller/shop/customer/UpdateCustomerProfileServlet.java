package com.ecommerce.controller.shop.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.service.CustomerService;

@WebServlet(name = "UpdateCustomerProfileServlet", value = "/update_profile")
public class UpdateCustomerProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CustomerService customerService = new CustomerService(request, response);
		customerService.updateCustomerProfile();
	}

}
