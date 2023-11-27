package controller;

import model.entity.Category;
import model.service.categoryService.CategoryServiceImpl;
import model.service.categoryService.ICategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/category")
public class CategoryController extends HttpServlet {
    private ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
//                request.getRequestDispatcher("views/create-category.jsp").forward(request, response);
                response.sendRedirect("views/create-category.jsp");
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Category editCategory = categoryService.findById(id);
                request.setAttribute("editCategory", editCategory);
                request.getRequestDispatcher("views/edit-category.jsp").forward(request, response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                if (categoryService.findById(idDelete) != null) {
                    categoryService.delete(idDelete);
                }
                showCategories(request, response);
                break;
            case "search":
                searchCategory(request, response);
                break;
            default:
                showCategories(request, response);
        }

    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        try {
            List<Category> searchCategories = categoryService.findByName(searchName);

            System.out.println(searchCategories);

            request.setAttribute("searchName", searchName);
            request.setAttribute("categoryList", searchCategories);
            request.getRequestDispatcher("views/category.jsp").forward(request, response);
            showCategories(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        System.out.println(action);
        if (action == null) {
            //lay du lieu
            Category category = new Category();
            category.setCategoryName(request.getParameter("categoryName"));
            category.setCategoryStatus(Boolean.parseBoolean(request.getParameter("categoryStatus")));

            if (categoryService.saveOrUpdate(category)) {
                showCategories(request, response);
                response.sendRedirect("views/create-category.jsp?err");
            }
        } else {
            Category editCategory = new Category();
            editCategory.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
            editCategory.setCategoryName(request.getParameter("categoryName"));
            editCategory.setCategoryStatus(Boolean.parseBoolean(request.getParameter("categoryStatus")));
            if (categoryService.saveOrUpdate(editCategory)) {
                showCategories(request, response);
            } else {
                response.sendRedirect("views/edit-category.jsp?err");
            }
        }
    }


    public void showCategories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categoryList = categoryService.findAll();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("views/category.jsp").forward(request, response);
    }
}