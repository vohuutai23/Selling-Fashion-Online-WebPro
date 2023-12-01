package com.ecommerce.controller.admin.category;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.service.CategoryService;

@WebServlet(name = "ListCategoryServlet", value = "/admin/list_category")
public class ListCategoryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryService categoryService = new CategoryService(request, response);
		categoryService.listCategory();
	}

}
