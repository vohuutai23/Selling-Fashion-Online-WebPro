package com.ecommerce.DAO;

import com.ecommerce.model.entity.Category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CategoryDAO extends JPADao<Category> implements GenericDAO<Category> {

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


    public List<Category> listGroupCategory() {
        return super.findWithNamedQuery("Category.findDistinctGroupCategories");
    }

    public List<Category> listNameCategoryByGroup(String nameGroup) {
        return super.findWithNamedQuery("Category.listNameCategoryByGroup", "groupCategory", nameGroup);
    }

    public Category findByName(String nameCategory) {
        List<Category> result = super.findWithNamedQuery("Category.findByName", "nameCategory", nameCategory);

        if (result != null && result.size() > 0) {
            return result.get(0);
        }
        return null;
    }
    public Category findGroupCategoryByName(String nameCategory) {
        List<Category> result = super.findWithNamedQuery("Category.findGroupCategoryByName", "nameCategory", nameCategory);

        if (result != null && result.size() > 0) {
            return result.get(0);
        }
        return null;
    }
    public Category findIdCategoryByName(String nameCategory) {
        List<Category> result = super.findWithNamedQuery("Category.findIdCategoryByName", "nameCategory", nameCategory);

        if (result != null && result.size() > 0) {
            return result.get(0);
        }
        return null;
    }
    /*public List<Category> findByNameAndGroup(String nameCategory, String groupCategory) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("nameCategory", nameCategory);
        parameters.put("groupCategory", groupCategory);

        return super.findWithNamedQuery("Category.findByNameAndGroup", parameters);
    }*/
    public Category findByNameAndGroup(String nameCategory, String groupCategory) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("nameCategory", nameCategory);
        parameters.put("groupCategory", groupCategory);

        List<Category> result = super.findWithNamedQuery("Category.findByNameAndGroup", parameters);

        if (!result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }

}
