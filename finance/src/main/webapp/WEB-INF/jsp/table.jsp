<%@ page import="java.util.List" %>
<%@ page import="entity.Info" %>
<%@ page import="service.Finance" %>
<%@ page import="entity.Tab" %>
<%@ page import="dao.TabDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        <%
                if(session.getAttribute("tag")!=null)
                 {
                    String temp=String.valueOf(session.getAttribute("tag"));
                    int tag=Integer.parseInt(temp);
                    if(tag!=-1)
                    {
         %>
            alert("操作成功!");
        <%
                        session.setAttribute("tag","-1");
                    }
                 }
        %>
    </script>
    <script type="text/javascript">
        function show_confirm()
        {
            var r=confirm("确认要删除该信息？");
            if (r==true)
            {
                alert("该信息已删除!");
                return true;
            }
            return false;
        }
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
                        <a href="/manage" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>报表管理</a>
                    </li>
					<li>
                        <a href="/chart" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i>报表查询</a>
                    </li>
                    
                    <li>
                        <a href="/table" class="active-menu waves-effect waves-dark"><i class="fa fa-table"></i>报表修改</a>
                    </li>
                    <li>
                        <a href="/empty" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i>导出报表</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
		  <div class="header"> 
                        <h1 class="page-header">
                            报表修改
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">主页</a></li>
					  <li><a href="#">报表修改</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
		
            <div id="page-inner">
                <!-- /. ROW  -->
                <div class="row">


                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="card">
                            <div class="card-action">
                                报表信息插入
                            </div>
                            <div class="card-content">
                                <form class="bs-example bs-example-form" role="form" method="post" action="/insertInfo" style="width: 30%">
                                    <input name="id" type="hidden" value="<%=id%>"/>
                                    <div class="input-group">
                                        <span class="input-group-addon">报表名称:</span>
                                        <input type="text" class="form-control" placeholder="请输入表名(如不存在将会新建一个表)" name="tab_name">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">交易日期:</span>
                                        <input type="text" class="form-control" placeholder="请输入交易日期(格式如2018-9-10)" name="dat">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">交易金额:</span>
                                        <input type="text" class="form-control" placeholder="请输入交易金额(支出用负数表示)" name="amount">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">可选备注:</span>
                                        <input type="text" class="form-control" placeholder="请输入交易备注(可不写)" name="detail">
                                    </div>
                                    <button type="submit" class="btn btn-info">插入信息</button>
                                </form>
                            </div>
                        </div>

                        <%

                            List<Tab> l= TabDao.findTabById(id);
                            for(Tab i:l)
                            {
                        %>
                        <div class="card">
                            <div class="card-action">
                                <%=i.getTab_name()%>
                            </div>
                            <div class="card-content">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th class="center">报表名称</th>
                                            <th class="center">交易备注</th>
                                            <th class="center">交易日期</th>
                                            <th class="center">交易金额</th>
                                            <th class="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Info>li= Finance.findAllInfoByNo(i.getTab_no());
                                            int ans=0;
                                            double in_amount=0;
                                            double out_amount=0;
                                            double all=0;
                                            for(Info j:li)
                                            {
                                                if(j.getAmount()>=0)
                                                    in_amount+=j.getAmount();
                                                else
                                                    out_amount-=j.getAmount();
                                                all+=j.getAmount();
                                                ans++;
                                        %>
                                        <form method="post">
                                        <%
                                                if(ans%2==0)
                                                {
                                        %>
                                        <tr class="odd">
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        <tr class="even">
                                        <%}%>
                                            <input type="hidden" name="no" value="<%=j.getInfo_no()%>"/>
                                            <td class="center"><%=i.getTab_name()%></td>
                                            <td class="center"><input name="detail" type="text" class="form-control" value="<%=j.getDetail()%>"></td>
                                            <td class="center"><input name="dat" type="text" class="form-control" value="<%=j.getDat()%>"></td>
                                            <td class="center"><input name="amount" type="text" class="form-control" value="<%=j.getAmount()%>"></td>
                                            <td class="center">
                                                <button onclick="this.form.action='/adjInfo';this.form.submit()" class="btn btn-success">确定修改</button>
                                                <button onclick="if(show_confirm()){this.form.action='deleteInfo';this.form.submit()}" class="btn btn-danger">删除</button>
                                            </td>
                                        </tr>
                                        </form>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="center" style="font-size: large;font-weight: bold">
                                总计收入:<%=in_amount%>元&nbsp;&nbsp;&nbsp;&nbsp;总计支出:<%=out_amount%>元&nbsp;&nbsp;&nbsp;&nbsp;净收入:<%=all%>元
                            </div>
                            <br>
                        </div>
                        <%
                            }
                        %>
                        <!--End Advanced Tables -->
                    </div>

                </div>
                <!-- /. ROW  -->

                <footer><p>Copyright &copy; 2018.hjy All rights reserved.</p>
                </footer>
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->

</body>

</html>
