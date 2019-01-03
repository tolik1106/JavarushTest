package com.zhitar.jrtask.controller;

import com.zhitar.jrtask.dao.IPartDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.zhitar.jrtask.model.Part;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class AppController {

    @Autowired
    @Qualifier("hibernatePartDAO")
    private IPartDAO partDAO;

    @GetMapping("/")
    public String view() {
        return "index";
    }

    @GetMapping("/parts")
    public String getParts(@RequestParam(name = "page") Optional<Integer> page,
                           Model model,
                           @RequestParam(name = "sort") Optional<Integer> sort) {
        model.addAttribute("allParts", partDAO.getAll(sort.orElse(-1)));
        model.addAttribute("parts", partDAO.getByPage(page.orElse(1)));
        model.addAttribute("part", new Part());
        model.addAttribute("number", partDAO.getMinNecessaryPart().getQuantity());
        return "parts";
    }

    @PostMapping("/parts/new")
    public String addNewPart(@ModelAttribute(name = "part") @Valid Part part, BindingResult result, Model model) {
        model.addAttribute("parts", partDAO.getAll(0));
        if (result.hasErrors())
            return "/parts";
        partDAO.addPart(part);
        return "redirect:/parts";
    }

    @GetMapping("/delete")
    public String deletePart(@RequestParam(name = "id") Integer id) {
        partDAO.deletePart(id);
        return "redirect:/parts";
    }

    @PostMapping("/parts/find")
    public String findPart(@RequestParam(name = "name") String name,
                           Model model) {
        Part part = partDAO.getPart(name);
        if(part == null) return "redirect:/parts";
        model.addAttribute("part", part);
        return "single_part";
    }
}
