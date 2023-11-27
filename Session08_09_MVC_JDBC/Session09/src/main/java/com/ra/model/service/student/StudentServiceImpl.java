package com.ra.model.service.student;

import com.ra.model.dao.IGenericDAO;
import com.ra.model.dao.student.StudentDAO;
import com.ra.model.dao.student.StudentDAOImpl;
import com.ra.model.entity.Student;

import java.util.List;

public class StudentServiceImpl implements StudentService {
    private StudentDAO studentDAO = new StudentDAOImpl();

    @Override
    public List<Student> findAll() {
        return studentDAO.findAll();
    }

    @Override
    public boolean saveOrUpdate(Student student) {
        return studentDAO.saveOrUpdate(student);
    }

    @Override
    public Student findById(Integer id) {
        return studentDAO.findById(id);
    }

    @Override
    public void delete(Integer id) {
        studentDAO.delete(id);
    }

    @Override
    public List<Student> findByName(String name) {
        return studentDAO.findByName(name);
    }
}
