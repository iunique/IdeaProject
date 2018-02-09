package controller;

import dao.UserDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @RequestMapping(value = "/", method = RequestMethod.GET)//这里表示访问根目录的时候转到login.jsp页面的意思，同样会对该字符串进行路径解析
    public String sayHello() {
        return "login";
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)//这个的意思是拦截到login的字样会加以判断来转移到哪个页面，当然也会加以处理
    public String login(Model model, HttpServletRequest request)
    {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        if(UserDao.checkLogin(name,password)!=null)
        {
            model.addAttribute("name",name);
            return "success";
        }
        else
        {
            return "login2";
        }
    }
}
