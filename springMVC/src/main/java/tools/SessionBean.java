package tools;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import java.io.IOException;
import java.io.InputStream;

public class SessionBean {
    private final static SqlSessionFactory sqlSessionFactory;
    static {
        String resource = "config.xml";
        InputStream inputStream=null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }
    public static SqlSession getSession()
    {
        return sqlSessionFactory.openSession(true);//这里设置成true表示支持事务，就是会更新数据库的意思，mybatis默认不支持事务
    }
}
