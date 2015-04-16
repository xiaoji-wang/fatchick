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
<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
<title>${user.nickName}&nbsp;-&nbsp;设置</title>
</head>
<body>
	<c:import url="/head.page"></c:import>
	<div class="content">
		<div style="border: 1px solid #ccc; padding: 5px">
			<img style="width: 96px; height: 96px;" src="<%=path%>/picture?path=${user.id}&name=head.png" /> 
		</div>
	</div>
</body>
</html>