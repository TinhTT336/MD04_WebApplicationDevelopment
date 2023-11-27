package model.dao.productDAO;

import model.dao.categoryDAO.ICategoryDAO;
import model.entity.Category;
import model.entity.Product;
import util.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements IProductDAO {

    @Override
    public List<Product> findAll() {
        Connection connection = null;
        List<Product> products = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT* FROM product");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setProductStatus(rs.getBoolean("product_status"));
                product.setStock(rs.getInt("stock"));
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
        int check;
        try {
            connection = ConnectionDB.openConnection();
            if (findById(product.getProductId()) == null) {
                String sql = "INSERT INTO product(product_name, description,product_status, stock)VALUES (?,?,?,?)";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, product.getProductName());
                preparedStatement.setString(2, product.getDescription());
                preparedStatement.setBoolean(3, product.isProductStatus());
                preparedStatement.setInt(4, product.getStock());
             check = preparedStatement.executeUpdate();
            } else {
                String sql = "UPDATE product SET product_name=?,description=?,product_status=?,stock=? WHERE product_id=?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, product.getProductName());
                preparedStatement.setString(2, product.getDescription());
                preparedStatement.setBoolean(3, product.isProductStatus());
                preparedStatement.setInt(4, product.getStock());
                preparedStatement.setInt(5, product.getProductId());
                check = preparedStatement.executeUpdate();
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
    public Product findById(Integer integer) {
//        for (Product product : findAll()) {
//            if (product.getProductId() == integer) {
//                return product;
//            }
//        }

        Connection connection = null;
        Product product = new Product();
        try {
            connection = ConnectionDB.openConnection();
            PreparedStatement pstm = connection.prepareStatement(" SELECT * FROM product where product_id=?");
            pstm.setInt(1, integer);
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                product.setProductId(resultSet.getInt("product_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setDescription(resultSet.getString("description"));
                product.setProductStatus(resultSet.getBoolean("product_status"));
                product.setStock(resultSet.getInt("stock"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return product;
    }

    @Override
    public void delete(Integer integer) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            String sql = "DELETE FROM product WHERE product_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, integer);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
    }
}
