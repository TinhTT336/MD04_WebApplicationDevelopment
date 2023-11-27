package controller;

import model.entity.Product;
import model.service.productService.IProductService;
import model.service.productService.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                response.sendRedirect("views/product/create-product.jsp");
                break;
            case "edit":
                int idEdit = Integer.parseInt(request.getParameter("id"));
                Product editProduct = productService.findById(idEdit);
                request.setAttribute("editProduct", editProduct);
                request.getRequestDispatcher("views/product/edit-product.jsp").forward(request, response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                productService.delete(idDelete);
                showProducts(request,response);
                break;
            default:
                showProducts(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            Product product = new Product();
            product.setProductName(request.getParameter("productName"));
            product.setDescription(request.getParameter("description"));
            product.setProductStatus(Boolean.parseBoolean(request.getParameter("productStatus")));
            product.setStock(Integer.parseInt(request.getParameter("stock")));

            if (productService.saveOrUpdate(product)) {
                showProducts(request, response);
            } else {
                response.sendRedirect("views/product/create-product.jsp?err");
            }
        } else {
            editProduct(request, response);
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        String proName = request.getParameter("productName");
        String description = request.getParameter("description");
        boolean status = Boolean.parseBoolean(request.getParameter("productStatus"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        Product product = new Product(id, proName, description, status, stock);
        if(productService.saveOrUpdate(product)){
            showProducts(request,response);
        }else{
            response.sendRedirect("views/product/edit-product.jsp?err");

        }
    }

    public void showProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("views/product/product.jsp").forward(request, response);
    }
}