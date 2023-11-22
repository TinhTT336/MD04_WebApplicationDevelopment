package com.example.controller;

import com.example.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "studentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private final List<Student> students = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        students.add(new Student("B11", "Nguyen Van A", "Ha Noi", 18, true, "JV0101"));
        students.add(new Student("B12", "Nguyen Thi B", "Ha Noi", 18, false, "JV0101"));
        students.add(new Student("B13", "Nguyen Van C", "Ha Noi", 18, true, "JV0101"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println(req.getParameter("action"));
        String action = req.getParameter("action");
        if (action == null) {
            showStudent(req, resp);
        } else {
            switch (action) {
                case "add":
                    //dieu huong ve view add (form them moi)
                    resp.sendRedirect("views/add-student.jsp");
                    break;
                case "edit":
                    //lay id tren url
                    String studentCode = req.getParameter("id");
                    Student editStudent = findByStudentCode(studentCode);
                    req.setAttribute("editStudent", editStudent);

                    //dieu huong ve view edit (form them moi)
                    req.getRequestDispatcher("views/edit-student.jsp").forward(req, resp);

                    break;
                case "delete":
                    //lay id tren url
                    String studentId = req.getParameter("id");
                    Student deleteStudent = findByStudentCode(studentId);

                    students.remove(deleteStudent);
                    showStudent(req,resp);

                    break;
                default:
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        //lay du lieu tu form

        String studentCode = req.getParameter("studentCode");
        String studentName = req.getParameter("studentName");
        String address = req.getParameter("address");
        int age = Integer.parseInt(req.getParameter("age"));
        String classRoom = req.getParameter("classRoom");
        boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
        if (action == null) {
            students.add(new Student(studentCode, studentName, address, age, gender, classRoom));
            showStudent(req, resp);
        } else {
            Student studentEdit = findByStudentCode(studentCode);
            studentEdit.setStudentName(studentName);
            studentEdit.setAddress(address);
            studentEdit.setAge(age);
            studentEdit.setClassRoom(classRoom);
            studentEdit.setGender(gender);

            showStudent(req, resp);
        }
    }

    public void showStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("students", students);
        req.getRequestDispatcher("views/student.jsp").forward(req, resp);
    }

    public Student findByStudentCode(String code) {
        for (Student student : students) {
            if (student.getStudentCode().equals(code)) {
                return student;
            }
        }
        return null;
    }
}
