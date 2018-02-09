package dao;

import domain.User;
import org.junit.Test;

import java.util.List;


public class UserDaoTest {
    @Test//测试单例查找
    public void test_findUserById() throws Exception {
        User user = UserDao.findUserById(1);
        System.out.println("id:" + user.getId() + " name:" + user.getName() + " age:"+user.getAge()+" password:" + user.getPassword());
    }
    @Test//测试通过用户名查找
    public void test_findUserByName()throws Exception
    {
        User u=UserDao.findUserByName("hjy");
        if(u!=null)
        {
            System.out.println("id:" + u.getId() + " name:" + u.getName() + " age:"+u.getAge()+ " password:" + u.getPassword());
        }
    }
    @Test//测试插入操作
    public void  test_insertUser()throws Exception
    {
        User user=new User();
        user.setName("ggboy");
        user.setAge(14);
        user.setPassword("1008611");
        UserDao.insertUser(user);
        User u=UserDao.findUserByName("ggboy");
        if(u!=null)
        {
            System.out.println("id:" + u.getId() + " name:" + u.getName() + " age:"+u.getAge()+ " password:" + u.getPassword());
        }
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
        user.setAge(10);
        user.setPassword("99999");
        UserDao.updateUser(user);
        test_findUserByName();
    }
}