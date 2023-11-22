package com.ra;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "registerServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //xu ly method POST
        //lay du lieu gui len tu form
//        System.out.println(req.getParameter("email"));
//        System.out.println(req.getParameter("userName"));

        String userName=req.getParameter("userName");
        req.setAttribute("userName",userName);

        //chuyen sang trang cam-on.jsp va hien thi ten cua nguoi vua dang ky
        req.getRequestDispatcher("cam-on.jsp").forward(req,resp);
    }
}
