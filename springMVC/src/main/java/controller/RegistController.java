package controller;

import dao.UserDao;
import domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;


@Controller
public class RegistController {
    @RequestMapping(value = "regist",method = RequestMethod.GET)
    public String regist()
    {
        return "regist";
    }
    @RequestMapping(value = "registSuccess",method = RequestMethod.POST)
    public String registSuccess(HttpServletRequest request,Model model)
    {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        int age=Integer.parseInt(request.getParameter("age"));
        if(UserDao.findUserByName(name)!=null)
        {
            return "regist2";
        }
        else
        {
            User user=new User();
            user.setName(name);
            user.setPassword(password);
            user.setAge(age);
            UserDao.insertUser(user);
            model.addAttribute("name", name);
            return "login";
        }
    }
}
