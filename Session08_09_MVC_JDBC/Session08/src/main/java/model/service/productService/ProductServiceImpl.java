package model.service.productService;

import model.dao.productDAO.IProductDAO;
import model.dao.productDAO.ProductDAOImpl;
import model.entity.Product;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductDAO productDAO = new ProductDAOImpl();

    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(Product product) {
        return productDAO.saveOrUpdate(product);
    }

    @Override
    public Product findById(Integer integer) {
        return productDAO.findById(integer);
    }

    @Override
    public void delete(Integer integer) {
        productDAO.delete(integer);
    }
}
