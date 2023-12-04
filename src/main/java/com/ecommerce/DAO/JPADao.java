package com.ecommerce.DAO;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
public class JPADao <E>{
    private static final EntityManagerFactory entityManagerFactory;

    static {
        entityManagerFactory = Persistence.createEntityManagerFactory("onlineShop");
    }

    public JPADao() {
    }

    public E create(E entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(entity);
        entityManager.flush();
        entityManager.refresh(entity);
        entityManager.getTransaction().commit();
        entityManager.close();
        return entity;
    }

    public E update(E entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entity = entityManager.merge(entity);
        entityManager.getTransaction().commit();
        entityManager.close();
        return entity;
    }

    public E find(Class<E> type, Object id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        E entity = entityManager.find(type, id);
        if (entity != null) {
            entityManager.refresh(entity);
        }
        entityManager.close();
        return entity;
    }

    public void delete(Class<E> type, Object id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Object reference = entityManager.getReference(type, id);
        entityManager.remove(reference);
        entityManager.getTransaction().commit();
        entityManager.close();
    }
    public void deleteByTwoFields(Class<E> type, String fieldName1, Object id1, String fieldName2, Object id2) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaDelete<E> criteriaDelete = cb.createCriteriaDelete(type);
        Root<E> root = criteriaDelete.from(type);

        // Assuming that the fields are of type String
        criteriaDelete.where(cb.and(cb.equal(root.get(fieldName1), id1), cb.equal(root.get(fieldName2), id2)));

        Query query = entityManager.createQuery(criteriaDelete);
        query.executeUpdate();

        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @SuppressWarnings("unchecked")
    public List<E> findWithNamedQuery(String queryName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        List<E> result = query.getResultList();
        entityManager.close();
        return result;
    }

    @SuppressWarnings("unchecked")
    public List<E> findWithNamedQuery(String queryName, String paramName, Object paramValue) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        query.setParameter(paramName, paramValue);
        List<E> result = query.getResultList();
        entityManager.close();
        return result;
    }

    @SuppressWarnings("unchecked")
    public List<E> findWithNamedQuery(String queryName, Map<String, Object> parameters) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        Set<Entry<String, Object>> setParameters = parameters.entrySet();
        for (Entry<String, Object> entry : setParameters) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        List<E> result = query.getResultList();
        entityManager.close();
        return result;
    }

    @SuppressWarnings("unchecked")
    public List<E> findWithNamedQuery(String queryName, int firstResult, int maxResult) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        query.setFirstResult(firstResult);
        query.setMaxResults(maxResult);
        List<E> result = query.getResultList();
        entityManager.close();
        return result;
    }

    @SuppressWarnings("unchecked")
    public List<Object[]> findWithNamedQueryObjects(String queryName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        List<Object[]> result = query.getResultList();
        entityManager.close();
        return result;
    }

    @SuppressWarnings("unchecked")
    public List<Object[]> findWithNamedQueryObjects(String queryName, String paramName, Object paramValue) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        query.setParameter(paramName, paramValue);
        List<Object[]> result = query.getResultList();
        entityManager.close();
        return result;
    }

    @SuppressWarnings("unchecked")
    public List<Object[]> findWithNamedQueryObjects(String queryName, Map<String, Object> parameters) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        Set<Entry<String, Object>> setParameters = parameters.entrySet();
        for (Entry<String, Object> entry : setParameters) {
            query.setParameter(entry.getKey(), entry.getValue());
        }
        List<Object[]> result = query.getResultList();
        entityManager.close();
        return result;
    }

    public long countWithNamedQuery(String queryName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        long result = (long) query.getSingleResult();
        entityManager.close();
        return result;
    }

    public long countWithNamedQuery(String queryName, String paramName, Object paramValue) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createNamedQuery(queryName);
        query.setParameter(paramName, paramValue);
        long result = (long) query.getSingleResult();
        entityManager.close();
        return result;
    }

    public void close() {
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
