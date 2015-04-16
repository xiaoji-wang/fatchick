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
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/main.js"></script>
<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
<title>${user.nickName}&nbsp;-&nbsp;主页</title>
</head>
<body style="height: 100%;">
	<c:import url="/head.page"></c:import>
	<div class="content">
		<div style="border-bottom: solid #6699cc;">
			<span style="background-color: #6699cc; color: white; padding: 2px 6px;">常用网址</span>
		</div>
		<ul>
			<c:forEach items="${pages}" var="item">
				<li class="li_style2">
					<!-- <img id="a" src="<%=path%>/images/triangle.png"  onclick="expand('a')" class="img"/> -->
					<a href="${item}" target="_blank">${item.title}</a>
				</li>
			</c:forEach>			
			<li class="li_style2">
				<img class="img" src="<%=path%>/images/null.png"/>
				<input id="website" type="text" style="width: 900px;padding: 7px 3px;" placeholder="http://"/>
				<input type="button" style="width: 50px;" value="+" onclick="addWebsite();"/>
			</li>
		</ul>
	</div>
	<c:import url="/foot.page"></c:import>
</body>
</html>