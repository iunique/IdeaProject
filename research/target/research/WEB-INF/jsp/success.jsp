<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-5-5
  Time: 下午1:31
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
<h1>问卷提交成功</h1>
<meta http-equiv="refresh" content="3;url=/result">
<span id="sp" style="color:red;">time </span>秒后将自动跳转到问卷结果页面。
</body>
</html>
