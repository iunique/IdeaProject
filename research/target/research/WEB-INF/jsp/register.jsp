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
    <title>register</title>
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
            margin-bottom:10px;
        }
        #title:hover
        {
            color:purple;
        }
    </style>
</head>
<body>
    <div id="main" class="text-center">
        <div id="title">信息注册</div>
        <form action="/servlets/register" method="post" class="bs-example bs-example-form" role="form">
            <div class="input-group" style="margin-left: 43%;margin-bottom: 10px">
                <span class="input-group-addon" >账号</span>
                <input style="width: 200px;" type="text" class="form-control" name="username"/>
            </div>
            <div class="input-group" style="margin-left: 43%;margin-bottom: 10px">
                <span class="input-group-addon">密码</span>
                <input style="width: 200px" type="password" class="form-control"name="pwd"/>
            </div>
            <button type="submit" class="btn btn-info">注册</button>
        </form>
    </div>
</body>
</html>
