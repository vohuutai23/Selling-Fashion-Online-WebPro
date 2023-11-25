package com.ecommerce.controller.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "CustomerLoginFilter", value = "/*")
public class CustomerLoginFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	private static final String[] loginRequiredURLs = { "/view_profile", "/edit_profile", "/update_profile",
			"/write_review", "/checkout", "/place_order", "/view_order", "/show_order_detail", "/review_payment",
			"/show_contact" };

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);

		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

		if (path.startsWith("/admin/")) {
			chain.doFilter(request, response);
			return;
		}

		// The session object is not null, and there's an attribute with name
		// loggedCustomer available in the session
		boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;

		String requestURL = httpRequest.getRequestURL().toString();

		// pass the request along the filter chain
		if (!loggedIn && isLoginRequired(requestURL)) {
			String queryString = httpRequest.getQueryString();
			String redirectURL = requestURL;

			if (queryString != null) {
				redirectURL = redirectURL.concat("?").concat(queryString);
			}

			if (session != null) {
				session.setAttribute("redirectURL", redirectURL);
			}

			String loginPage = "shop/login.jsp";
			RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
			dispatcher.forward(request, response);

		} else {
			chain.doFilter(request, response);
		}
	}

	private boolean isLoginRequired(String requestURL) {
		for (String loginRequiredURL : loginRequiredURLs) {
			if (requestURL.contains(loginRequiredURL)) {
				return true;
			}
		}
		return false;
	}

}
