package com.ra.model.dao.product;

import com.ra.model.dao.category.CategoryDAO;
import com.ra.model.dao.category.CategoryDAOImpl;
import com.ra.model.entity.Category;
import com.ra.model.entity.Product;
import com.ra.util.ConnectionDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {
    public  static int totalPage=0;

    private final CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    public List<Product> findAll() {
        Connection connection = null;
        List<Product> products = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_GET_PRODUCT()}");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getInt("id"));
                product.setProductName(resultSet.getString("name"));
                product.setPrice(resultSet.getFloat("price"));
                product.setCategory(new CategoryDAOImpl().findById(resultSet.getInt("category_id")));

                products.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return products;
    }

    @Override
    public boolean saveOrUpdate(Product product) {
        Connection connection = null;
        connection = ConnectionDB.openConnection();
        try {
            if (product.getProductId() == 0) {
                connection.setAutoCommit(false);
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_ADD_PRODUCT(?,?,?)}");
                callableStatement.setString(1, product.getProductName());
                callableStatement.setFloat(2, product.getPrice());
                callableStatement.setInt(3, product.getCategory().getCategoryId());
                int s1 = callableStatement.executeUpdate();

                CallableStatement statement = connection.prepareCall("{CALL PROC_UPDATE_CATEGORY_QUANTITY(?)}");
                statement.setInt(1, product.getCategory().getCategoryId());
                int s2 = statement.executeUpdate();
                if (s1 > 0 && s2 > 0) {
                    connection.commit();
                    return true;
                } else {
                    connection.rollback();
                }
            } else {
                connection.setAutoCommit(false);
                Category categoryEdit = categoryDAO.findById(product.getCategory().getCategoryId());
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_UPDATE_PRODUCT(?,?,?,?)}");
                callableStatement.setString(1, product.getProductName());
                callableStatement.setFloat(2, product.getPrice());
                callableStatement.setInt(3, product.getCategory().getCategoryId());
                callableStatement.setInt(4, product.getProductId());
                int s3 = callableStatement.executeUpdate();

                CallableStatement statement = connection.prepareCall("{CALL PROC_UPDATE_CATEGORY_WHEN_PRODUCT_UPDATE(?,?)}");
                statement.setInt(1, categoryEdit.getCategoryId());
                statement.setInt(2, product.getCategory().getCategoryId());
                int s4 = statement.executeUpdate();

                if (s3 > 0 && s4 > 0) {
                    connection.commit();
                    return true;
                } else {
                    connection.rollback();
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public void delete(Integer id) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            connection.setAutoCommit(false);
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_DELETE_PRODUCT(?)}");
            callableStatement.setInt(1, id);
            int check = callableStatement.executeUpdate();

            CallableStatement statement = connection.prepareCall("{CALL PROC_UPDATE_CATEGORY_WHEN_PRODUCT_DELETE(?)}");
            statement.setInt(1, findById(id).getCategory().getCategoryId());
            int check1 = statement.executeUpdate();

            if (check > 0 && check1 > 0) {
                connection.commit();
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
    }

    @Override
    public Product findById(Integer id) {
        Connection connection = null;
        Product product = new Product();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_PRODUCT_BY_ID(?)}");
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                product.setProductId(rs.getInt("id"));
                product.setProductName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setCategory(new CategoryDAOImpl().findById(rs.getInt("category_id")));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return product;
    }


    @Override
    public List<Product> pagination(int limit, int currentPage) {
        Connection connection=null;
        List<Product>products=new ArrayList<>();
        try {
        connection=ConnectionDB.openConnection();
            CallableStatement callableStatement= connection.prepareCall("{CALL PROC_PAGINATION_PRODUCT(?,?,?)}");
            callableStatement.setInt(1,limit);
            callableStatement.setInt(2,currentPage);
            callableStatement.registerOutParameter(3,java.sql.Types.INTEGER);
            ResultSet resultSet= callableStatement.executeQuery();
            totalPage=callableStatement.getInt(3);
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getInt("id"));
                product.setProductName(resultSet.getString("name"));
                product.setPrice(resultSet.getFloat("price"));
                product.setCategory(new CategoryDAOImpl().findById(resultSet.getInt("category_id")));

                products.add(product);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            ConnectionDB.closeConnection(connection);
        }
        return products;
    }
}