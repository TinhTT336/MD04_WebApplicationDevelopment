package com.ra.model.service.classes;

import com.ra.model.dao.classes.ClassDAO;
import com.ra.model.dao.classes.ClassDAOImpl;
import com.ra.model.entity.Classes;

import java.util.List;

public class ClassServiceImpl implements ClassService {
    private final ClassDAO classDAO = new ClassDAOImpl();

    @Override
    public List<Classes> findAll() {
        return classDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(Classes classes) {
        return classDAO.saveOrUpdate(classes);
    }

    @Override
    public Classes findById(Integer id) {
        return classDAO.findById(id);
    }

    @Override
    public void delete(Integer id) {
        classDAO.delete(id);
    }

    @Override
    public List<Classes> findByName(String name) {
        return classDAO.findByName(name);
    }
}
