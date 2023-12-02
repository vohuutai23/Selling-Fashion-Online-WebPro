package com.ecommerce.DAO;

import com.ecommerce.model.entity.Cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartDAO extends JPADao<Cart> implements GenericDAO<Cart> {
    @Override
    public Cart create(Cart cart) {
        return super.create(cart);
    }

    @Override
    public Cart update(Cart cart) {
        return super.update(cart);
    }

    @Override
    public Cart get(Object cartId) {
        return super.find(Cart.class, cartId);
    }

    public Cart get(Integer cartId, Integer customerId) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("cartId", cartId);
        parameters.put("customerId", customerId);

        List<Cart> result = super.findWithNamedQuery("ProductOrder.findByIdAndCustomer", parameters);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }

    @Override
    public void delete(Object cartId) {
        super.delete(Cart.class, cartId);
    }

    @Override
    public List<Cart> listAll() {
        return super.findWithNamedQuery("ProductOrder.findAll");
    }

    @Override
    public long count() {
        return super.countWithNamedQuery("ProductOrder.countAll");
    }

    /*public long countOrderDetailByProduct(int productId) {
        return super.countWithNamedQuery("OrderDetail.countByProduct", "productId", productId);
    }*/

    public long countByCustomer(int customerId) {
        return super.countWithNamedQuery("ProductOrder.countByCustomer", "customerId", customerId);
    }

    public List<Cart> listByCustomer(Integer customerId) {
        return super.findWithNamedQuery("ProductOrder.findByCustomer", "customerId", customerId);
    }

//    public List<ProductOrder> listMostRecentSales() {
//        return super.findWithNamedQuery("ProductOrder.findAll", 0, 3);
//    }

}
