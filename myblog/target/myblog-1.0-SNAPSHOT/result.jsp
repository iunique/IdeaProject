<%@ page import="Dao.mysql" %><%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 2018/1/14
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="Dao.mysql" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    mysql.showtable(response);
%>
</body>
</html>
