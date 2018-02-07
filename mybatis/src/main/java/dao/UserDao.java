package dao;

import org.apache.ibatis.session.SqlSession;
import servlet.SessionBean;
import servlet.User;

import java.util.List;

public class UserDao {
    private static SqlSession session;
    static {
        session= SessionBean.getSession();
    }
    public static User findUserById(int id)
    {
        return session.selectOne("test.findUserById",1);
    }
    public static List<User> findUserByName(String n)
    {
        return session.selectList("test.findUserByName",n);
    }
    public static void insertUser(User user)
    {
        session.insert("test.insertUser",user);
    }
    public static void deleteUser(int i)
    {
        session.delete("test.deleteUser",i);
    }
    public static void updateUser(User user)
    {
        session.update("test.updateUser",user);
        session.commit();
    }
}
