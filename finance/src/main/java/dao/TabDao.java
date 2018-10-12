package dao;

import entity.Tab;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TabDao {
        private static SqlSession sqlSession=sqlSession=session.getSession();
        public static List<Tab>findTabById(String id)
        {
            return sqlSession.selectList("domain2.findTabById",id);
        }
         public static Integer findTabByName(Tab tab)
         {
            return sqlSession.selectOne("domain2.findTabByName",tab);
         }
        public static void insertTab(Tab tab)
        {
            sqlSession.insert("domain2.insertTab",tab);
            sqlSession.commit();
        }
        public static void deleteTab(Integer tab_no)
        {
            sqlSession.delete("domain2.deleteTab",tab_no);
            sqlSession.commit();
        }
        public static void updateTab(Tab tab)
        {
            sqlSession.update("domain2.updateTab",tab);
            sqlSession.commit();
        }
}
