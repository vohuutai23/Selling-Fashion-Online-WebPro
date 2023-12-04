package com.ecommerce.DAO;

import com.ecommerce.model.entity.Product;

import java.util.List;

public class ProductDAO extends JPADao<Product> implements GenericDAO<Product> {


    @Override
    public Product get(Object productId) {
        return super.find(Product.class, productId);
    }


    @Override

    public List<Product> listAll() {
        return super.findWithNamedQuery("Product.findAll");
    }

    public List<Product> listByNewestProducts() {
        return super.findWithNamedQuery("Product.findByProductAndNewest");
    }
    public List<Product> listByPriceDecProducts() {
        return super.findWithNamedQuery("Product.findByProductAndPriceDec");
    }
    public List<Product> listByPriceIncProducts() {
        return super.findWithNamedQuery("Product.findByProductAndPriceInc");
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

    public List<Product> listByNewest(int categoryId) {
        return super.findWithNamedQuery("Product.findByCategoryAndNewest", "categoryId", categoryId);
    }
    public List<Product> listByPriceInc(int categoryId) {
        return super.findWithNamedQuery("Product.findByCategoryAndPriceInc", "categoryId", categoryId);
    }
    public List<Product> listByPriceDec(int categoryId) {
        return super.findWithNamedQuery("Product.findByCategoryAndPriceDec", "categoryId", categoryId);
    }

    public List<Product> listBestSellingProducts() {
        return super.findWithNamedQuery("OrderDetail.bestSelling");
    }
    public List<Product> listBestSellingProductsByCategory(Integer categoryId) {
        return super.findWithNamedQuery("OrderDetail.bestSellingByCategory","categoryId", categoryId);
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

    public long countByCategory(int categoryId) {
        return super.countWithNamedQuery("Product.countByCategory", "idCategory", categoryId);
    }

}