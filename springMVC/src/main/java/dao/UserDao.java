package dao;

import domain.User;
import org.apache.ibatis.session.SqlSession;
import tools.SessionBean;


public class UserDao {
    private static SqlSession session;
    static {
        session= SessionBean.getSession();
    }
    public static User findUserById(int id)//通过id来查找User
    {
        return session.selectOne("test.findUserById",1);
    }
    public static User findUserByName(String n)//通过name来查找User
    {
        return session.selectOne("test.findUserByName",n);
    }
    public static User checkLogin(String name,String password)
    {
        User user=new User();
        user.setName(name);
        user.setPassword(password);
        return session.selectOne("test.checkLogin",user);
    }
    public static void insertUser(User user)//插入一个User
    {
        session.insert("test.insertUser",user);
    }
    public static void deleteUser(int i)//删除id为i的User
    {
        session.delete("test.deleteUser",i);
    }
    public static void updateUser(User user)//根据id更新User信息
    {
        session.update("test.updateUser",user);
        session.commit();//注意必须要commit
    }
}