package controller;

import dao.InfoDao;
import dao.TabDao;
import entity.Info;
import entity.Reaction;
import entity.Tab;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.Finance;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class ServiceController {
    @PostMapping("/adj")
    ModelAndView adj(@RequestParam(value = "bpwd") String bpwd, @RequestParam(value = "npwd") String npwd, HttpSession httpSession)
    {
        ModelMap modelMap=new ModelMap();
        Reaction reaction= service.Finance.adjPWd((String)httpSession.getAttribute("id"),bpwd,npwd);
        httpSession.setAttribute("tag",reaction.getTag());
        modelMap.put("message",reaction);
        return new ModelAndView("index",modelMap);
    }
    @PostMapping("/deleteTable")
    String deleteTable(@RequestParam(value = "table_no")Integer table_no)
    {
        Finance.deleteTable(table_no);
        return "/manage";
    }
    @PostMapping("/adjTable")
    String adjTable(@RequestParam(value = "table_no")Integer table_no,@RequestParam(value = "table_name")String table_name)
    {
        Finance.adjTable(table_no,table_name);
        return "/manage";
    }
    @PostMapping("/insertTable")
    String insertTable(@RequestParam(value = "tab_name")String tab_name,HttpSession httpSession)
    {
        String id=httpSession.getAttribute("id").toString();
        Finance.insertTable(id,tab_name);
        httpSession.setAttribute("tag","1");
        return "/manage";
    }
    @PostMapping("/search")
    String search(@RequestParam(value = "table_name")String table_name,@RequestParam(value = "year")String year,@RequestParam(value = "month")String month,HttpSession httpSession)
    {
        httpSession.setAttribute("tag","1");
        httpSession.setAttribute("year",year);
        httpSession.setAttribute("month",month);
        httpSession.setAttribute("table_name",table_name);
        return "/chart";
    }
    @PostMapping("/insertInfo")
    String insertInfo(Info info,HttpSession httpSession)
    {
        String id=httpSession.getAttribute("id").toString();
        Tab tab=new Tab();
        tab.setId(id);
        tab.setTab_name(info.getTab_name());
        Integer no= TabDao.findTabByName(tab);
        if(no==null)
        {
            TabDao.insertTab(tab);
            no= TabDao.findTabByName(tab);
        }
        info.setTab_no(no);
        InfoDao.insertInfo(info);
        httpSession.setAttribute("tag","1");
        return "table";
    }
    @PostMapping("/deleteInfo")
    String deleteInfo(@RequestParam(value = "no")Integer no,HttpSession httpSession)
    {
        InfoDao.deleteOneInfo(no);
        return "table";
    }
    @PostMapping("/adjInfo")
    String adjInfo(Info info,HttpSession httpSession)
    {
        InfoDao.updateInfo(info);
        httpSession.setAttribute("tag","1");
        return "table";
    }
    @PostMapping("/downloads")
    void downloads(@RequestParam(value = "table_no")Integer table_no,HttpSession httpSession,HttpServletResponse httpServletResponse) throws IOException {
        try {
            String id=String.valueOf(httpSession.getAttribute("id"));
            List<Info> l=Finance.findAllInfoByNo(table_no);
            PrintWriter printWriter=httpServletResponse.getWriter();
            printWriter.println("表名:"+l.get(0).getTab_name());
            printWriter.println("交易信息:");
            double in_amount=0;
            double out_amount=0;
            double all=0;
            for(Info i:l)
            {
                if(i.getAmount()>=0)
                {
                    in_amount+=i.getAmount();
                }
                else
                {
                    out_amount-=i.getAmount();
                }
                all+=i.getAmount();
                printWriter.print("交易日期:");
                printWriter.print(i.getDat());
                printWriter.print("  ");
                printWriter.print("交易金额:");
                printWriter.print(i.getAmount());
                printWriter.print("  ");
                printWriter.print("交易备注:");
                printWriter.print(i.getDetail());
                printWriter.print("  ");
                printWriter.print("所属人:");
                printWriter.println(id);
            }
            printWriter.println("收入总额:"+in_amount+"元  支出总额:"+out_amount+"元  净收入总额:"+all+"元");
            httpServletResponse.addHeader("Content-Disposition","attachment");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
