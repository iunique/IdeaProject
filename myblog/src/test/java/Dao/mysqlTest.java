package Dao;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class mysqlTest {
    @Test
    public void sthTest()
    {
        String url="jdbc:mysql://localhost:3306/registers?serverTimezone=GMT%2B8";
        String user="root";
        String password="qazwsx0723";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);
            PreparedStatement sql = con.prepareStatement("SELECT id,password FROM loadinf");
            ResultSet re = sql.executeQuery();
            System.out.print("<br>用户信息：<br>");
            while (re.next()) {
                System.out.print("账号:" + re.getString("id") + "密码:" + re.getString("password") + "<br>");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}