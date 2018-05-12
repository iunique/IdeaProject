<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-25
  Time: 下午7:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body onload="timeset()">
<%
    String confirm=(String)session.getAttribute("confirm");
    if(confirm.equals("none"))
    {
%>
    <script>alert("该用户不存在，请到登陆页面注册！");</script>
    <meta http-equiv="refresh" content="3;url=/">
<%
    }
    else if(confirm.equals("true"))
    {
%>
    <jsp:forward page="index.jsp"></jsp:forward>
<%
    }
    else {
%>
    <script>alert("登录失败，密码错误！");</script>
    <meta http-equiv="refresh" content="3;url=/">
<%
    }
    session.removeAttribute("confirm");
%>
<span id="sp" style="color:red;">time </span>秒后将自动跳转到登陆页面。
</body>
</html>