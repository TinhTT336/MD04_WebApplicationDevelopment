package model.service.categoryService;

import model.dao.categoryDAO.CategoryDAOImpl;
import model.dao.categoryDAO.ICategoryDAO;
import model.entity.Category;

import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    private ICategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    public List<Category> findAll() {
        return categoryDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(Category category) {
        return categoryDAO.saveOrUpdate(category);
    }

    @Override
    public Category findById(Integer id) {
        return categoryDAO.findById(id);
    }

    @Override
    public void delete(Integer id) {
        categoryDAO.delete(id);
    }
}
