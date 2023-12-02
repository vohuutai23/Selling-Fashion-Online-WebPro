package com.ecommerce.DAO;

import com.ecommerce.model.entity.Cart;
import com.ecommerce.model.entity.CartDetail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartDetailDAO extends JPADao<CartDetail> implements GenericDAO<CartDetail> {
    @Override
    public CartDetail create(CartDetail cartDetail) {
        return super.create(cartDetail);
    }

    @Override
    public CartDetail update(CartDetail cartDetail) {
        return super.update(cartDetail);
    }

    @Override
    public CartDetail get(Object cartId) {
        return super.find(CartDetail.class, cartId);
    }

    @Override
    public void delete(Object id) {

    }

    @Override
    public List<CartDetail> listAll() {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    public CartDetail findCartDetailByCartAndProduct(Integer cartId, Integer productId) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("cartId", cartId);
        parameters.put("productId", productId);

        List<CartDetail> result = super.findWithNamedQuery("CartDetail.findByCartAndProduct", parameters);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }
    public CartDetail updateCartDetail(CartDetail cartDetail) {
        return super.update(cartDetail);
    }
    /*public CartDetail findByCart(Integer cartId) {
        List<CartDetail> result = super.findWithNamedQuery("CartDetail.findByCart", "idCart", cartId);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }*/
    public List<CartDetail> listByCart(Integer cartId) {
        return super.findWithNamedQuery("CartDetail.findByCart", "idCart", cartId);
    }
}
