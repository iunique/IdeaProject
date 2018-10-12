package service;

import dao.LoginDao;
import entity.Login;
import entity.Reaction;
import org.springframework.stereotype.Service;

@Service
public class Ready {
    public static Reaction Login(Login login)//根据用户输入的数据判断登录情况
    {
        String id=login.getId();
        String pwd=login.getPwd();
        String Realpwd= LoginDao.checkLogin(id);
        Reaction reaction=new Reaction();
        if(Realpwd==null)
        {
            reaction.setTag(2);
            reaction.setWords("该用户不存在，请注册后再登录!");
            return reaction;
        }
        if(Realpwd.equals(pwd))
        {
            reaction.setTag(0);
            reaction.setWords("登录成功!");
            return reaction;
        }
        reaction.setTag(1);
        reaction.setWords("密码错误,登录失败!");
        return reaction;
    }
    public static Reaction register(Login login)//账号注册
    {
        Reaction reaction=new Reaction();
        if(LoginDao.checkLogin(login.getId())!=null)
        {
            reaction.setTag(1);
            reaction.setWords("该用户已存在，注册失败");
            return reaction;
        }
        LoginDao.register(login);
        reaction.setTag(0);
        reaction.setWords("注册成功，请到登录页面登录!");
        return reaction;
    }
}
