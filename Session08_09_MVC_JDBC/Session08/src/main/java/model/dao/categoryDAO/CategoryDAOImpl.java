package model.dao.categoryDAO;

import model.entity.Category;
import util.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements ICategoryDAO {

    @Override
    public List<Category> findAll() {
        Connection connection = null;
        List<Category> categories = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            PreparedStatement pstm = connection.prepareStatement(" SELECT * FROM category");
            ResultSet resultSet = pstm.executeQuery();

            // executeQuery- thực thi với câu lệnh select
            // executeUpdate- dùng với trường hợp thay đổi dữ liệu
            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
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
        try {
            connection = ConnectionDB.openConnection();
            if (findById(category.getCategoryId()) == null) {
                String sql = "INSERT INTO category(name,status)VALUES(?,?)";
                PreparedStatement pstm = connection.prepareStatement(sql);
                pstm.setString(1, category.getCategoryName());
                pstm.setBoolean(2, category.isCategoryStatus());
                int check = pstm.executeUpdate();
                if (check > 0) {
                    return true;
                }
            } else {
                String sql = "UPDATE category SET name=?,status=? WHERE id=?";

                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, category.getCategoryName());
                preparedStatement.setBoolean(2, category.isCategoryStatus());
                preparedStatement.setInt(3, category.getCategoryId());
                int check = preparedStatement.executeUpdate();
                if (check > 0) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return false;
    }

    @Override
    public Category findById(Integer id) {
        Connection connection = null;
        Category category = new Category();
        try {
            connection = ConnectionDB.openConnection();
            PreparedStatement pstm = connection.prepareStatement(" SELECT * FROM category where id=?");
            pstm.setInt(1, id);
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                category.setCategoryId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("name"));
                category.setCategoryStatus(resultSet.getBoolean("status"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }

        //cach 2:
//        List<Category> categories = findAll();
//        for (Category category : categories) {
//            if (category.getCategoryId() == integer) {
//                return category;
//            }
//        }
//        return null;
        return category;
    }

    @Override
    public void delete(Integer id) {
        Connection connection = null;
        try {
            if (findById(id) != null) {
                connection = ConnectionDB.openConnection();
                String sql = "DELETE FROM category WHERE id=?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
    }

}
