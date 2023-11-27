package model.service.userService;

import model.dao.userDAO.IUserDAO;
import model.dao.userDAO.UserDAOImpl;
import model.entity.User;

import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserDAO userDAO = new UserDAOImpl();

    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(User user) {
        return userDAO.saveOrUpdate(user);
    }

    @Override
    public User findById(Integer integer) {
        return userDAO.findById(integer);
    }

    @Override
    public void delete(Integer integer) {
        userDAO.delete(integer);
    }
}
