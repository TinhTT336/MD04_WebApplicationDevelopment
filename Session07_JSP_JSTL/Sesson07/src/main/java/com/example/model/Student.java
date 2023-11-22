package com.example.model;

public class Student {
    private String studentCode;
    private String studentName;
    private String address;
    private int age;
    private boolean gender;
    private String classRoom;

    public Student() {
    }

    public Student(String studentCode, String studentName, String address, int age, boolean gender, String classRoom) {
        this.studentCode = studentCode;
        this.studentName = studentName;
        this.address = address;
        this.age = age;
        this.gender = gender;
        this.classRoom = classRoom;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }
}
