package com.ra.controller;

import com.ra.model.entity.Category;
import com.ra.model.service.category.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import static com.ra.model.dao.category.CategoryDAOImpl.totalPage;

@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/category")
    public String index(Model model) {
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("categoryList", categoryList);
        return "category/index";
    }

    @GetMapping("/add-category")
    public String add(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return "category/add-category";
    }

    @PostMapping("create-category")
    public String create(@ModelAttribute("category") Category category, RedirectAttributes redirectAttributes) {
        categoryService.saveOrUpdate(category);
        redirectAttributes.addFlashAttribute("message", "Add category successfully!");
        return "redirect:/category";
    }

    @GetMapping("category/edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Category category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "category/edit-category";
    }

    @PostMapping("update-category")
    public String update(@ModelAttribute("category") Category category, RedirectAttributes redirectAttributes) {
        categoryService.saveOrUpdate(category);
        redirectAttributes.addFlashAttribute("message", "Edit category successfully!");
        return "redirect:/category";
    }

    @GetMapping("category/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
        Category category = categoryService.findById(id);
        categoryService.delete(category.getCategoryId());
        String message = category.isCategoryStatus() ? "Unblock category successfully!" : "Block category successfully!";
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/category";
    }

    @GetMapping("category")
    public String search(@RequestParam(value = "searchName", required = false) String searchName, Model model) {
        if (searchName != null) {
            List<Category> categoryList = categoryService.findByName(searchName);
            model.addAttribute("categoryList", categoryList);
        } else {
            List<Category> categoryList = categoryService.findAll();
            model.addAttribute("categoryList", categoryList);
        }
        return "redirect:/index";
    }

    @RequestMapping("category/{page}")
    public String pagination( @PathVariable("page") int page,Model model) {
        if (page <= 0 || page > totalPage) {
            page = 1;
        }

        List<Category> categoryList = categoryService.pagination(2, page);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("totalPage", totalPage);
        return "category/index";
    }

}
