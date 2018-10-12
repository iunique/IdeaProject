package dao;

import entity.Login;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
    private static SqlSession sqlSession=sqlSession=session.getSession();
    public static String checkLogin(String id)
    {
        return sqlSession.selectOne("domain1.checkLogin",id);
    }
    public static void register(Login login)
    {
        sqlSession.insert("domain1.register",login);
        sqlSession.commit();
    }
    public static void updatePwd(Login login)
    {
        sqlSession.update("domain1.updatePwd",login);
        sqlSession.commit();
    }
}
