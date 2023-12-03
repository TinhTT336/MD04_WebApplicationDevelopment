package com.ra.model.dao.product;

import com.ra.model.entity.Category;
import com.ra.model.entity.Product;

import java.util.List;

public interface ProductDAO {
    List<Product> findAll();
    Product findById(Integer id);
    Boolean saveOrUpdate(Product product);
    void delete (Integer id);
    List<Product>findByName(String name);
    List<Product>pagination(int limit, int currentPage);
}
