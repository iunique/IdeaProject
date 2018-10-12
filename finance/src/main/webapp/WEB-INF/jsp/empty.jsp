<%@ page import="java.util.List" %>
<%@ page import="entity.Tab" %>
<%@ page import="dao.TabDao" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
	
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
                        <a href="/index" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i>主页</a>
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
                        <a href="/empty" class="waves-effect active-menu waves-dark"><i class="fa fa-fw fa-file"></i>导出报表</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            导出报表
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">主页</a></li>
					  <li><a href="#">导出报表</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-action">
                                报表导出:
                            </div>
                            <div class="card-content">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>报表名称</th>
                                            <th>所属</th>
                                            <th>按键</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Tab> l= TabDao.findTabById(id);
                                            int add=0;
                                            for(Tab i:l)
                                            {
                                                add++;
                                        %>
                                        <form method="post" action="/downloads">
                                            <input value="<%=i.getTab_no()%>" name="table_no" type="hidden"/>
                                            <%
                                                if(add%4==1)
                                                {
                                            %>
                                            <tr class="success">
                                                    <%     }
                                            else if(add%4==2)
                                            {
                                        %>
                                            <tr class="info">
                                                    <%
                                            }
                                            else if(add%4==3)
                                            {
                                        %>
                                            <tr class="warning">
                                                    <%  }
                                            else
                                            {
                                        %>
                                            <tr class="danger">
                                                <%   }
                                                %>
                                                <td><%=add%></td>
                                                <td><%=i.getTab_name()%></td>
                                                <td><%=id%></td>
                                                <td><button type="submit" class="btn btn-success" style="font-size: smaller">导出该表</button></td>
                                            </tr>
                                        </form>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                                <br>
                                <div class="clearBoth"></div>
						    
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
