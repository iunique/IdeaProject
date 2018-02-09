<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Regist</title>
</head>
<body>
<form action="registSuccess" method="post">
    用户名:<input type="text" name="name"/><br>
    密&nbsp;码:<input type="password" name="password"/><br>
    年&nbsp;龄:<input type="number" name="age"><br>
    <input type="submit" value="提交"/>
    注册失败，用户名已被占用
</form>
</body>
</html>
