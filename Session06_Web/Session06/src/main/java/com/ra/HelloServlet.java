package com.ra;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "helloServlet",value = "/xin-chao")
public class HelloServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    //tao phuong thuc doGet
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setAttribute("fullName","Chao day");
        req.getRequestDispatcher("xin-chao.jsp").forward(req,resp);
    }

    //tao file xin-chao.jsp
}
