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

    //Tìm kiếm theo tên (tìm các san phẩm có chứa kí tự giống kí tự tìm kiếm)
    public Product findByTitle(String nameProduct) {
        List<Product> result = super.findWithNamedQuery("Product.findByTitle", "nameProduct", nameProduct);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }

    // List các sản phẩm có ngày đăng mới nhất
    public List<Product> listNewProducts(){
        return super.findWithNamedQuery("Product.findNew");
    }
}
