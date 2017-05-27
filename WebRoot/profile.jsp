<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>

<head>
    <title>婚恋网站</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/font-awesome.css" rel="stylesheet">
    <script>
        $(document).ready(function () {
            $(".dropdown").hover(function () {
                $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                $(this).toggleClass('open');
            }, function () {
                $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                $(this).toggleClass('open');
            });
        });
    </script>
</head>

<body>
    <!-- ============================  Navigation Start =========================== -->
    <div class="navbar navbar-inverse-blue navbar">
        <div class="navbar-inner">
            <div class="container">
                <div class="navigation">
                    <c:if test="${user==null}">
                        <nav id="colorNav">
                            <ul>
                                <li class="green">
                                    <a href="#" class="icon-home"></a>
                                    <ul>
                                        <li>
                                            <a href="login.jsp">登录</a>
                                        </li>
                                        <li>
                                            <a href="register.jsp">注册</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
                <a class="brand" href="<%=basePath%>"><img src="images/logo.png" alt="logo"></a>
                <div class="pull-right">
                    <nav class="navbar nav_bottom" role="navigation">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header nav_2">
                            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
								菜单
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
                            <a class="navbar-brand" href="#"></a>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav nav_1">
                                <li>
                                    <a href="<%=basePath%>">首页</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>home?cmd=members">会员</a>
                                </li>
                                <c:if test="${user!=null}">
                                    <li class="dropdown js-user">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.username}<span
										class="caret"></span>
									</a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="<%=basePath%>user?cmd=edit">修改资料</a>
                                            </li>
                                            <li>
                                                <a href="<%=basePath%>user?cmd=avatar">修改头像</a>
                                            </li>
                                            <li>
                                                <a href="<%=basePath%>user?cmd=logout">注销</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- end navbar-inverse-blue -->
	
	<div class="grid_3">
		<div class="container">
			<div class="breadcrumb1">
				<ul>
					<a href="<%=basePath%>"><i class="fa fa-home home_1"></i></a>
					<span class="divider">&nbsp;|&nbsp;</span>
					<li class="current-page">个人资料</li>
				</ul>
			</div>
			<div class="profile">
				<div class="col-md-8 profile_left">
					<h2>用户 Id : ${u.userid}</h2>
					<div class="col_3">
						<div class="col-sm-4 row_2">
							<div class="flexslider">
								<ul class="slides">
									<li><img style="width:200px;" src="images/avatar/${u.avatar}"  onerror="this.src='<c:choose><c:when test="${u.sex=='male'}">images/boy.png</c:when><c:otherwise>images/girl.png</c:otherwise></c:choose>'"/></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-8 row_1">
							<table class="table_working_hours">
								<tbody>
									<tr class="opened_1">
										<td class="day_label1">用户:</td>
										<td class="day_value">${u.username}</td>
									</tr>
									<tr class="opened_1">
										<td class="day_label1">年龄:</td>
										<td class="day_value">${u.age}岁</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">身高:</td>
										<td class="day_value">${u.height}CM</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">邮箱:</td>
										<td class="day_value">${u.email}</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">婚姻状态:</td>
										<td class="day_value">
											<c:choose>
												<c:when test="${u.marital_situatio=='0'}">
													未婚		
												</c:when>
												<c:otherwise>已婚</c:otherwise>
											</c:choose>										
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col_4">
						<div class="bs-example bs-example-tabs">
							<div class="tab-content">
								<div class="tab-pane fade in active">
									<div class="tab_box">
										<h1>${u.detail}</h1>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 profile_right">
					<div class="view_profile">
						<h3>更多</h3>
						<c:forEach items="${s_users}" var="u2">
						<ul class="profile_item">
							<a href="#">
								<li class="profile_item-img">
									<img class="img-responsive" src="images/avatar/${u2.avatar}"  onerror="this.src='<c:choose><c:when test="${u2.sex=='male'}">images/boy.png</c:when><c:otherwise>images/girl.png</c:otherwise></c:choose>'"/>
								</li>
								<li class="profile_item-desc">
									<h4>ID:${u2.userid}</h4>
									<p>${u2.username}</p>
									<h5><a href="<%=basePath%>home?cmd=profile&id=${u2.userid}">详细资料</a></h5>
								</li>
								<div class="clearfix"> </div>
							</a>
						</ul>
						</c:forEach>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
    
    <div class="footer">
        <div class="container">
            <div class="copy">
                <p>
                    Copyright &copy; 2017.Company name All rights reserved.
                </p>
            </div>
        </div>
    </div>
</body>
</html>