package com.ra.model.dao.student;

import com.ra.model.entity.Student;
import com.ra.util.ConnectionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAOImpl implements StudentDAO {
    @Override
    public List<Student> findAll() {
        Connection connection = null;
        List<Student> studentList = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{ CALL PROC_GET_STUDENTS()}");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Student student = new Student();
                student.setStudentId(resultSet.getInt("id"));
                student.setStudentName(resultSet.getString("name"));
                student.setEmail(resultSet.getString("email"));
                student.setAddress(resultSet.getString("address"));

                student.setBirthday(resultSet.getDate("birthday"));
                studentList.add(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return studentList;
    }

    @Override
    public boolean saveOrUpdate(Student student) {
        Connection connection = null;
        connection = ConnectionDB.openConnection();
        int check;
        try {
            if (findById(student.getStudentId()) == null) {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_ADD_STUDENT(?,?,?,?)}");
                callableStatement.setString(1, student.getStudentName());
                callableStatement.setString(2, student.getEmail());
                callableStatement.setDate(3, student.getBirthday());
                callableStatement.setString(4, student.getAddress());
                check = callableStatement.executeUpdate();
            } else {
                CallableStatement callableStatement = connection.prepareCall("{CALL PROC_UPDATE_STUDENT(?,?,?,?,?)}");
                callableStatement.setString(1, student.getStudentName());
                callableStatement.setString(2, student.getEmail());
                callableStatement.setDate(3, student.getBirthday());
                callableStatement.setString(4, student.getAddress());
                callableStatement.setInt(5, student.getStudentId());
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
    public Student findById(Integer id) {
        Connection connection = null;
        Student student = new Student();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_FIND_BY_ID(?)}");
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                student.setStudentId(resultSet.getInt("id"));
                student.setStudentName(resultSet.getString("name"));
                student.setEmail(resultSet.getString("email"));
                student.setAddress(resultSet.getString("address"));
                student.setBirthday(resultSet.getDate("birthday"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return student;
    }

    @Override
    public void delete(Integer id) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{CALL PROC_DELETE_STUDENT(?)}");
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Student> findByName(String name) {
        return null;
    }
}
