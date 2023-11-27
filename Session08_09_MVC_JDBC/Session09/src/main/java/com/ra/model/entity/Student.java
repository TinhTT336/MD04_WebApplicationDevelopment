package com.ra.model.entity;

import java.util.Date;

public class Student {
    private int studentId;
    private String studentName;
    private String email;
    private java.sql.Date birthday;
    private String address;

    public Student() {
    }

    public Student(int studentId, String studentName, String email, Date birthday, String address) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.email = email;
        this.birthday = (java.sql.Date) birthday;
        this.address = address;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public java.sql.Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = (java.sql.Date) birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
