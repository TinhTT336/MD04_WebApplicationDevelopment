package com.ra.controller;

import com.ra.model.entity.Classes;
import com.ra.model.service.classes.ClassService;
import com.ra.model.service.classes.ClassServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ClassController", value = "/class")
public class ClassController extends HttpServlet {
    private final ClassService classService = new ClassServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                response.sendRedirect("views/classes/create-classes.jsp");
                break;
            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Classes classes = classService.findById(editId);
                request.setAttribute("classes", classes);
                request.getRequestDispatcher("views/classes/edit-classes.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                classService.delete(deleteId);
                showClasses(request, response);
                break;
            case "search":
                String searchName = request.getParameter("searchName");
                List<Classes>classesList= classService.findByName(searchName);
                System.out.println(classesList);
                request.setAttribute("searchName",searchName);
                request.setAttribute("classesList",classesList);
                request.getRequestDispatcher("views/classes/classes.jsp").forward(request,response);
                break;
            default:
                showClasses(request, response);
        }
    }

    private void showClasses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classes> classesList = classService.findAll();
        request.setAttribute("classesList", classesList);
        request.getRequestDispatcher("views/classes/classes.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Classes classes = new Classes();
        classes.setClassName(request.getParameter("className"));
        classes.setClassStatus(Boolean.parseBoolean(request.getParameter("classStatus")));

        if (action != null) {
            classes.setClassID(Integer.parseInt(request.getParameter("classID")));
        }
        System.out.println(classService.saveOrUpdate(classes));
        if (classService.saveOrUpdate(classes)) {
            showClasses(request, response);
        } else {
            response.sendRedirect("views/classes/classes.jsp?err");

        }
    }
}