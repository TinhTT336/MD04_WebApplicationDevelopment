package com.ra.controller;

import com.ra.model.entity.Category;
import com.ra.model.service.category.CategoryService;
import com.ra.model.service.category.CategoryServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/category")
public class CategoryController extends HttpServlet {
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                response.sendRedirect("views/category/add-category.jsp");
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Category category = categoryService.findById(id);
                request.setAttribute("category", category);
                request.getRequestDispatcher("views/category/edit-category.jsp").forward(request, response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                categoryService.delete(idDelete);
                showCategoryList(request, response);
                break;

            default:
                int currentPage= ((request.getParameter("page"))!=null)?Integer.parseInt(request.getParameter("page")):1;
                int totalPage = categoryService.getTotalPage(2, currentPage);
                List<Category> categories = categoryService.pagination(2, currentPage);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("categoryList", categories);
                request.getRequestDispatcher("views/category/category.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Category category = new Category();
        category.setCategoryName(request.getParameter("categoryName"));
        if (action != null) {
            category.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
            category.setCategoryStatus(Boolean.parseBoolean(request.getParameter("categoryStatus")));
            category.setQuantityProduct(Integer.parseInt(request.getParameter("quantityProduct")));
        }
        if (categoryService.saveOrUpdate(category)) {
            showCategoryList(request, response);
        }

    }

    public void showCategoryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = categoryService.findAll();

        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("views/category/category.jsp").forward(request, response);
    }

}