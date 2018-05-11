<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-20
  Time: 下午3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="Dao.*" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.det" %>
<%@ page import="entity.inf" %>
<%
    if(session.getAttribute("flag")!=null)
    {
%>
<script> alert("添加成功");</script>
<%
        session.removeAttribute("flag");
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>调查表建立</title>
</head>
<body>
    <div>
        <div>
            <a href="/">回到主界面</a>&nbsp;&nbsp;&nbsp;
            <a href="/research">查看问卷</a>
            <p>已添加的题目：</p>
            <%
                String username=(String)session.getAttribute("username");
                List<inf>l;
                l=sql.findDes(username);
                for(int i=0;i<l.size();i++)
                {
                    String des=l.get(i).getDes();
                    List<det>lz=sql.findOptByNum(l.get(i));
            %>
           <form method="post">
               <textarea hidden name="num"><%=(l.get(i)).getNum()%></textarea>
               <textarea hidden name="username"><%=username%></textarea>
                    <div><%=i+1%>.题目描述：</div>
                    <textarea style="width: 200px;height: 80px" name="des"><%=des%>
                    </textarea>
                    <input type="submit" onclick="this.form.action='/servlets/adjdes'" value="修改描述"/>
                    <input type="submit" onclick="this.form.action='/servelts/deletedes'" value="删除题目"/>
           </form>
           <%
                  for(int j=0;j<lz.size();j++)
                  {
                        char c=(char)(65+j);
                        String tt=lz.get(j).getOpt();
           %>
            <form method="post">
                <textarea hidden name="username"><%=username%></textarea>
                <textarea hidden name="num"><%=(l.get(i)).getNum()%></textarea>
                <textarea hidden name="id"><%=(lz.get(j)).getId()%></textarea>
            <%=c%>.<textarea style="width: 120px;height: 25px" name="opt"><%=tt%></textarea>
                <input type="submit" onclick="this.form.action='/servlets/adjopt'" value="修改选项"/>
                <input type="submit" onclick="this.form.action='/servelts/deleteOneOpt'" value="删除选项"/>
            </form>
          <%
                  }
             }
          %>
        </div>
        <hr>
        <p>添加题目</p>
        <%
            int tmp;
            tmp=sql.findMaxNum(username);
            inf a1=new inf();
            a1.setUsername(username);
            a1.setNum(tmp);
        %>
            当前题号:<%=l.size()%><br/>
            <form method="post" action="/servlets/adjdes">
                <textarea hidden name="num"><%=tmp%></textarea>
                <textarea hidden name="username"><%=username%></textarea>
                <div><%=l.size()%>.题目描述：</div>
                <textarea style="width: 200px;height:80px" name="des"><%=sql.findOneDes(a1).getDes()%></textarea>
                <button type="submit">修改描述</button>
            </form>
            已添加选项：<br/>
            <%
                List<det>l1=sql.findOptByNum(a1);
                for(int i=0;i<l1.size();i++)
                {
                        char c=(char)(65+i);
            %>
            <form method="post">
                <textarea hidden name="username"><%=username%></textarea>
                <textarea hidden name="num"><%=tmp%></textarea>
                <textarea hidden name="id"><%=l1.get(i).getId()%></textarea>
                <p><%=c%>.<textarea style="width: 120px;height: 25px" name="opt"><%=(l1.get(i)).getOpt()%></textarea>
                    <input type="submit" onclick="this.form.action='/servlets/adjopt'" value="修改选项"/>
                    <input type="submit" onclick="this.form.action='/servelts/deleteOneOpt'" value="删除选项"/>
            </form>
            <%
                }
            %>
        <br/>
        为当前题目添加选项:
        <form method="post" action="/servlets/addopt">
            <textarea hidden name="username"><%=username%></textarea>
            <textarea hidden name="num"><%=tmp%></textarea>
            <textarea hidden name="id"><%=l1.size()==0?1:((int)(sql.findMaxId(a1))+1)%></textarea>
            <textarea style="width: 200px;height: 80px" name="opt"></textarea><br/>
            <button type="submit">添加选项卡</button>
        </form>
        <a href="/servlets/addnum" style="display: block">进入下一题添加</a>
    </div>
</body>
</html>
