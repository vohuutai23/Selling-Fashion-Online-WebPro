package com.ecommerce.DAO;
import java.util.List;
public interface iJPADao <E>{
    E create(E e);

    E update(E e);

    E get(Object id);

    void delete(Object id);

    List<E> listAll();

    long count();
}
