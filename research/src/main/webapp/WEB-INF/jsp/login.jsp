<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-24
  Time: 下午8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
    <form action="/servlets/login" method="post">
        账号：<input name="username"/><br/>
        密码：<input type="password" name="pwd"/>
        <button type="submit">登录</button>
    </form>
    <a href="/registerPage">注册</a>
</body>
</html>
