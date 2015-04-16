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
<link href="<%=path%>/css/default.css" rel="stylesheet" type="text/css" />
<style type="text/css">
a {
	color: blue;
	text-decoration: none;
	border: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
</style>
<title>进入</title>
</head>
<body style="height: 100%;">
	<div style="height: 100%;width: 1000px;margin: auto;">
		<form action="<%=path%>/user/login.data" method="post" style="position: relative;top: 35%;">
			<table border="0" style="margin-left: auto; margin-right: auto; width: auto;">
				<tr>
					<td style="text-align: right;">账号：</td>
					<td><input style="width: 245px;" name="code" type="text" /></td>
				</tr>
				<tr>
					<td style="text-align: right;">密码：</td>
					<td><input style="width: 245px;" type="password" name="password" /></td>
				</tr>
				<tr style="font-size: 15px; color: red;">
					<td></td>
					<td>${error}</td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;"><input type="submit" value="进入" /> <a style="font-size: 15px; position: absolute; margin: 6px 10px;" href="<%=path%>/user/register.page">没有帐号？</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="icp"'>
		<c:import url="/foot.page"></c:import>
	</div>
</body>
</html>