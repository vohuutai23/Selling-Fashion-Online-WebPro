package com.ecommerce.DAO;

import com.ecommerce.model.entity.Product;

import java.util.List;

public class ProductDAO extends JpaDAO<Product> implements GenericDAO<Product> {


    @Override
    public Product get(Object productId) {
        return super.find(Product.class, productId);
    }

    public List<Product> listActive() {
        return super.findWithNamedQuery("Product.findActive");
    }
    @Override

    public List<Product> listAll() {
        return super.findWithNamedQuery("Product.findAll");
    }

    @Override
    public void delete(Object productId) {
        super.delete(Product.class, productId);
    }

    @Override
    public long count() {
        return super.countWithNamedQuery("Product.countAll");
    }

    public List<Product> listByCategory(int categoryId) {
        return super.findWithNamedQuery("Product.findByCategory", "categoryId", categoryId);
    }
    public List<Product> search(String keyword) {
        return super.findWithNamedQuery("Product.search", "keyword", keyword);
    }
}
