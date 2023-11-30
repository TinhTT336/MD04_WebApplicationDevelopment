package com.ra.model.dao.category;

import com.ra.model.dao.IGenericDAO;
import com.ra.model.entity.Category;
import com.ra.model.entity.Product;

import java.util.List;
import java.util.Map;

public interface CategoryDAO extends IGenericDAO<Category,Integer> {
    Category findByName(String name);
   Integer getTotalPage(int limitPage, int currentPage);
   List<Category> pagination(int limitPage, int currentPage);
}
