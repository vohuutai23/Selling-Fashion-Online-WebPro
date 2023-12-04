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

    /*public void insertOrderDetail(int idOrder, int idProduct, int quantity, float totalPrice) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        // Tạo đối tượng OrderDetail mới
        OrderDetail orderDetail = new OrderDetail();

        // Thiết lập các thuộc tính
        orderDetail.setOrder(new ProductOrder(idOrder)); // Giả sử ProductOrder có constructor với ID
        orderDetail.setProduct(new Product(idProduct)); // Giả sử Product có constructor với ID
        orderDetail.setQuantity(quantity);
        orderDetail.setTotalPrice(totalPrice);

        // Lưu vào cơ sở dữ liệu
        entityManager.persist(orderDetail);

        entityManager.getTransaction().commit();
        entityManager.close();
    }*/


}
