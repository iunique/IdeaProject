<%@ page import="java.util.List" %>
<%@ page import="dao.TabDao" %>
<%@ page import="entity.Tab" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
	
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="/assets/js/Lightweight-Chart/cssCharts.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
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
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="/index"><i class="large material-icons">财务信息管理</i></a>
			</div>
            <ul class="nav navbar-top-links navbar-right">
				<% String id=(String)session.getAttribute("id"); %>
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b><%=id%></b></a></li>
            </ul>
        </nav>
	   <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="/index" class="waves-effect active-menu waves-dark"><i class="fa fa-dashboard"></i>主页</a>
                    </li>
                    <li>
                        <a href="/manage" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>报表管理</a>
                    </li>
					<li>
                        <a href="/chart" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>报表查询</a>
                    </li>
                    
                    <li>
                        <a href="/table" class="waves-effect waves-dark"><i class="fa fa-table"></i>报表修改</a>
                    </li>
                    <li>
                        <a href="/empty" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i>导出报表</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
		<div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            主页
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">主页</a></li>
					  <li><a href="#">信息一览</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
            <div id="page-inner">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-action">
                                个人信息
                            </div>
                            <%
                                List<Tab> l= TabDao.findTabById(id);
                            %>
                            <div class="card-content">
                                <div class="panel panel-info" style="width: 40%">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">个人信息</h3>
                                    </div>
                                    <div class="panel-body">
                                        <p><h6>用户名:<%=id%></h6></p>
                                        <p><h6>报表数目:<%=l.size()%></h6></p>
                                        <p><h6>报表一览:</h6></p>
                                        <%
                                            int add=0;
                                            for(Tab i:l)
                                            {
                                        %>
                                        <span><%=i.getTab_name()%></span>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%
                                                add++;
                                                if(add%5==0)
                                                {
                                        %>
                                                <br>
                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                                <form method="post" action="/adj" class="bs-example bs-example-form" style="width: 40%">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">密码修改</h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="input-group">
                                                <span class="input-group-addon">原密码</span>
                                                <input type="text" class="form-control" placeholder="原密码" name="bpwd">
                                            </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon">新密码</span>
                                                <input type="text" class="form-control" placeholder="新密码" name="npwd">
                                            </div>
                                        </div>
                                        <div class="btn-group " style="margin-left: 3%;margin-bottom: 3%">
                                            <button type="submit" class="btn btn-default">确认修改</button>
                                        </div>
                                        <br>
                                    </div>
                                </form>
                                <div class="clearBoth"><br/></div>
                            </div>
                        </div>
				<footer><p>Copyright &copy; 2018.hjy All rights reserved.</p>
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
 

</body>

</html>