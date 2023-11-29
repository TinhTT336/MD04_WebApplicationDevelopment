package com.ra.controller;

import com.ra.model.entity.Category;
import com.ra.model.entity.Product;
import com.ra.model.service.category.CategoryService;
import com.ra.model.service.category.CategoryServiceImpl;
import com.ra.model.service.product.ProductService;
import com.ra.model.service.product.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                List<Category>categoryList=categoryService.findAll();
                request.setAttribute("categoryList",categoryList);
                request.getRequestDispatcher("views/product/add-product.jsp").forward(request,response);
                break;
            case "edit":
                int idEdit= Integer.parseInt(request.getParameter("id"));
                Product product=productService.findById(idEdit);
                request.setAttribute("product",product);
                List<Category>categories=categoryService.findAll();
                request.setAttribute("categoryList",categories);
                request.getRequestDispatcher("views/product/edit-product.jsp").forward(request,response);

                break;
            case "delete":
                int idDelete= Integer.parseInt(request.getParameter("id"));
                productService.delete(idDelete);
                showProductList(request,response);
                break;
            default:
                showProductList(request, response);
        }
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("views/product/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        Product product = new Product();
        product.setProductName(request.getParameter("productName"));
        product.setPrice(Float.parseFloat(request.getParameter("price")));
//        product.setCategory(categoryService.findByName((request.getParameter("categoryName"))));
        product.setCategory(categoryService.findById(Integer.valueOf(request.getParameter("categoryId"))));
        if (action != null) {
            product.setProductId(Integer.parseInt(request.getParameter("productId")));
        }
        if (productService.saveOrUpdate(product)) {
            showProductList(request, response);
        }
    }
}