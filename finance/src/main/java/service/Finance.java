package service;

import dao.InfoDao;
import dao.LoginDao;
import dao.TabDao;
import entity.*;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class Finance {
    public static Reaction adjPWd(String id,String bpwd,String npwd)//修改密码
    {
        Reaction reaction=new Reaction();
        if(bpwd.equals(LoginDao.checkLogin(id)))
        {
            Login login=new Login();
            login.setId(id);
            login.setPwd(npwd);
            LoginDao.updatePwd(login);
            reaction.setTag(0);
            reaction.setWords("密码修改成功!");
        }
        else
        {
            reaction.setTag(1);
            reaction.setWords("密码修改失败，原密码不正确");
        }
        return reaction;
    }
    public static void deleteTable(Integer table_no)//删除报表
    {
        TabDao.deleteTab(table_no);
    }
    public static List<Info> findAllInfoByNo(Integer tab_no)//通过表名来查找属于id的表信息
    {
        Info info=new Info();
        List<Info>l=InfoDao.findAllInfo(tab_no);
        Collections.sort(l);
        return l;
    }
    public static List<Info> findInfoByMessage(String id,String year,String month,String table_name)//通过年月和表名查找该年月的交易信息
    {
        Message message=new Message();
        message.setName(table_name);
        message.setId(id);
        message.setYear(year);
        message.setMonth(month);
        List<Info>l=InfoDao.findInfoByMessage(message);
        Collections.sort(l);
        return l;
    }
    public static void adjTable(Integer table_no,String table_name)//修改报表信息
    {
        Tab tab=new Tab();
        tab.setTab_no(table_no);
        tab.setTab_name(table_name);
        TabDao.updateTab(tab);
        InfoDao.updateInfoName(tab);//对info进行级联修改
    }
    public static void insertTable(String id,String table_name)//添加一张表格
    {
        Tab tab=new Tab();
        tab.setTab_name(table_name);
        tab.setId(id);
        TabDao.insertTab(tab);
    }
}
