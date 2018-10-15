<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 2018/10/14
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
    <form method="post" action="/Upload" enctype="multipart/form-data">
        <span>选择一个文件</span>
        <input type="file" name="file"/>
        <br/><br/>
        <input type="submit" value="上传"/>
    </form>
</body>
</html>
