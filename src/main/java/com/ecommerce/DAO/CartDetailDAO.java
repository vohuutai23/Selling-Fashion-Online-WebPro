package com.ecommerce.DAO;

import com.ecommerce.model.entity.Cart;
import com.ecommerce.model.entity.CartDetail;
import com.ecommerce.model.entity.CartDetailId;
import com.ecommerce.model.entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
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
        System.out.println("check xoa "+id);
        super.delete(CartDetail.class, id);
        System.out.println("check xoa 2 "+id);
    }

    @Override
    public List<CartDetail> listAll() {
        return findWithNamedQuery("CartDetail.findAll");
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

    public CartDetail findByID(CartDetailId cartDetailId) {
        List<CartDetail> result = super.findWithNamedQuery("CartDetail.findByID", "cartDetailId", cartDetailId);

        if (result != null && result.size() > 0) {
            return result.get(0);
        }
        return null;
    }
    private static final EntityManagerFactory entityManagerFactory;

    static {
        entityManagerFactory = Persistence.createEntityManagerFactory("onlineShop");
    }

    // Các phương thức khác của lớp CartDetailDAO

    public void deleteByCartAndProduct(Integer cartId, Integer productId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        // Tạo truy vấn xóa
        Query query = entityManager.createQuery("DELETE FROM CartDetail c WHERE c.cart.id = :cartId AND c.product.id = :productId");
        query.setParameter("cartId", cartId);
        query.setParameter("productId", productId);

        // Thực thi truy vấn
        query.executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }
    public void deleteByCart(Integer cartId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        // Tạo truy vấn xóa
        Query query = entityManager.createQuery("DELETE FROM CartDetail c WHERE c.cart.id = :cartId");
        query.setParameter("cartId", cartId);


        // Thực thi truy vấn
        query.executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }

}
