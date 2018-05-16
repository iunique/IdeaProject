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
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>问卷调查</title>
</head>
<body style="background-image: url('/img/b4.jpeg');width: 1920px;height: 1080px">
    <h2 class="text-center" style="color: darkviolet">结果统计</h2>
    <%
        String username=(String)session.getAttribute("username");
        List<inf>l= sql.findDes(username);
        for(int i=0;i<l.size();i++)
        {
    %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title"><%=i+1%>.<%=l.get(i).getDes()%></h3>
        </div>
        <div class="panel-body">
    <%
        List<det> lz=sql.findOptByNum(l.get(i));
            for(int j=0;j<lz.size();j++)
            {
            char c=(char)(65+j);
    %>
    <%=c%>.<%=lz.get(j).getOpt()%>&nbsp;&nbsp;<span style="color: red">选择该选项人数:<%=lz.get(j).getValue()%></span><br/>
    <%
            }
    %>
            </div>
        </div>
     <%
        }
    %>
</body>
</html>
