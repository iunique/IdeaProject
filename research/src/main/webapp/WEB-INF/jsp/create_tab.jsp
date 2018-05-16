<%--
  Created by IntelliJ IDEA.
  User: hjy
  Date: 18-4-20
  Time: 下午3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="Dao.*" language="java" pageEncoding="UTF-8"%>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ page import="java.util.List" %>
<%@ page import="entity.det" %>
<%@ page import="entity.inf" %>
<%
    if(session.getAttribute("flag")!=null)
    {
%>
<script> alert("添加成功");</script>
<%
        session.removeAttribute("flag");
    }
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>调查表建立</title>
</head>
<body style="background-image: url('/img/b2.jpeg')">
    <div>
        <ul class="nav nav-pills nav-justified" style="color: white">
            <li><a href="/">回到登录界面</a></li>
            <li><a href="/index">回到控制面板</a></li>
            <li><a href="/research">查看生成问卷</a></li>
        </ul>
        <div>
            <div style="font-size: 20px;color: darkviolet;">已添加的题目:</div>
            <%
                String username=(String)session.getAttribute("username");
                List<inf>l;
                l=sql.findDes(username);
                for(int i=0;i<l.size();i++)
                {
                    String des=l.get(i).getDes();
                    List<det>lz=sql.findOptByNum(l.get(i));
            %>
           <form method="post" class="form-group" style="width: 40%;">
               <textarea hidden name="num"><%=(l.get(i)).getNum()%></textarea>
               <textarea hidden name="username"><%=username%></textarea>
               <div class="panel panel-success">
                   <div class="panel-heading">
                       <h3 class="panel-title"><%=i+1%>.题目描述：</h3>
                   </div>
                   <div class="panel-body">
                       <input class="form-control col-sm-5" name="des" value="<%=des%>" style="OVERFLOW:visible;height: 60px"/>
                   </div>
               </div>
                    <input type="submit" onclick="this.form.action='/servlets/adjdes'" value="修改描述" class="btn btn-warning"/>&nbsp;&nbsp;&nbsp;
                    <input type="submit" onclick="this.form.action='/servelts/deletedes'" value="删除题目" class="btn btn-danger"/>
           </form>
           <%
                  for(int j=0;j<lz.size();j++)
                  {
                        char c=(char)(65+j);
                        String tt=lz.get(j).getOpt();
           %>
            <form method="post"  role="form">
                <textarea hidden name="username"><%=username%></textarea>
                <textarea hidden name="num"><%=(l.get(i)).getNum()%></textarea>
                <textarea hidden name="id"><%=(lz.get(j)).getId()%></textarea>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><%=c%>.</label>
                    <div class="col-lg-4" style="margin-left: -15%">
                        <input type="text" class="form-control " name="opt" value="<%=tt%>"
                               placeholder="此处输入文本">
                    </div>
                    <input type="submit" onclick="this.form.action='/servlets/adjopt'" value="修改选项" class="btn btn-warning"/>
                    <input type="submit" onclick="this.form.action='/servelts/deleteOneOpt'" value="删除选项" class="btn btn-danger"/>
                </div>
            </form>
          <%
                  }
             }
          %>
        </div>
        <%
            int tmp;
            tmp=sql.findMaxNum(username);
            inf a1=new inf();
            a1.setUsername(username);
            a1.setNum(tmp);
        %>
        <div class="alert alert-info">
            <div>当前添加题号:<%=l.size()%></div>
        </div>
            <form method="post" action="/servlets/adjdes" class="form-group" style="width: 40%;">
                <textarea hidden name="num"><%=tmp%></textarea>
                <textarea hidden name="username"><%=username%></textarea>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><%=l.size()%>.题目描述：</h3>
                    </div>
                    <div class="panel-body">
                        <input class="form-control col-sm-5" name="des" value="<%=sql.findOneDes(a1).getDes()%>" style="OVERFLOW:visible;height: 60px"/>
                    </div>
                </div>
                <button type="submit" class="btn btn-warning">修改描述</button>
            </form>
           <div style="font-size: 20px;color: darkviolet;">本题已添加的选项：</div>
            <%
                List<det>l1=sql.findOptByNum(a1);
                for(int i=0;i<l1.size();i++)
                {
                        char c=(char)(65+i);
            %>
            <form method="post" class="form-group">
                <textarea hidden name="username"><%=username%></textarea>
                <textarea hidden name="num"><%=tmp%></textarea>
                <textarea hidden name="id"><%=l1.get(i).getId()%></textarea>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><%=c%>.</label>
                    <div class="col-lg-4" style="margin-left: -15%">
                        <input type="text" class="form-control " name="opt" value="<%=(l1.get(i)).getOpt()%>"
                               placeholder="此处输入文本">
                    </div>
                    <input type="submit" onclick="this.form.action='/servlets/adjopt'" value="修改选项" class="btn btn-warning"/>
                    <input type="submit" onclick="this.form.action='/servelts/deleteOneOpt'" value="删除选项" class="btn btn-danger"/>
                </div>
            </form>
            <%
                }
            %>
        <div style="font-size: 20px;color: darkviolet;">为当前题目添加选项:<div>
        <form method="post" action="/servlets/addopt" class="form-group">
            <textarea hidden name="username"><%=username%></textarea>
            <textarea hidden name="num"><%=tmp%></textarea>
            <textarea hidden name="id"><%=l1.size()==0?1:((int)(sql.findMaxId(a1))+1)%></textarea>
            <div class="col-lg-4">
                    <input type="text" class="form-control " name="opt"
                           placeholder="此处输入文本"/>
                </div>
            <button type="submit" class="btn btn-info" >添加选项卡</button>
        </form>
        <button onclick="window.open('/servlets/addnum')" class="btn btn-info">进入下一题添加</button>
    </div>
</body>
</html>
