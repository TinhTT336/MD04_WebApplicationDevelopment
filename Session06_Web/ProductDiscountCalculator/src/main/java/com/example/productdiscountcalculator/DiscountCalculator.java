package com.example.productdiscountcalculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "product-discount-calculator", value = "/product-discount-calculator")
public class DiscountCalculator extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       //lay du lieu tu request
        String productName = request.getParameter("product_description");
        double listPrice= Double.parseDouble(request.getParameter("list_price"));
        int discountPercent= Integer.parseInt(request.getParameter("discount_percent"));

        //tinh toan chiet khau
        double discountAmount=((double) discountPercent /100)*listPrice;
        double discountedPrice=listPrice-discountAmount;

        //hien thi ket qua
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        out.println("<html><head><title>Ket qua tinh toan</title></head><body>");
        out.println("<h1>Ket qua tinh toan</h1>");
        out.println("<p>Ten san pham: "+productName+" </p>");
        out.println("<p>Gia tien san pham: "+listPrice+" </p>");
        out.println("<p>Ty le chiet khau: "+discountedPrice+" </p>");
        out.println("<p>So tien duoc chiet khau: "+discountAmount+" </p>");
        out.println("<p>Gia san pham sau chiet khau: "+discountedPrice+" </p>");
    }

}