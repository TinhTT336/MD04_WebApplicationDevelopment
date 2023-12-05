package com.ra.controller.admin;

import com.ra.model.entity.Category;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController {
    @GetMapping("/category")
    public String index(Model model){
        List<Category> categoryList=new ArrayList<>();
        categoryList.add(new Category(1,"Quan",true));
        categoryList.add(new Category(2,"Ao",true));
        categoryList.add(new Category(3,"Mu",true));
        model.addAttribute("categoryList",categoryList);
        return "admin/category/index";
    }
    @GetMapping("add-category")
    public String add(Model model){
        Category category=new Category();
        model.addAttribute("category",category);
        return "admin/category/add";
    }

    @PostMapping("/add-category")
    public String create(@ModelAttribute("category")Category category, RedirectAttributes redirectAttributes){

        return "admin/category";
    }
}
