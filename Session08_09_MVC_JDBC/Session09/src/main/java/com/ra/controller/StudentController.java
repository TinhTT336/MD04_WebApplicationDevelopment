package com.ra.controller;

import com.ra.model.entity.Formatter;
import com.ra.model.entity.Student;
import com.ra.model.service.student.StudentService;
import com.ra.model.service.student.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/student")
public class StudentController extends HttpServlet {
    private final StudentService studentService = new StudentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                response.sendRedirect("views/student/create-student.jsp");
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Student editStudent = studentService.findById(id);
                request.setAttribute("editStudent", editStudent);
                request.getRequestDispatcher("views/student/edit-student.jsp").forward(request, response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                studentService.delete(idDelete);
                showUsers(request, response);
                break;
            default:
                showUsers(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Student student = new Student();
        student.setStudentName(request.getParameter("studentName"));
        student.setEmail(request.getParameter("email"));

        student.setBirthday(Date.valueOf(request.getParameter("birthday")));
        student.setAddress(request.getParameter("address"));
        if (action != null) {
            student.setStudentId(Integer.parseInt(request.getParameter("studentId")));
        }
        if (studentService.saveOrUpdate(student)) {
            showUsers(request, response);
        }
    }

    private void showUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = studentService.findAll();
        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("views/student/student.jsp").forward(request, response);
    }
}