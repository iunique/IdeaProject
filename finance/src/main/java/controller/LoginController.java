package controller;

import dao.LoginDao;
import entity.Login;
import entity.Reaction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import service.Ready;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @PostMapping("/register")
    ModelAndView register(HttpServletRequest request, Login login)
    {
        ModelMap modelMap=new ModelMap();
        Reaction reaction=Ready.register(login);
        request.getSession().setAttribute("tag",reaction.getTag());
        modelMap.put("message",reaction);
        return new ModelAndView("login",modelMap);
    }
    @PostMapping("/sign_in")
    ModelAndView sign_in(HttpServletRequest request, Login login)
    {
        ModelMap modelMap=new ModelMap();
        Reaction reaction=Ready.Login(login);
        if(reaction.getTag()==0)
        {
            request.getSession().setAttribute("id",login.getId());
            return new ModelAndView("index",modelMap);
        }
        request.getSession().setAttribute("tag",reaction.getTag());
        modelMap.put("message",reaction);
        return new ModelAndView("login",modelMap);
    }
}
