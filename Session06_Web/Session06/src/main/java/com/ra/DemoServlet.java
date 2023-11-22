package com.ra;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "demoServlet",value = "/demo-servlet")
public class DemoServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("Khoi tao");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // xu ly method GET
        System.out.println("OK OK OK");
    }

    @Override
    public void destroy() {
        System.out.println("huy Servlet");
    }
}
