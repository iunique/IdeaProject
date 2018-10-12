package dao;

import entity.Info;
import entity.Message;
import entity.Tab;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

;
import java.util.List;

@Repository
public class InfoDao {
    private static SqlSession sqlSession=session.getSession();
    public static List<Info> findAllInfo(Integer tab_no)
    {
        return sqlSession.selectList("domain3.findAllInfo",tab_no);
    }
    public static List<Info> findInfoByMessage(Message message)
    {
        return sqlSession.selectList("domain3.findInfoByMessage",message);
    }
    public static void insertInfo(Info info)
    {
        sqlSession.insert("domain3.insertInfo",info);
        sqlSession.commit();
    }
    public static void deleteOneInfo(Integer info_no)
    {
        sqlSession.delete("domain3.deleteOneInfo",info_no);
        sqlSession.commit();
    }
    public static void updateInfo(Info info)
    {
        sqlSession.update("domain3.updateInfo",info);
        sqlSession.commit();
    }
    public static void updateInfoName(Tab tab)
    {
        sqlSession.update("domain3.updateInfoName",tab);
        sqlSession.commit();
    }
}
