<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.TabDao" %>
<%@ page import="entity.Tab" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

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
    <script type="text/javascript">
        function show_confirm()
        {
            var r=confirm("确认要删除该表？");
            if (r==true)
            {
                alert("该表已删除!");
                return true;
            }
            return false;
        }
        function show_confirm2()
        {
            var r=confirm("确认要修改该表名称？");
            if (r==true)
            {
                alert("该表名称已修改!");
                return true;
            }
            return false;
        }
        <%
        if(session.getAttribute("tag")!=null)
         {
            String temp=String.valueOf(session.getAttribute("tag"));
            int tag=Integer.parseInt(temp);
            if(tag!=-1)
            {
        %>
        alert("建表成功!");
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
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="/index" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i>主页</a>
                    </li>
                    <li>
                        <a href="/manage" class="active-menu waves-effect waves-dark"><i class="fa fa-desktop"></i>报表管理</a>
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
                           报表管理
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">主页</a></li>
					  <li><a href="#">报表管理</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
            <div id="page-inner"> 
				 
                 <!-- /. ROW  -->
                 
				<div class="row">
				<div class="col-md-12">
                          <div class="card">
                        <div class="card-action">
                            现有报表:
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
                                        List<Tab>l= TabDao.findTabById(id);
                                        int add=0;
                                        for(Tab i:l)
                                        {
                                            add++;
                                    %>
                                    <form method="post">
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
                                        <td><input class="form-control" name="table_name" value="<%=i.getTab_name()%>"/></td>
                                        <td><%=id%></td>
                                        <td>
                                            <button onclick="if(show_confirm()){this.form.action='/deleteTable';this.form.submit()}" class="btn btn-danger" style="font-size: smaller">删除该表</button>
                                            <button onclick="if(show_confirm2()){this.form.action='/adjTable';this.form.submit()}" class="btn btn-warning" style="font-size: smaller">修改表名</button>
                                        </td>
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
                    <div class="card">
                        <div class="card-action">
                            新建报表
                        </div>
                        <div class="card-content">
                            <form class="bs-example bs-example-form" role="form" action="/insertTable" method="post">
                                <div class="input-group">
                                    <span class="input-group-addon">表名</span>
                                    <input type="text" class="form-control" placeholder="请输入表名" name="tab_name" style="width: 30%">
                                    <button class="btn btn-info" type="submit">确定建表</button>
                                </div>
                            </form>
                        </div>
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
