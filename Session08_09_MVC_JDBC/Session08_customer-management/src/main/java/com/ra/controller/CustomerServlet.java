package com.ra.controller;

import com.ra.model.Customer;
import com.ra.service.customer.CustomerServiceIMPL;
import com.ra.service.customer.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerServiceIMPL();
//    private List<Customer> customerList;

    @Override
    public void init() throws ServletException {
//        customerList = customerService.findAll();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                req.getRequestDispatcher("views/customer/add-customer.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Customer editCustomer = customerService.findById(id);
                req.setAttribute("editCustomer", editCustomer);
                req.getRequestDispatcher("views/customer/edit-customer.jsp").forward(req, resp);
                break;
            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                customerService.deleteById(idDelete);
                showCustomerList(req, resp);
                break;
            case "search":
                String searchName = req.getParameter("inputSearch");
                List<Customer> searchCustomers = customerService.findByName(searchName);
                req.setAttribute("customerList", searchCustomers);
                req.setAttribute("searchName", searchName);
                req.getRequestDispatcher("views/customer/customer.jsp").forward(req, resp);
                showCustomerList(req,resp);
                break;
            default:
                showCustomerList(req, resp);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int customerId = Integer.parseInt(req.getParameter("id"));
        String customerName = req.getParameter("customerName");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "add":
                Customer newCustomer = new Customer(customerService.getNewId(), customerName, email, address);
                customerService.save(newCustomer);
                showCustomerList(req, resp);
                break;
            case "edit":
                Customer editCustomer = new Customer(customerId, customerName, email, address);
                customerService.save(editCustomer);
                showCustomerList(req, resp);
                break;
            default:
                showCustomerList(req, resp);
        }
    }

    public void showCustomerList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        req.setAttribute("customerList", customerList);
        req.getRequestDispatcher("views/customer/customer.jsp").forward(req, resp);
    }

}
