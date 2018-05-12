<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-24
  Time: 下午8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    Cookie cookies[]=null;
    cookies=request.getCookies();
    String username="";
    String pwd="";
    if(cookies!=null)
    {
        for(Cookie c:cookies)
        {
            String s=c.getName();
            if("username".equals(s))
            {
                username= URLDecoder.decode((String)c.getValue(),"UTF-8");
                System.out.println(username);
            }
            if("pwd".equals(s))
            {
                pwd= URLDecoder.decode((String)c.getValue(),"UTF-8");
                System.out.println(pwd);
            }
        }
    }
    else
        System.out.println("fuck");
%>
<html>
<head>
    <title>login</title>
</head>
<body>
    <form action="/servlets/login" method="post">
        账号：<input name="username" value="<%=username%>"/><br/>
        密码：<input type="password" name="pwd" value="<%=pwd%>"/>
        <button type="submit">登录</button>
    </form>
    <a href="/registerPage">注册</a>
</body>
</html>
