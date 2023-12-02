package com.ra.model.service;

import com.ra.model.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentServiceImpl implements StudentService{
    @Override
    public List<Student> findAll() {
        List<Student>studentList=new ArrayList<>();
        studentList.add(new Student(1,"Nguyen Van A",18,true));
        studentList.add(new Student(2,"Nguyen Van B",19,false));
        studentList.add(new Student(3,"Nguyen Van C",18,true));
        studentList.add(new Student(4,"Nguyen Van D",19,false));
        studentList.add(new Student(5,"Nguyen Van E",20,true));
        return studentList;
    }
}
