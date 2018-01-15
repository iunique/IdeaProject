<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 2018/1/14
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body style="position: absolute;height: 800px;width: 1400px;">
<div style="position: relative; margin-left: 40%;margin-top: 20%;">
    <form method="post" action="servlets/register">
        <table>
            <tr>
                <td>账号:</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="提交"/></td>
            </tr>
        </table>
    </form>
    <a href="result.jsp">查询账号注册情况</a>
</div>
</body>
</html>
