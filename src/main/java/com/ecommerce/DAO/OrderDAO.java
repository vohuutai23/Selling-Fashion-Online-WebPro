package com.ecommerce.DAO;

import com.ecommerce.DAO.GenericDAO;
import com.ecommerce.DAO.JPADao;
import com.ecommerce.model.entity.ProductOrder;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderDAO extends JPADao<ProductOrder> implements GenericDAO<ProductOrder> {

    @Override
    public ProductOrder create(ProductOrder order) {
        order.setDateOrder(new Date());
        order.setStatus("Processing");
        return super.create(order);
    }

    @Override
    public ProductOrder update(ProductOrder order) {
        return super.update(order);
    }

    @Override
    public ProductOrder get(Object orderId) {
        return super.find(ProductOrder.class, orderId);
    }

    public ProductOrder get(Integer orderId, Integer customerId) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("orderId", orderId);
        parameters.put("customerId", customerId);

        List<ProductOrder> result = super.findWithNamedQuery("ProductOrder.findByIdAndCustomer", parameters);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }

    @Override
    public void delete(Object orderId) {
        super.delete(ProductOrder.class, orderId);
    }

    @Override
    public List<ProductOrder> listAll() {
        return super.findWithNamedQuery("ProductOrder.findAll");
    }

    @Override
    public long count() {
        return super.countWithNamedQuery("ProductOrder.countAll");
    }

    public long countOrderDetailByProduct(int productId) {
        return super.countWithNamedQuery("OrderDetail.countByProduct", "productId", productId);
    }

    public long countByCustomer(int customerId) {
        return super.countWithNamedQuery("ProductOrder.countByCustomer", "customerId", customerId);
    }

    public List<ProductOrder> listByCustomer(Integer customerId) {
        return super.findWithNamedQuery("ProductOrder.findByCustomer", "customerId", customerId);
    }

    public List<ProductOrder> listMostRecentSales() {
        return super.findWithNamedQuery("ProductOrder.findAll", 0, 3);
    }

}
