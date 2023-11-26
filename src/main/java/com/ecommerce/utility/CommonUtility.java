package com.ecommerce.utility;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CommonUtility {

    public static void forwardToPage(String page, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(page).forward(request, response);
    }

    public static void forwardToPage(String page, String message, HttpServletRequest request,
                                     HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher(page).forward(request, response);
    }

    public static void messageForShop(String message, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        forwardToPage("shop/message.jsp", message, request, response);
    }
}