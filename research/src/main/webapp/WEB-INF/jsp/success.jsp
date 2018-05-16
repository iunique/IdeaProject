<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-5-5
  Time: 下午1:31
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
<script type="text/javascript">
    var time =3;
    function  timeset()
    {
        window.setTimeout('timeset()', 1000);
        time=time-1;
        document.getElementById("sp").innerHTML=time;

    }
</script>
<html>
<head>
    <title>Judge</title>
</head>
<body onload="timeset()" class="text-center">
<h1>问卷提交成功</h1>
<img src="/img/bili.gif" class="center-block">
<meta http-equiv="refresh" content="3;url=/result">
<span id="sp" style="color:red;">time </span>秒后将自动跳转到问卷结果页面。
</body>
</html>
