package handles;

import Dao.sql;
import entity.det;
import entity.det;
import entity.inf;
import entity.user;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class LoginController {
    @RequestMapping("/")
    public String home(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        return "login";
    }
    @RequestMapping("/registerPage")
    public String registerPage(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        return "register";
    }
    @RequestMapping("/servlets/login")
    public String login(HttpServletRequest req, HttpServletResponse resp, HttpSession session, user t) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        int tag=sql.findUser(t.getUsername());
        String confirm;
        if(tag==0)
        {
            session.setAttribute("confirm","none");
        }
        else
        {
            if((t.getPwd()).equals(sql.findPwd(t.getUsername()))) {
                session.setAttribute("confirm", "true");
                session.setAttribute("username", t.getUsername());
                String name= URLEncoder.encode(t.getUsername(),"UTF-8");
                String pwd= URLEncoder.encode(t.getPwd(),"UTF-8");
                Cookie c1=new Cookie("username",t.getUsername());
                c1.setMaxAge(30*24*3600);
                c1.setPath("/");
                resp.addCookie(c1);
                Cookie c2=new Cookie("pwd",t.getPwd());
                c2.setMaxAge(30*24*3600);
                c2.setPath("/");
                resp.addCookie(c2);
            }
            else
            {
                session.setAttribute("confirm", "false");
            }
        }
        return "judge";
    }
    @RequestMapping("/create_tab")
    public String create_tab(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        return "create_tab";
    }
    @RequestMapping("/research")
    public String research(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        return "/tab_research";
    }
    @RequestMapping("/result")
    public String result(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        return "result";
    }
    @RequestMapping("/servlets/register")
    public String register(HttpServletRequest req, HttpServletResponse resp, HttpSession session, user t) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        int tag=sql.findUser(t.getUsername());
        System.out.println(tag);
        String comfirm;
        if(tag==0)
        {
            comfirm="true";
            sql.insertUser(t);
            inf tmp=new inf();
            tmp.setNum(1);
            tmp.setUsername(t.getUsername());
            tmp.setDes("此处添加描述");
            sql.insertInf(tmp);
            session.setAttribute("username",t.getUsername());
        }
        else
        {
            comfirm="false";
        }
        session.setAttribute("confirm",comfirm);
        return "reg_judge";
    }
    @RequestMapping("/servlets/adjdes")
    public String adjdes(HttpServletRequest req, HttpServletResponse resp, HttpSession session, inf t) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        t.setDes(new String(t.getDes().getBytes("ISO-8859-1"),"UTF-8"));
        sql.updateDes(t);
        return "create_tab";
    }
    @RequestMapping("/servlets/adjopt")
    public String adjopt(HttpServletRequest req, HttpServletResponse resp, HttpSession session, det t) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        t.setOpt(new String(t.getOpt().getBytes("ISO-8859-1"),"UTF-8"));
        sql.updateOpt(t);
        return "create_tab";
    }
    @RequestMapping("/servlets/addopt")
    public String addopt(HttpServletRequest req, HttpServletResponse resp,det t) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        t.setOpt(new String(t.getOpt().getBytes("ISO-8859-1"),"UTF-8"));
        sql.insertOpt(t);
        return "create_tab";
    }
    @RequestMapping("/servlets/addnum")
    public String addnum(HttpServletRequest req, HttpServletResponse resp,HttpSession session) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String username=(String)session.getAttribute("username");
        inf t=new inf();
        t.setUsername(username);
        t.setNum(sql.findMaxNum(username)+1);
        t.setDes("此处添加描述");
        sql.insertInf(t);
        session.setAttribute("flag","true");
        return "create_tab";
    }
    @RequestMapping("/servlets/handle_submit")
    public String handle_submit(HttpServletRequest req, HttpServletResponse resp,HttpSession session) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String username=(String)session.getAttribute("username");
        List<inf>l=sql.findDes(username);
        for(int i=0;i<l.size();i++)
        {
            int num=l.get(i).getNum();
            String tmp=req.getParameter("opt"+num);
            if(tmp==null)
                continue;
            det t=new det();
            t.setUsername(username);
            t.setNum(num);
            int id=Integer.parseInt(tmp);
            t.setId(id);
            sql.updateRes(t);
        }
        return "success";
    }
    @RequestMapping("/servelts/deletedes")
    public String deletedes(HttpServletRequest req, HttpServletResponse resp,inf t) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        sql.deleteAllOpt(t);
        sql.deleteDes(t);
        return "create_tab";
    }
    @RequestMapping("/servelts/deleteOneOpt")
    public String deleteopt(HttpServletRequest req, HttpServletResponse resp,det t) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        sql.deleteOneOpt(t);
        return "create_tab";
    }
}
