package com.ra.model.dao.classes;

import com.ra.model.entity.Classes;
import com.ra.util.ConnectionDB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassDAOImpl implements ClassDAO {
    @Override
    public List<Classes> findAll() {
        Connection connection = null;
        List<Classes> classList = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_GET_CLASSES()}");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Classes classes = new Classes();
                classes.setClassID(resultSet.getInt("id"));
                classes.setClassName(resultSet.getString("name"));
                classes.setClassStatus(resultSet.getBoolean("status"));
                classList.add(classes);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return classList;
    }

    @Override
    public boolean saveOrUpdate(Classes classes) {
        Connection connection = null;
        int check;
        try {
            connection = ConnectionDB.openConnection();
            if ((classes.getClassID()) == 0) {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_ADD_CLASS(?,?)}");
                callableStatement.setString(1, classes.getClassName());
                callableStatement.setBoolean(2, classes.isClassStatus());
                check = callableStatement.executeUpdate();
            } else {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_EDIT_CLASS(?,?,?)}");
                callableStatement.setString(1, classes.getClassName());
                callableStatement.setBoolean(2, classes.isClassStatus());
                callableStatement.setInt(3, classes.getClassID());
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
    public Classes findById(Integer id) {
        Connection connection = null;
        Classes classes = new Classes();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_CLASS_BY_ID(?)}");
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                classes.setClassID(resultSet.getInt("id"));
                classes.setClassName(resultSet.getString("name"));
                classes.setClassStatus(resultSet.getBoolean("status"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return classes;
    }

    @Override
    public void delete(Integer id) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_DELETE_CLASS(?)}");
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
    }

    @Override
    public List<Classes> findByName(String name) {
        List<Classes> classesList = new ArrayList<>();
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_CLASS_BY_NAME(?)}");
            callableStatement.setString(1, name);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Classes classes = new Classes();
                classes.setClassID(resultSet.getInt("id"));
                classes.setClassName(resultSet.getString("name"));
                classes.setClassStatus(resultSet.getBoolean("status"));
                classesList.add(classes);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return classesList;
    }
}
