package com.ecommerce.DAO;

import com.ecommerce.model.entity.Category;

import java.util.List;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

    @Override
    public Category create(Category category) {
        return super.create(category);
    }

    @Override
    public Category update(Category category) {
        return super.update(category);
    }

    @Override
    public Category get(Object categoryId) {
        return super.find(Category.class, categoryId);
    }

    @Override
    public void delete(Object categoryId) {
        super.delete(Category.class, categoryId);
    }

    @Override
    public List<Category> listAll() {
        return super.findWithNamedQuery("Category.findAll");
    }

    @Override
    public long count() {
        return super.countWithNamedQuery("Category.countAll");
    }

    public Category findByName(String categoryName) {
        List<Category> result = super.findWithNamedQuery("Category.findByName", "categoryName", categoryName);

        if (result != null && result.size() > 0) {
            return result.get(0);
        }
        return null;
    }
}
