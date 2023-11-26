package com.ecommerce.service;


import com.ecommerce.DAO.CategoryDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.model.entity.Category;
import com.ecommerce.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import static com.ecommerce.utility.CommonUtility.*;


public class ProductService {
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final ProductDAO productDAO;
    private final CategoryDAO categoryDAO;

    public ProductService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
    }

    public void listProductByCategory() throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
//        int categoryId = 1;
//        Category category = categoryDAO.get(categoryId);
        List<Product> listProducts = productDAO.listByCategory(categoryId);

//        System.out.println("Number of products: " + listProducts.size()); // In số lượng sản phẩm để kiểm tra
//        for (Product product : listProducts) {
//            System.out.println("Product ID: " + product.getId());
//            System.out.println("Product Name: " + product.getNameProduct());
//            System.out.println("Product Price: " + product.getPrice());
//            // ... In thông tin khác của sản phẩm nếu cần
//        }

        request.setAttribute("listProducts", listProducts);
//        request.setAttribute("listCategories", listCategories);
//        request.setAttribute("category", category);

        forwardToPage("shop/product_by_category.jsp", request, response);
    }
    public void viewProductDetail() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("id"));
//        Integer productId = 1;
        Product product = productDAO.get(productId);

        request.setAttribute("product", product);
        forwardToPage("shop/product_detail.jsp", request, response);
    }

    public void search() throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> result;

//        if (keyword.equals("")) {
//            result = productDAO.listActive();
//        } else {
//            result = productDAO.search(keyword);
//        }
        result = productDAO.search(keyword);
        if (result.size() == 0) {
            request.setAttribute("message", "Found no matching product(s).");
        }
//        System.out.println("So luong ket qua tim kiem: " + result.size());
//        for (Product product : result) {
//            System.out.println("Product ID: " + product.getId());
//            System.out.println("Product Name: " + product.getNameProduct());
//            System.out.println("Product Price: " + product.getPrice());
//            // ... In thông tin khác của sản phẩm nếu cần
//        }
//        request.setAttribute("keyword", keyword);
        request.setAttribute("result", result);

        forwardToPage("shop/search.jsp", request, response);
    }






//    Admin


    public void listProduct() throws ServletException, IOException {
        listProduct(null);
    }

    public void listProduct(String message) throws ServletException, IOException {
        List<Product> listProducts = productDAO.listAll();

        request.setAttribute("listProducts", listProducts);

        if (message != null) {
            request.setAttribute("message", message);
        }

        forwardToPage("product_list.jsp", message, request, response);
    }
    public void showNewProductForm() throws ServletException, IOException {
        List<Category> listCategories = categoryDAO.listAll();

        request.setAttribute("listCategories", listCategories);

        forwardToPage("product_form.jsp", request, response);
    }
    private void readProductFields(Product product) throws ServletException, IOException {
        String nameProduct = request.getParameter("nameProduct");
//        Integer categoryId = Integer.parseInt(request.getParameter("category"));
//        Category category = categoryDAO.get(categoryId);
        System.out.println("Ten san pham input:" + nameProduct);
        String description = request.getParameter("description");
        System.out.println("Mo ta input:" + description);
//        String size = request.getParameter("size");
//        Float price = Float.parseFloat(request.getParameter("price"));
        Instant postDate = Instant.now(); // Lấy thời điểm hiện tại dưới dạng Instant


        product.setNameProduct(nameProduct);
        product.setDescription(description);
//        product.setCategory(category);
//        product.setPrice(price);
        product.setPostDate(postDate);

//        Part part = request.getPart("productImage");
//
//        if (part != null && part.getSize() > 0) {
//            long size = part.getSize();
//            byte[] imageByte = new byte[(int) size];
//
//            InputStream inputStream = part.getInputStream();
//            inputStream.read(imageByte);
//            inputStream.close();
//
//            product.setImage(imageByte);
//        }
//
//        boolean active = Boolean.parseBoolean(request.getParameter("active"));
//        product.setActive(active);
    }
    public void createProduct() throws ServletException, IOException {
        String nameProduct = request.getParameter("nameProduct");

        Product existProduct = productDAO.findByTitle(nameProduct);
        System.out.println("San pham ton tai" + existProduct);
        if (existProduct != null) {
            listProduct(String.format("Could not create new product because the title '%s' already exists.", nameProduct));
            return;
        }

        Product newProduct = new Product();
        readProductFields(newProduct);
        newProduct.setId(12);
        Product createdProduct = productDAO.create(newProduct);

        if (createdProduct.getId() > 0) {
            listProduct("A new product has been created successfully.");
        }
    }


    public void editProduct() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.get(productId);

        if (product != null) {
//            List<Category> listCategories = categoryDAO.listAll();

            request.setAttribute("product", product);
//            request.setAttribute("listCategories", listCategories);

            forwardToPage("product_form.jsp", request, response);
        }

//        } else {
//            messageForAdmin(
//                    String.format("Could not find the product with ID %s or it might have been deleted.", productId),
//                    request, response);
//        }
    }

    public void updateProduct() throws ServletException, IOException {
//        Integer productId = Integer.parseInt(request.getParameter("productId"));
        Integer productId = 1;
        String nameProduct = request.getParameter("nameProduct");

        Product existProduct = productDAO.get(productId);
        Product productByTitle = productDAO.findByTitle(nameProduct);

        if (productByTitle != null && !existProduct.equals(productByTitle)) {
            listProduct("Could not update product because there is another product having same title.");
            return;
        }

        readProductFields(existProduct);

        productDAO.update(existProduct);

        listProduct("The product has been updated successfully.");
    }

    public void deleteProduct() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.get(productId);
        productDAO.delete(productId);
        listProduct("The product has been deleted successfully.");

//        if (product == null) {
//            messageForAdmin(
//                    String.format("Could not find the product with ID %s or it might have been deleted.", productId),
//                    request, response);}
//
////        } else {
////            if (!product.getReviews().isEmpty()) {
////                messageForAdmin(
////                        String.format("Could not delete the product with ID %s because it has reviews.", productId),
////                        request, response);
////
////            } else {
////                OrderDAO orderDAO = new OrderDAO();
////                long countByOrder = orderDAO.countOrderDetailByProduct(productId);
////
////                if (countByOrder > 0) {
////                    messageForAdmin(String.format(
////                            "Could not delete the product with ID %s because there are orders associated with it.",
////                            productId), request, response);
////
////                } else {
//            else{
//                    productDAO.delete(productId);
//                    listProduct("The product has been deleted successfully.");
//            }
    }
}

