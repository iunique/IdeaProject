<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 2018/10/15
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件下载</title>
</head>
<body>
<%
    HashMap<String,String>map=(HashMap<String, String>) request.getAttribute("fileNameMap");
    for(Map.Entry<String,String>entry:map.entrySet())
    {
%>
    <form method="post" action="/Download">
        <span><%=entry.getValue()%></span>
        <input name="filename" style="display: none" value="<%=entry.getKey()%>"/>
        <input type="submit" value="下载"/>
    </form>
<%
    }
%>
</body>
</html>
