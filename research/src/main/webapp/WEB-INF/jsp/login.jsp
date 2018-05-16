<%@ page import="java.net.URLDecoder" %>
<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-24
  Time: 下午8:10
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
            }
            if("pwd".equals(s))
            {
                pwd= URLDecoder.decode((String)c.getValue(),"UTF-8");
            }
        }
    }
%>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
<head>
    <title>login</title>
    <style type="text/css">
        body {
            background-image:url("/img/background.jpeg");
            width: 1920px;
            height: 900px;
            background-size:cover;
        }
        #main {
            position: relative;
            top:50%;
            transform: translateY(-50%);
            font-size: 20px;
        }
        #title {
            font-size: 40px;
            color: yellow;
            margin-top: -10%;
            margin-bottom: 10px;
        }
        #title:hover
        {
            color:purple;
        }
    </style>
</head>
<body>
    <div id="main" class="text-center">
        <div id="title">问卷调查系统</div>
        <form method="post" class="bs-example bs-example-form" role="form">
            <div class="input-group" style="margin-left: 43%;margin-bottom: 10px">
                <span class="input-group-addon" >账号</span>
                <input style="width: 200px;" type="text" class="form-control" name="username" value="<%=username%>"/>
            </div>
            <div class="input-group" style="margin-left: 43%;margin-bottom: 10px">
                <span class="input-group-addon">密码</span>
                <input style="width: 200px" type="password" class="form-control"name="pwd" value="<%=pwd%>"/>
            </div>
            <button type="submit" style="margin-right: 100px" class="btn btn-primary" onclick="this.form.action='/servlets/login'">登录</button><button onclick="window.open('/registerPage')" class="btn btn-info">注册</button>
        </form>
    </div>
</body>
</html>
