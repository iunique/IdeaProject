<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="Stylesheet" type="text/css" href="/css/loginDialog.css" />
    <script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}</script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>$(document).ready(function(c) {
        $('.alert-close').on('click', function(c){
            $('.message').fadeOut('slow', function(c){
                $('.message').remove();
            });
        });
    });
    </script>
    <script type="text/javascript">
        <%
                if(session.getAttribute("tag")!=null)
                 {
                     String temp=String.valueOf(session.getAttribute("tag"));
                    int tag=Integer.parseInt(temp);
                    if(tag!=-1)
                    {
         %>
        var obj="${message.words}";
        alert(obj);
        <%
                    session.setAttribute("tag","-1");
                    }
                 }
        %>
    </script>
    <script src="/js/login.js"></script>
</head>
<body>
<!-- contact-form -->
<div class="inset center-block" style="width: 500px">
    <h2 style="margin-left: 29%;margin-top:20%;color: white">财务信息管理系统</h2>
    <form action="/sign_in" method="post">
        <li>
            <input type="text" name="id" class="text" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}"><a href="#" class=" icon user"></a>
        </li>
        <div class="clear"> </div>
        <li>
            <input type="password" name="pwd" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"> <a href="#" class="icon lock"></a>
        </li>
        <div class="clear"> </div>
        <div class="submit text-center">
            <button type="submit" class="btn btn-primary" style="margin-right: 15%">登录</button>
            <a herf="#" id="example" class="btn btn-info" style="margin-left: 15%" >注册</a>
            <div class="clear"> </div>
        </div>
    </form>
</div>
<form method="post" action="/register" style="margin-top: 100%">
    <div id="LoginBox">
        <div class="row1">
            注册账号窗口<a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a>
        </div>
        <div class="row">
            用户名: <span class="inputBox">
                <input type="text" id="txtName" placeholder="账号" name="id"/>
            </span><a href="javascript:void(0)" title="提示" class="warning" id="warn">*</a>
        </div>
        <div class="row">
            密&nbsp;&nbsp;&nbsp;&nbsp;码:
            <span class="inputBox">
                <input type="text" id="txtPwd" placeholder="密码" name="pwd"/>
            </span>
        <div class="row text-center">
            <button type="submit" class="btn btn-info" >注册</button>
        </div>
    </div>
</form>
<div class="clear"> </div>
<!--- footer --->
<div class="footer">
    <p>Copyright &copy; hjy</p>
</div>

</body>
</html>