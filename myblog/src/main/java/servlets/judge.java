package servlets;

import Dao.mysql;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class judge extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            doGet(req, resp);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        String password=req.getParameter("password");
        int re= 0;
        try {

            re = mysql.judge(id, password);
            if (re == 0) {
                resp.sendRedirect("../index.jsp?sue=0");
            } else {
                resp.sendRedirect("../index.jsp?sue=1");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
