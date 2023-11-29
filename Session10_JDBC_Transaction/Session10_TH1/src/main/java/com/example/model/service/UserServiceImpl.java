package com.example.model.service;

import com.example.model.dao.UserDAO;
import com.example.model.dao.UserDAOImpl;
import com.example.model.entity.User;

import java.util.List;

public class UserServiceImpl implements UserService {
    private final UserDAO userDAO = new UserDAOImpl();

    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(User user) {
        return userDAO.saveOrUpdate(user);
    }

    @Override
    public void delete(Integer id) {
        userDAO.delete(id);
    }

    @Override
    public User findById(Integer id) {
        return userDAO.findById(id);
    }
}
