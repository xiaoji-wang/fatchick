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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="<%=path%>/css/bootstrap-3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/css/styles.css" />
<script src="<%=path%>/js/jquery-2.1.3.min.js"></script>
<script src="<%=path%>/css/bootstrap-3.3.4/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/jquery-2.1.3.min.js"></script>
<title>欢迎登录</title>
</head>
<body>
<body>
	<div class="container-full">
		<div class="row">
			<div class="col-lg-12 text-center v-center">
				<h1>Hello World!</h1>
				<p class="lead">A sign-up page example for Bootstrap 3</p>
				<br /> <br /> <br />
				<form action="<%=path%>/user/login.data" method="post" class="col-lg-12">
					<div class="form-group" style="width: 340px; text-align: center; margin: 0 auto 15px auto;">
						<input class="form-control input-lg" name="code" placeholder="账号" type="text">
					</div>
					<div class="form-group" style="width: 340px; text-align: center; margin: 0 auto 15px auto;">
						<input class="form-control input-lg" name="password" placeholder="密码" type="text">
					</div>
					<div class="form-group">
						<button class="btn btn-lg btn-primary" type="submit">登录</button>
						<a class="btn btn-lg btn-default" href="<%=path%>">取消</a>
					</div>
				</form>
			</div>
		</div>
		<!-- /row -->
		<div class="row">
			<div class="col-lg-12 text-center v-center" style="font-size: 39pt;">
				<a href="#"><i class="icon-google-plus"></i></a> <a href="#"><i class="icon-facebook"></i></a> <a href="#"><i class="icon-twitter"></i></a> <a href="#"><i class="icon-github"></i></a> <a href="#"><i class="icon-pinterest"></i></a>
			</div>
		</div>
		<br/> <br/> <br/> <br/> <br/>
	</div>
	<!-- /container full -->
	<div class="container">
		<hr/>
		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Title.</h3>
					</div>
					<div class="panel-body">Text.</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Title.</h3>
					</div>
					<div class="panel-body">Text.</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>Title.</h3>
					</div>
					<div class="panel-body">Title.</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<br> <br>
				<p class="pull-right">
					<a href="http://www.bootply.com" target="_blank">Template from Bootply</a>
				</p>
				<br/> <br/>
			</div>
		</div>
	</div>
	<!-- <form action="<%=path%>/user/login.data" method="post" role="form" data-toggle="validator" style="margin: auto; position: relative; top: 30%; width: 240px;">
		<div class="form-group">
			<input name="code" class="form-control" type="text" placeholder="账号" required />
		</div>
		<div class="form-group">
			<input name="password" class="form-control" type="password" placeholder="密码" required data-minlength="1"/>
		</div>
		<div style="text-align: center;">
			<button type="submit" class="btn btn-default">进入</button>
		</div>
	</form>
	<c:import url="/foot.page"></c:import>-->
</body>
</html>