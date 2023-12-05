package com.ra.controller;

import com.ra.model.entity.Category;
import com.ra.model.entity.Product;
import com.ra.model.service.category.CategoryService;
import com.ra.model.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/product")
    public String index(Model model) {
        List<Product> productList = productService.findAll();
        model.addAttribute("productList", productList);
        return ("product/index");
    }

    @GetMapping("/add-product")
    public String add(Model model) {
        Product product = new Product();
        List<Category> categories = categoryService.findAll();
        model.addAttribute("product", product);
        model.addAttribute("categories", categories);
        return ("product/add-product");
    }

    @PostMapping("/create-product")
    public String create(@ModelAttribute("product") Product product, RedirectAttributes redirectAttributes) {
        if (productService.saveOrUpdate(product)) {
            redirectAttributes.addFlashAttribute("message", "Add product successfully!");
        }
        return ("redirect:/product");
    }

    @GetMapping("product/edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Product product = productService.findById(id);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("product", product);
        return ("product/edit-product");
    }

    @PostMapping("update-product")
    public String update(@ModelAttribute("product") Product product, RedirectAttributes redirectAttributes) {
        if (productService.saveOrUpdate(product)) {
            redirectAttributes.addFlashAttribute("message", "Edit product successfully");
        }
        return ("redirect:/product");
    }

    @GetMapping("product/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
        productService.delete(id);
        redirectAttributes.addFlashAttribute("message", "Delete product successfully");
        return ("redirect:/product");
    }

    @PostMapping("/product")
    public String search(@RequestParam(value = "searchName", required = false) String searchName, Model model) {
        if (searchName != null) {
            List<Product> productList = productService.findByName(searchName);
            model.addAttribute("productList", productList);
            model.addAttribute("searchName",searchName);
        }else{
            List<Product> productList = productService.findAll();
            model.addAttribute("productList", productList);
        }
        return "product/index";
    }
}

