//package com.ecommerce.controller.common.filter;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpFilter;
//import javax.servlet.http.HttpServletRequest;
//
//import com.ecommerce.model.dao.CategoryDAO;
//import com.ecommerce.model.entity.Category;
//
//@WebFilter(filterName = "CommonFilter", value = "/*")
//public class CommonFilter extends HttpFilter implements Filter {
//
//	private static final long serialVersionUID = 1L;
//	private final CategoryDAO categoryDAO;
//
//	public CommonFilter() {
//		categoryDAO = new CategoryDAO();
//	}
//
//	@Override
//	public void init(FilterConfig config) throws ServletException {
//	}
//
//	@Override
//	public void destroy() {
//	}
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws ServletException, IOException {
//		HttpServletRequest httpRequest = (HttpServletRequest) request;
//		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
//
//		if (!path.startsWith("/admin/")) {
//			List<Category> listCategory = categoryDAO.listAll();
//			request.setAttribute("listCategory", listCategory);
//		}
//
//		chain.doFilter(request, response);
//	}
//
//}
