package com.ra;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "discountServlet", value = "/discount-calculator")
public class DiscountCalculatorServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("discount-calculator.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //lay du lieu
        String product = req.getParameter("product");
        double listPrice = Double.parseDouble(req.getParameter("list-price"));
        int percentDiscount = Integer.parseInt(req.getParameter("percent-discount"));



        //tinh toan
        double discountAmount = ((double) percentDiscount / 100) * listPrice;
        double discountedPrice = listPrice - discountAmount;

        // chuyen va hien thi du lieu sang trang hien-thi.jsp
        req.setAttribute("product",product);
        req.setAttribute("listPrice",listPrice);
        req.setAttribute("percentDiscount",percentDiscount);
        req.setAttribute("discountAmount",discountAmount);
        req.setAttribute("discountedPrice",discountedPrice);

        //chuyen sang trang hien-thi.jsp va hien thi thong tin
        req.getRequestDispatcher("hien-thi.jsp").forward(req, resp);
    }

}
