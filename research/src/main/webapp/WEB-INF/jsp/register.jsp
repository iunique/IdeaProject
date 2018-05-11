<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-24
  Time: 下午8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String confirm=(String)session.getAttribute("confirm");
    if(confirm!=null)
    {
%>
<script>alert("注册失败，该账号已被注册");</script>
<%
        session.removeAttribute("confirm");
    }
%>
<html>
<head>
    <title>register</title>
</head>
<body>
    <form action="/servlets/register" method="post">
        账号:<input name="username"/>
        密码:<input name="pwd" type="password"/>
        <button type="submit">注册</button>
    </form>
</body>
</html>
