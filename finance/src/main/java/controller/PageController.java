package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    @RequestMapping("/login")
    String Login()
    {
        return "login";
    }
    @RequestMapping("/index")
    String index()
    {
        return "index";
    }
    @RequestMapping("/chart")
    String chart()
    {
        return "chart";
    }
    @RequestMapping("/empty")
    String empty()
    {
        return "empty";
    }
    @RequestMapping("/manage")
    String mange()
    {
        return "manage";
    }
    @RequestMapping("/table")
    String table()
    {
        return "table";
    }
}
