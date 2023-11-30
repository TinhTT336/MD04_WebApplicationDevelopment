package com.ra.model.dao.category;

import com.ra.model.entity.Category;
import com.ra.util.ConnectionDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CategoryDAOImpl implements CategoryDAO {
    @Override
    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        Connection connection = null;

        connection = ConnectionDB.openConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_GET_CATEGORY()}");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
                category.setQuantityProduct(resultSet.getInt("quantity_product"));

                categories.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return categories;
    }

    @Override
    public boolean saveOrUpdate(Category category) {
        Connection connection = null;
        int check;

        try {
            connection = ConnectionDB.openConnection();
            if (category.getCategoryId() == 0) {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_ADD_CATEGORY(?)}");
                callableStatement.setString(1, category.getCategoryName());
                check = callableStatement.executeUpdate();
            } else {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_UPDATE_CATEGORY(?,?,?)}");
                callableStatement.setString(1, category.getCategoryName());
                callableStatement.setBoolean(2, category.isCategoryStatus());
                callableStatement.setInt(3, category.getCategoryId());
                check = callableStatement.executeUpdate();


            }
            if (check > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return false;
    }

    @Override
    public void delete(Integer id) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_DELETE_CATEGORY(?)}");
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
    }

    @Override
    public Category findById(Integer id) {
        Connection connection = null;
        Category category = new Category();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_CATEGORY_BY_ID(?)}");
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                category.setCategoryId(rs.getInt("id"));
                category.setCategoryName(rs.getString("name"));
                category.setCategoryStatus(rs.getBoolean("status"));
                category.setQuantityProduct(rs.getInt("quantity_product"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return category;
    }

    @Override
    public Category findByName(String name) {
        Connection connection = null;
        Category category = new Category();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("SELECT*FROM category WHERE name=?");
            callableStatement.setString(1, name);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                category.setCategoryId(rs.getInt("id"));
                category.setCategoryName(rs.getString("name"));
                category.setCategoryStatus(rs.getBoolean("status"));
                category.setQuantityProduct(rs.getInt("quantity_product"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return category;
    }

    @Override
    public Integer getTotalPage(int limitPage, int currentPage) {
        Connection connection = null;
        Integer totalPage = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_PAGINATION_CATEGORY(?,?,?)}");
            callableStatement.setInt(1, limitPage);
            callableStatement.setInt(2, currentPage);
            callableStatement.registerOutParameter(3, java.sql.Types.INTEGER);
            callableStatement.executeQuery();
            totalPage = callableStatement.getInt(3);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return totalPage;
    }

    @Override
    public List<Category> pagination(int limitPage, int currentPage) {
        Connection connection = null;
        List<Category> categories = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_PAGINATION_CATEGORY(?,?,?)}");
            callableStatement.setInt(1, limitPage);
            callableStatement.setInt(2, currentPage);
            callableStatement.registerOutParameter(3, java.sql.Types.INTEGER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
                category.setQuantityProduct(resultSet.getInt("quantity_product"));
                categories.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return categories;
    }
}
