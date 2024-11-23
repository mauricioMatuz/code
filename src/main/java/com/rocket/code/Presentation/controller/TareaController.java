package com.rocket.code.Presentation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tarea")
public class TareaController {

    @GetMapping({"", "/"})
    public String getUsuarios() {
        return "tarea/index";

    }
}
