package dao;

import org.junit.Test;
import servlet.User;

import java.util.List;


public class UserDaoTest {
    @Test//测试单例查找
    public void test_findUserById() throws Exception {
        User user = UserDao.findUserById(1);
        System.out.println("id:" + user.getId() + " name:" + user.getName() + " password:" + user.getPassword());
    }
    @Test//测试多例查找
    public void test_findUserByName()throws Exception
    {
        List<User>res=UserDao.findUserByName("hjy");
        if(res!=null)
        {
            for(User u:res)
            {
                System.out.println("id:" + u.getId() + " name:" + u.getName() + " password:" + u.getPassword());
            }
        }
    }
    @Test//测试插入操作
    public void  test_insertUser()throws Exception
    {
        User user=new User();
        user.setName("hjy");
        user.setPassword("1008611");
        UserDao.insertUser(user);
        test_findUserByName();
    }
    @Test//测试删除操作
    public void test_deleteUser()throws Exception
    {
        UserDao.deleteUser(1);
        test_findUserByName();
    }
    @Test//测试更新操作
    public void test_updateUser()throws Exception
    {
        User user=new User();
        user.setId(1);
        user.setName("hjy");
        user.setPassword("1008611");
        UserDao.updateUser(user);
        test_findUserByName();
    }
}