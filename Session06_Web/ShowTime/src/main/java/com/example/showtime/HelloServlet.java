package com.example.showtime;

import java.io.*;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ServerTimeServlet", urlPatterns = "/ServerTimeServlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");


        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Hello world</h1>");
        Date today = new Date();

        writer.println("<h1>" + today + "</h1>");
        writer.println("</html>");
    }

    public void destroy() {
    }
}