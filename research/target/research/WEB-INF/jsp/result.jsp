<%@ page import="Dao.sql" %>
<%@ page import="entity.det" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.inf" %><%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-20
  Time: 下午3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>问卷调查</title>
</head>
<body>
    <%
        String username=(String)session.getAttribute("username");
        List<inf>l= sql.findDes(username);
        for(int i=0;i<l.size();i++)
        {
    %>
    <p><%=i+1%>.<%=l.get(i).getDes()%></p>
    <%
        List<det> lz=sql.findOptByNum(l.get(i));
            for(int j=0;j<lz.size();j++)
            {
            char c=(char)(65+j);
    %>
    <%=c%>.<%=lz.get(j).getOpt()%>&nbsp;&nbsp;<span style="color: red">选择该选项人数:<%=lz.get(j).getValue()%></span><br/>
    <%
            }
        }
    %>
</body>
</html>
