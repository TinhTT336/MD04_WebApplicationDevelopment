package com.example.session07_lesson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "studentServlet", value = "")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> studentList = new ArrayList<>();
        studentList.add(new Student("Mai Van Hoan", "1983-08-20", "Ha Noi", "anh_hoan"));
        studentList.add(new Student("Nguyen Van Nam", "1983-08-21", "Bac Giang", "anh_nam"));
        studentList.add(new Student("Nguyen Thai Hoa", "1983-08-22", "Nam Dinh", "anh_hoa"));
        studentList.add(new Student("Tran Dang Khoa", "1983-08-17", "Ha Noi", "anh_khoa"));
        studentList.add(new Student("Nguyen Dinh Thi", "1983-08-19", "Ha Noi", "anh_thi"));

        req.setAttribute("studentList", studentList);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
