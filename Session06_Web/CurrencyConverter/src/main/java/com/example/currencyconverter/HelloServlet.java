package com.example.currencyconverter;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ConverterServlet", value = "/convert")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));

        float vnd = rate * usd;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Rate: " + rate + "</h1>");
        writer.println("<h1>USD: " + usd + "</h1>");
        writer.println("<h1>VND: " + vnd + "</h1>");
        writer.println("</html>");
    }
}