package controller;

import model.entity.User;
import model.service.userService.IUserService;
import model.service.userService.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
              response.sendRedirect("views/user/create-user.jsp");

                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                showUsers(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user=new User();
        user.setUserName(request.getParameter("userName"));
        user.setPhone(request.getParameter("phone"));
        user.setAddress(request.getParameter("address"));
        if(userService.saveOrUpdate(user)){
            showUsers(request,response);
        }
    }

    public void showUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.findAll();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("views/user/user.jsp").forward(request, response);
    }

}