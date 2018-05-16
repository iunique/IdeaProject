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
<title>Welcome to my web</title>
<body style="background-image: url('/img/b1.jpeg');position:relative;">
    <div class="panel panel-info center-block text-center" style="position:relative;width: 500px;top: 30%;">
        <div class="panel-heading">
            <h3 class="panel-title">控制面板</h3>
        </div>
        <a href="/create_tab" class="list-group-item">创建调查问卷</a>
        <a href="/research" class="list-group-item">调查问卷</a>
        <a href="/result" class="list-group-item">查看调查问卷情况</a>
        <span class="list-group-item">生成问卷链接：hjy98.iok.la:21306/re/<%=session.getAttribute("username")%></span>
    </div>
</body>
</html>