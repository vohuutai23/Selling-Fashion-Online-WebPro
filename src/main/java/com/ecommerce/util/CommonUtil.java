package com.ecommerce.util;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
public class CommonUtil {
    public static void forwardToPage(String page, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(page).forward(request, response);
    }

    public static void forwardToPage(String page, String message, HttpServletRequest request,
                                     HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher(page).forward(request, response);
    }
   /* public static void messageForShop(String message, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        forwardToPage("shop/message.jsp", message, request, response);
    }

    public static void messageForAdmin(String message, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        forwardToPage("message.jsp", message, request, response);
    }*/
   public static void generateCountryList(HttpServletRequest request) {
       String[] countryCodes = Locale.getISOCountries();

       Map<String, String> mapCountries = new TreeMap<>();

       for (String countryCode : countryCodes) {
           Locale locale = new Locale("", countryCode);
           String code = locale.getCountry();
           String name = locale.getDisplayCountry();

           mapCountries.put(name, code);
       }

       request.setAttribute("mapCountries", mapCountries);
   }
}
