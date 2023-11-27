package model.service.categoryService;

import model.entity.Category;
import model.service.IGenericService;

import java.util.Calendar;
import java.util.List;

public interface ICategoryService extends IGenericService<Category,Integer> {
    List<Category> findByName(String name);
}
