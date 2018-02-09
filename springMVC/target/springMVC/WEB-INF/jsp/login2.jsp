<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<form action="login" method="post">
    用户名:<input type="text" name="name"/><br>
    密&nbsp;码:<input type="password" name="password"/><br>
    <input type="submit" value="登录">登录失败，用户名或密码有误<br>
    <a href="regist">注册</a>
</form>
</body>
</html>