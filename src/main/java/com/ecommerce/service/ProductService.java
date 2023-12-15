package com.ecommerce.service;


import com.ecommerce.DAO.CategoryDAO;
import com.ecommerce.DAO.ProductDAO;
import com.ecommerce.DAO.CartDetailDAO;
import com.ecommerce.model.entity.CartDetail;
import com.ecommerce.model.entity.Category;
import com.ecommerce.model.entity.Customer;
import com.ecommerce.model.entity.Product;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.io.InputStream;
import java.util.Objects;

import static com.ecommerce.utility.CommonUtility.*;


public class ProductService {
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final ProductDAO productDAO;
    private final CategoryDAO categoryDAO;
    private final CartDetailDAO cartDetailDAO;
    private List<Category> selectNameCategories;

    public ProductService(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        this.request = request;
        this.response = response;
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
        cartDetailDAO = new CartDetailDAO();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
    }

    public void listProductByCategory() throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
//        int categoryId = 1;
        Category category = categoryDAO.get(categoryId);
        List<Product> listProducts = productDAO.listByCategory(categoryId);
        List<Category> listCategories = categoryDAO.listAll();
        String sort = request.getParameter("sort");

        if (Objects.equals(sort, "newest")) {
            listProducts = productDAO.listByNewest(categoryId);
        }
        if (Objects.equals(sort, "best_selling")) {
            listProducts = productDAO.listBestSellingProductsByCategory(categoryId);
        }
        if (Objects.equals(sort, "price_dec")) {
            listProducts = productDAO.listByPriceDec(categoryId);
        }
        if (Objects.equals(sort, "price_inc")) {
            listProducts = productDAO.listByPriceInc(categoryId);
        }

        request.setAttribute("listProducts", listProducts);
        request.setAttribute("category", category);
//        request.setAttribute("category", category);
        request.setAttribute("listCategories", listCategories);

        HttpSession session = request.getSession();
        Integer idCustomer = null;
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);

        forwardToPage("shop/product_by_category.jsp", request, response);
    }
    public void listAllProduct() throws ServletException, IOException {
        List<Product> listProducts = productDAO.listAll();
        List<Category> listCategories = categoryDAO.listAll();

        String sort = request.getParameter("sort");

        String pageId = request.getParameter("page");

        if (pageId == null) {
            pageId = "1";
        }
        request.setAttribute("pageId", pageId);

        int numberOfPages = listProducts.size();
        int numberOfProducts = 6;

        if (numberOfPages % numberOfProducts != 0) {
            numberOfPages = numberOfPages / numberOfProducts + 1;
        } else {
            numberOfPages = numberOfPages / numberOfProducts;
        }
        request.setAttribute("numberOfPages", numberOfPages);

        int numEnd = Integer.parseInt(pageId) * numberOfProducts - 1;
        int numBegin = numEnd - numberOfProducts + 1;

        request.setAttribute("numBegin", numBegin);
        request.setAttribute("numEnd", numEnd);

        if (Objects.equals(sort, "newest")) {
            listProducts = productDAO.listByNewestProducts();
        }
        if (Objects.equals(sort, "best_selling")){
            listProducts = productDAO.listBestSellingProducts();
        }
        if (Objects.equals(sort, "price_inc")) {
            listProducts = productDAO.listByPriceIncProducts();
        }

        if (Objects.equals(sort, "price_dec")) {
            listProducts = productDAO.listByPriceDecProducts();
        }
        request.setAttribute("sort", sort);



        request.setAttribute("listProducts", listProducts);
        request.setAttribute("listCategories", listCategories);


        HttpSession session = request.getSession();
        Integer idCustomer = null;
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);

        forwardToPage("shop/product_list.jsp", request, response);
    }
    public void viewProductDetail() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("id"));
//        Integer productId = 1;
        Product product = productDAO.get(productId);

        request.setAttribute("product", product);

        HttpSession session = request.getSession();
        Integer idCustomer = null;
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);
        // Lấy danh sách sản phẩm bán chạy nhất
        List<Product> listBestSellingProducts = productDAO.listBestSellingProducts();

        List<Category> listCategories = categoryDAO.listAll();
        request.setAttribute("listCategories", listCategories);

        forwardToPage("shop/product_detail.jsp", request, response);
    }

    public void search() throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> result;


        result = productDAO.search(keyword);
        if (result.size() == 0) {
            request.setAttribute("message", "Found no matching product(s).");
        }

        request.setAttribute("result", result);

        List<CartDetail> listCartDetails = cartDetailDAO.listAll();
        request.setAttribute("listCartDetails", listCartDetails);

        HttpSession session = request.getSession();
        Integer idCustomer = null;
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);
        List<Category> listCategories = categoryDAO.listAll();
        request.setAttribute("listCategories", listCategories);
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
        HttpSession session = request.getSession();
        Integer idCustomer = null;
        Customer customer = (Customer) session.getAttribute("loggedCustomer");
        if (customer != null) {
            idCustomer = customer.getId();
        }

        // Lấy danh sách chi tiết giỏ hàng dựa trên idCustomer
        List<CartDetail> listCartDetailsByIdCustomer = (idCustomer != null)
                ? cartDetailDAO.listAllByIdCustomer(idCustomer)
                : new ArrayList<>(); // Tránh NullPointerException nếu người dùng chưa đăng nhập
        request.setAttribute("listCartDetailsByIdCustomer", listCartDetailsByIdCustomer);

        forwardToPage("product_list.jsp", message, request, response);
    }

    public void loadSelectNameCategories() throws ServletException, IOException {
        List<Category> listGroupCategories = categoryDAO.listGroupCategory();
        request.setAttribute("listGroupCategories", listGroupCategories);
        String groupCategory = request.getParameter("groupCategory");
        System.out.println("Group" + groupCategory);
        if (groupCategory == null) {
            groupCategory = "Áo";
        }
        selectNameCategories = categoryDAO.listNameCategoryByGroup(groupCategory);
        System.out.println(selectNameCategories );

        // Không cần setAttribute vì chúng ta sẽ trả dữ liệu trực tiếp qua AJAX
    }

    public List<Category> getSelectNameCategories() {
        return selectNameCategories;
    }

    public void showNewProductForm() throws ServletException, IOException {
        /*List<Category> listCategories = categoryDAO.listAll();

        request.setAttribute("listCategories", listCategories);
*/
        List<Category> listGroupCategories = categoryDAO.listGroupCategory();
        request.setAttribute("listGroupCategories", listGroupCategories);
        String groupCategory = request.getParameter("groupCategory");
        if (groupCategory == null){
            groupCategory = "Áo";
        }

        List<Category> listNameCategories = categoryDAO.listNameCategoryByGroup(groupCategory);
        request.setAttribute("listNameCategories", listNameCategories);



        forwardToPage("product_form.jsp", request, response);
    }
    private void readProductFields(Product product) throws ServletException, IOException {
        String nameProduct = request.getParameter("nameProduct");
        System.out.println("name "+nameProduct);
        String description = request.getParameter("description");
        System.out.println("mota " +description);
        Float price = Float.parseFloat(request.getParameter("price"));
        System.out.println("giá "+price);

        Instant postDate = Instant.now(); // Lấy thời điểm hiện tại dưới dạng Instant
        System.out.println(postDate);

        Instant updateDate = Instant.now();
        System.out.println(updateDate);

        product.setNameProduct(nameProduct);
        product.setDescription(description);

        product.setPrice(price);
        product.setPostDate(postDate);
        product.setUpdateDate(updateDate);

        String groupCategory = request.getParameter("groupCategory");
        String nameCategory = request.getParameter("nameCategory");
        System.out.println(groupCategory);
        System.out.println(nameCategory);
        Category category = categoryDAO.findByNameAndGroup(nameCategory, groupCategory);
        System.out.println(category);
        product.setCategory(category);


        Part part = request.getPart("imageProduct");
        if (part != null && part.getSize() > 0) {
            InputStream inputStream = part.getInputStream();
            byte[] imageBytes = new byte[inputStream.available()];
            inputStream.read(imageBytes);
            product.setImageProduct(imageBytes);
            inputStream.close();
        }



    }
    public void createProduct() throws ServletException, IOException {
        String nameProduct = request.getParameter("nameProduct");
        System.out.println("name"+nameProduct);
        Product existProduct = productDAO.findByTitle(nameProduct);
        System.out.println("San pham ton tai" + existProduct);
        if (existProduct != null) {
            listProduct(String.format("Could not create new product because the title '%s' already exists.", nameProduct));
            return;
        }

        Product newProduct = new Product();
        readProductFields(newProduct);
        Product createdProduct = productDAO.create(newProduct);

        if (createdProduct.getId() > 0) {
            listProduct("A new product has been created successfully.");
        }
    }


    public void editProduct() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.get(productId);
        System.out.println("id san pham input:" + productId);
        if (product != null) {

//            Category category = categoryDAO.findIdCategoryByName(nameCategory, groupCategory);
//            List<Category> listCategories = categoryDAO.listAll();
            List<Category> listGroupCategories = categoryDAO.listGroupCategory();
            request.setAttribute("listGroupCategories", listGroupCategories);
            String groupCategory = request.getParameter("groupCategory");
            if (groupCategory == null){
                groupCategory = product.getCategory().getGroupCategory();
            }

            List<Category> listNameCategories = categoryDAO.listNameCategoryByGroup(groupCategory);
            request.setAttribute("listNameCategories", listNameCategories);
            request.setAttribute("product", product);
//            request.setAttribute("listCategories", listCategories);

            forwardToPage("product_form.jsp", request, response);
        }


    }

    public void updateProduct() throws ServletException, IOException {
//        System.out.println("id san pham update:" + request.getParameter("productId"));
        Integer productId = Integer.parseInt(request.getParameter("productId"));
        String nameProduct = request.getParameter("nameProduct");
        Product existProduct = productDAO.get(productId);
        Product productByTitle = productDAO.findByTitle(nameProduct);


        readProductFields(existProduct);
        productDAO.update(existProduct);
        listProduct("The product has been updated successfully.");
    }

    public void deleteProduct() throws ServletException, IOException {
        Integer productId = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.get(productId);
        productDAO.delete(productId);
        listProduct("The product has been deleted successfully.");

    }
}