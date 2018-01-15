package Dao;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.*;

public class mysql {
    private static final  String url="jdbc:mysql://localhost:3306/registers?serverTimezone=GMT%2B8";
    private static final String user="root";
    private static final String password="qazwsx0723";
    public static void insert(String user_name,String user_password) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection(url,user,password);
        PreparedStatement sql=con.prepareStatement("INSERT loadinf (id,password) VALUES (?,?)");
        sql.setString(1,user_name);
        sql.setString(2,user_password);
        sql.executeUpdate();
    }
    public static void showtable(HttpServletResponse response) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection(url,user,password);
        PrintWriter out = response.getWriter();
        PreparedStatement sql=con.prepareStatement("SELECT id,password FROM loadinf");
        ResultSet re=sql.executeQuery();
        out.print("<br>用户信息：<br>");
        while(re.next())
        {
            out.print("账号:"+re.getString("id")+"密码:"+re.getString("password")+"<br>");
        }
    }
    public static int judge(String user_id,String user_password)throws Exception
    {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection(url,user,password);
        PreparedStatement stm=con.prepareStatement("select id from loadinf where id=? and password=?");
        stm.setString(1,user_id);
        stm.setString(2,user_password);
        ResultSet re=stm.executeQuery();
        if(re.next())
        {
            return 1;
        }
        else
            return 0;
    }
}
