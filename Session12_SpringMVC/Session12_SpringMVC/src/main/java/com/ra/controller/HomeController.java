package com.ra.controller;

import com.ra.model.entity.Account;
import com.ra.model.entity.Student;
import com.ra.model.service.StudentService;
import com.ra.model.service.StudentServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class HomeController {
    private final StudentService studentService = new StudentServiceImpl();

    @RequestMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/student")
    public String student(Model model) {
        List<Student> studentList = studentService.findAll();
        model.addAttribute("list", studentList);
        return "student";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        Account account = new Account();
        model.addAttribute("account", account);
        return "login";
    }

    //    @RequestMapping(value = "/login",method = RequestMethod.POST)
//    public String postLogin(){
//        return "home";
//    }
    @RequestMapping(value = "/post-login")
    public String postLogin(@ModelAttribute("account") Account account) {
        System.out.println(account.getEmail());
        System.out.println(account.getPassword());
        return "home";
    }

    @RequestMapping("/edit/{id}")
    public void edit(@PathVariable("id") Integer id) {
        System.out.println(id);
    }
}
