package Dao;

import entity.det;
import entity.inf;
import entity.user;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class sql {
    private static SqlSession session;
    static {
        session= Dao.session.getSession();
    }
    public static int findUser(String name)
    {
        return session.selectOne("dom.findUser",name);
    }
    public static String findPwd(String name)
    {
        return session.selectOne("dom.findPwd",name);
    }
    public static void insertUser(user user)
    {
        session.insert("dom.insertUser",user);
    }
    public static List<inf> findDes(String username)
    {
        return session.selectList("dom.findDes",username);
    }
    public static List<det> findOptByNum(inf t)
    {
        return session.selectList("dom.findOptByNum",t);
    }
    public static inf findOneDes(inf t)
    {
        return session.selectOne("findOneDes",t);
    }
    public static void insertInf(inf t)
    {
        session.insert("dom.insertInf",t);
    }
    public static void insertOpt(det t)
    {
        session.insert("dom.insertOpt",t);
    }
    public static int findMaxNum(String username)
    {
        return session.selectOne("findMaxNum",username);
    }
    public static int findMaxId(inf t)
    {
        return session.selectOne("findMaxId",t);
    }
    public static void updateDes(inf t)
    {
        session.update("dom.updateDes",t);
    }
    public static void updateOpt(det t)
    {
        session.update("dom.updateOpt",t);
    }
    public static void updateRes(det t)
    {
        session.update("dom.updateRes",t);
    }
    public static void deleteDes(inf t)
    {
        session.delete("deleteDes",t);
    }
    public static void deleteOneOpt(det t)
    {
        session.delete("deleteOneOpt",t);
    }
    public static void deleteAllOpt(inf t)
    {
        session.delete("deleteAllOpt",t);
    }
}
