package com.ra.model.dao.category;

import com.ra.model.dao.IGenericDAO;
import com.ra.model.entity.Category;
import com.ra.model.entity.Product;

public interface CategoryDAO extends IGenericDAO<Category,Integer> {
    Category findByName(String name);
}
