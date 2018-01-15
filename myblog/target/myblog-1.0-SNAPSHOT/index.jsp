<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <style type="text/css">
        #main{
            background-image: url("imag/p1.jpg");
            width: 1422px;
            height: 800px;
            position: absolute;
        }
        #load{
            margin-left: 40%;
            margin-top: 20%;
        }
    </style>
    <%
        PrintWriter outer=response.getWriter();
        if(request.getParameter("reg")!=null)
        {
            outer.print("<script>alert('注册成功!');</script>");
        }
        if(request.getParameter("sue")!=null)
        {
            int re=Integer.parseInt( request.getParameter("sue"));
            if(re==1)
            {
                response.sendRedirect("blog/index.html");
            }
            else
                outer.print("<script>alert('登录失败!');</script>");
        }
    %>
</head>
<title>Welcome</title>
<body>
<div id="main">
    <div id="load">
        <form method="post" action="servlets/judge">
            <table>
                <tr>
                    <td>账号:</td>
                    <td><input type="text" name="id"/></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="登录"/></td>
                    <td><a href="register_page.jsp">注册账号</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
