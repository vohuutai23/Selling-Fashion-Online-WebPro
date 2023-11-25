package com.ecommerce.DAO;

import com.ecommerce.model.entity.Product;
import com.ecommerce.DAO.JPADao;
//import com.ecommerce.utility.HashUtility;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;

public class ProductDAO extends JPADao<Product> implements iJPADao<Product> {

    @Override
    public Product create(Product product) {
       // product.setLastUpdateTime(new Date());
        return super.create(product);
    }

    @Override
    public Product update(Product product) {
       // product.setLastUpdateTime(new Date());
        return super.update(product);
    }

    @Override
    public Product get(Object productId) {
        return super.find(Product.class, productId);
    }

    @Override
    public void delete(Object productId) {
        super.delete(Product.class, productId);
    }

    @Override
    public List<Product> listAll() {
        return super.findWithNamedQuery("Product.findAll");
    }

    @Override
    public long count() {
        return super.countWithNamedQuery("Product.countAll");
    }

    public List<Product> listActive() {
        return super.findWithNamedQuery("Product.findActive");
    }

    public Product findByTitle(String title) {
        List<Product> result = super.findWithNamedQuery("Product.findByTitle", "title", title);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }

    public List<Product> listByCategory(int categoryId) {
        return super.findWithNamedQuery("Product.findByCategory", "categoryId", categoryId);
    }

    public List<Product> listNewProducts() {
        return super.findWithNamedQuery("Product.findNew");
    }

    public List<Product> listNewProducts(int categoryId) {
        return super.findWithNamedQuery("Product.findNewAndByCategory", "categoryId", categoryId);
    }

    public List<Product> search(String keyword) {
        return super.findWithNamedQuery("Product.search", "keyword", keyword);
    }

    public long countByCategory(int categoryId) {
        return super.countWithNamedQuery("Product.countByCategory", "categoryId", categoryId);
    }

    public List<Product> listBestSellingProducts() {
        return super.findWithNamedQuery("OrderDetail.bestSelling");
    }

    public List<Product> listBestSellingProducts(int categoryId) {
        return super.findWithNamedQuery("OrderDetail.bestSellingFindByCategory", "categoryId", categoryId);
    }

    public List<Product> listMostFavoredProducts() {
        List<Product> mostFavoredProducts = new ArrayList<>();
        List<Object[]> result = super.findWithNamedQueryObjects("Review.mostFavored");

        if (!result.isEmpty()) {
            for (Object[] elements : result) {
                Product product = (Product) elements[0];
                mostFavoredProducts.add(product);
            }
        }
        return mostFavoredProducts;
    }

    public List<Product> listMostFavoredProducts(int categoryId) {
        List<Product> mostFavoredProducts = new ArrayList<>();
        List<Object[]> result = super.findWithNamedQueryObjects("Review.mostFavoredFindByCategory", "categoryId",
                categoryId);

        if (!result.isEmpty()) {
            for (Object[] elements : result) {
                Product product = (Product) elements[0];
                mostFavoredProducts.add(product);
            }
        }
        return mostFavoredProducts;
    }

    public List<Product> listByPriceDesc() {
        return super.findWithNamedQuery("Product.findActiveAndPriceDesc");
    }

    public List<Product> listByPrice() {
        return super.findWithNamedQuery("Product.findActiveAndPriceAsc");
    }

    public List<Product> listByPriceDesc(int categoryId) {
        return super.findWithNamedQuery("Product.findByCategoryAndPriceDesc", "categoryId", categoryId);
    }

    public List<Product> listByPrice(int categoryId) {
        return super.findWithNamedQuery("Product.findByCategoryAndPriceAsc", "categoryId", categoryId);
    }

    public List<Product> listRatedProducts(double ratingStars) {
        List<Product> listRatingProducts = new ArrayList<>();
        List<Object[]> result = super.findWithNamedQueryObjects("Review.listRated", "ratingStars", ratingStars);

        if (!result.isEmpty()) {
            for (Object[] elements : result) {
                Product product = (Product) elements[0];
                listRatingProducts.add(product);
            }
        }
        return listRatingProducts;
    }

    public List<Product> listRatedProducts(int categoryId, double ratingStars) {
        List<Product> listRatedProducts = new ArrayList<>();
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("categoryId", categoryId);
        parameters.put("ratingStars", ratingStars);

        List<Object[]> result = super.findWithNamedQueryObjects("Review.listRatedFindByCategory", parameters);

        if (!result.isEmpty()) {
            for (Object[] elements : result) {
                Product product = (Product) elements[0];
                listRatedProducts.add(product);
            }
        }
        return listRatedProducts;
    }

    public List<Product> listOrderedProductsByCustomer(int customerId) {
        return super.findWithNamedQuery("OrderDetail.findByCustomer", "customerId", customerId);
    }

}
