<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-27
  Time: 下午7:45
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
    var time =4;
    var s=0;
    function  timeset()
    {
        window.setTimeout('timeset()', 1000);
        time=time-1;
        document.getElementById("sp").innerHTML=time;

    }
    function timeshow()
    {
        window.setTimeout('timeshow()',100);
        s=s+5;
        var ss=s+"%";
        $("#test").css("width",ss);
    }
</script>
<style type="text/css">
    body
    {
        width: 1920px;
        height: 900px;
        background-size:cover;
    }
    #main {
        position: relative;
        top:40%;
        transform: translateY(-40%);
        font-size: 20px;
    }
</style>
<html>
<head>
    <title>Judge</title>
</head>
<body onload="timeset();timeshow()">
<%
    String confirm=(String)session.getAttribute("confirm");
    if(confirm.equals("true"))
    {
%>
<script>alert("注册成功，请到达主界面进行登录");</script>
<meta http-equiv="refresh" content="3;url=/">
<%
        session.removeAttribute("confirm");
    }
    else
    {
        session.setAttribute("confirm","false");
        request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request,response);
    }
%>
    <div class="text-center" id="main">
        <h3 class="text-center">waiting...</h3>
        <div class="progress progress-striped active" style="width: 300px;margin-left: 42%">
            <div class="progress-bar progress-bar-success" role="progressbar"
                 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                 id="test">
            </div>
        </div>
        <img class=".img-rounded" src="/img/saber.gif" style="margin-bottom: 20px" >
        <div><span id="sp" style="color:red;">time </span>秒后将自动跳转页面</div>
    </div>
</body>
</html>
