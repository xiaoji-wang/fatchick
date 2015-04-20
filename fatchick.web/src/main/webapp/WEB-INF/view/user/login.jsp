<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height:100%;">
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=path%>/css/bootstrap-3.3.4/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/css/fatchick.css" />
<script src="<%=path%>/js/jquery-2.1.3.min.js"></script>
<script src="<%=path%>/css/bootstrap-3.3.4/js/validator.min.js"></script>
<title>进入</title>
<script type="text/javascript">
	$(function() {
		$('form[role="form"]').validator();
	});
</script>
</head>
<body style="height: 100%;padding-bottom: 40px;">
	<form action="<%=path%>/user/login.data" method="post" role="form" data-toggle="validator" style="margin: auto; position: relative; top: 30%; width: 240px;">
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
	<c:import url="/foot.page"></c:import>
</body>
</html>