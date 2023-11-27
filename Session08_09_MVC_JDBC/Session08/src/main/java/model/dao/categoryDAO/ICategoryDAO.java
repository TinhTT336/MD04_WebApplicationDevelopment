package model.dao.categoryDAO;

import model.dao.IGenericDAO;
import model.entity.Category;

import java.util.List;

public interface ICategoryDAO extends IGenericDAO<Category,Integer> {

    List<Category> findByName(String name);
}
