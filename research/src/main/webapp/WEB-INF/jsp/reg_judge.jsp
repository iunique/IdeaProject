<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-27
  Time: 下午7:45
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
<span id="sp" style="color:red;">time </span>秒后将自动跳转页面。
</body>
</html>
