package com.ecommerce.DAO;

import com.ecommerce.model.entity.CartDetail;
import com.ecommerce.model.entity.OrderDetail;
import com.ecommerce.model.entity.ProductOrder;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class OrderDetailDAO extends JPADao<OrderDetail> implements GenericDAO<OrderDetail>{
    private static final EntityManagerFactory entityManagerFactory;

    static {
        entityManagerFactory = Persistence.createEntityManagerFactory("onlineShop");
    }
    @Override
    public OrderDetail create(OrderDetail orderDetail) {
        return super.create(orderDetail);
    }

    @Override
    public OrderDetail update(OrderDetail orderDetail) {
        return super.update(orderDetail);
    }

    @Override
    public OrderDetail get(Object orderId) {
        return super.find(OrderDetail.class, orderId);
    }

    @Override
    public void delete(Object id) {
        System.out.println("check xoa "+id);
        super.delete(OrderDetail.class, id);
        System.out.println("check xoa 2 "+id);
    }

    @Override
    public List<OrderDetail> listAll() {
        return findWithNamedQuery("CartDetail.findAll");
    }


    @Override
    public long count() {
        return 0;
    }




}
