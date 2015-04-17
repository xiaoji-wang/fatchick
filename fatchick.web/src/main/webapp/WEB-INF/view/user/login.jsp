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
<link rel="stylesheet" href="<%=path%>/css/pure-release-0.6.0/pure-min.css"/>
<link rel="stylesheet" href="<%=path%>/css/fatchick.css"/>
<script src="<%=path%>/js/jquery-2.1.3.min.js"></script>
<title>进入</title>
</head>
<body style="height:100%;">
	<form action="<%=path%>/user/login.data" method="post" class="pure-form pure-form-aligned" style="margin: auto;position:absolute;top: -20%;bottom: 0;left: 0;right: 0;width: 240px;height: 150px;">
		<fieldset>
			<div class="pure-control-group">
				 <input name="code" type="text" style="width: 100%;" placeholder="账号" required>
			</div>
			<div class="pure-control-group">
				 <input name="password" type="password" style="width: 100%;" placeholder="密码" required>
			</div>
			<div class="pure-control-group" style="text-align: center;">
				<button type="submit" class="pure-button pure-button-primary">进入</button>
			</div>
		</fieldset>
	</form>
	<div class="icp"'>
		<c:import url="/foot.page"></c:import>
	</div>
</body>
</html>