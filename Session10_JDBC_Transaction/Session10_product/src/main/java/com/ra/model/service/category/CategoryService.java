package com.ra.model.service.category;

import com.ra.model.entity.Category;
import com.ra.model.service.IGenericService;

import java.util.List;

public interface CategoryService extends IGenericService<Category,Integer> {
    Category findByName(String name);
    Integer getTotalPage(int limitPage, int currentPage);
    List<Category> pagination(int limitPage, int currentPage);
}
