package servlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.io.IOException;
import java.io.InputStream;

public class SessionBean {//用于获得session的类
    private final  static SqlSessionFactory sqlSessionFactory;
    static {
        String resource="config.xml";//mybatis的配置文件位置
        InputStream inputStream=null;
        try {
            inputStream = Resources.getResourceAsStream(resource);//将xml的配置信息注入
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);//建一个session的工厂类
    }
    public static SqlSession getSession()
    {
        return sqlSessionFactory.openSession();
    }//获得一个session
}
