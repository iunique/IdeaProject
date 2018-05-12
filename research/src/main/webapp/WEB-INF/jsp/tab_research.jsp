<%@ page import="entity.inf" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.sql" %>
<%@ page import="entity.det" %><%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-20
  Time: 下午3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>问卷调查</title>
</head>
<body>
    <form action="/servlets/handle_submit" method="post">
    <%
        String username=(String)session.getAttribute("username");
        List<inf>l= sql.findDes(username);
        for(int i=0;i<l.size();i++)
        {
    %>
    <p><%=i+1%>.<%=l.get(i).getDes()%></p>
    <%
            List<det>lz=sql.findOptByNum(l.get(i));
            for(int j=0;j<lz.size();j++)
            {
                char c=(char)(65+j);
    %>
    <%=c%>.<input type="radio" name="opt<%=lz.get(j).getNum()%>" value="<%=lz.get(j).getId()%>"><%=lz.get(j).getOpt()%><br/>
    <%
            }
        }
    %>
    <button type="submit" >提交</button>
    </form>
</body>
</html>
