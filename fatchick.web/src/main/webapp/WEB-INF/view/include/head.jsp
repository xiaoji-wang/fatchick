<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=path%>/css/bootstrap-3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/css/fatchick.css" />
<script src="<%=path%>/js/jquery-2.1.3.min.js"></script>
<script src="<%=path%>/css/bootstrap-3.3.4/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/fatchick.js"></script>
<script type="text/javascript">
	var path='<%=path%>';
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" style="border-radius:0px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="<%=path%>/user/setting.page"><img class="head_image" src="<%=path%>/picture?path=${user.id}&name=head.png" /></a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="<%=path%>/user/setting.page">${user.nickName}</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=path%>/user/main.page">网址书签</a></li>
				<li><a href="#">笔记</a></li>
				<li>
					<a href="javascript:logout()">退出</a>
					<form class="logout" action="<%=path%>/user/logout.data"></form>
				</li>
			</ul>
		</div>
	</div>
	</nav>
</body>
</html>