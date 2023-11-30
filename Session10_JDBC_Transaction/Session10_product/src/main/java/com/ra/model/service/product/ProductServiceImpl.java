package com.ra.model.service.product;

import com.ra.model.dao.product.ProductDAO;
import com.ra.model.dao.product.ProductDAOImpl;
import com.ra.model.entity.Product;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(Product product) {
        return productDAO.saveOrUpdate(product);
    }

    @Override
    public void delete(Integer id) {
        productDAO.delete(id);
    }

    @Override
    public Product findById(Integer id) {
        return productDAO.findById(id);
    }

    @Override
    public List<Product> pagination(int limit, int currentPage) {
        return productDAO.pagination(limit,currentPage);
    }
}
