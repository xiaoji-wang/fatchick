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
<title>${user.nickName}&nbsp;-&nbsp;主页</title>
</head>
<body style="height: 100%;">
	<c:import url="/head.page"></c:import>
	<div class="content">
		<div style="width: 800px;padding: 3px 8px;">
			<c:forEach items="${pages}" var="item">
				<div id="page_${item.id}" style="padding: 8px 3px; border-bottom: dashed 1px #a0a0a0;" onmouseover="onMouseOver(this)" onmouseout="onMouseOut(this)">
					<a href="${item}" target="_blank">${item.title}</a>
					<button class="button-xsmall pure-button" style="float: right;display: none;">
						<i class="fa fa-cog fa-lg"></i>
					</button>
					<button class="button-xsmall pure-button" style="float: right;display: none;" onclick="removeWebsite(${item.id});">
						<i class="fa fa-minus fa-lg"></i>
					</button>
				</div>
			</c:forEach>
			<div class="website" style="padding: 5px; border-bottom: dashed 1px #a0a0a0;">
				<input id="website" type="text" style="width: 750px; border: none;" placeholder="http://" />
				<button class="button-xsmall pure-button" style="float: right;" onclick="addWebsite();">
					<i class="fa fa-plus fa-lg"></i>
				</button>
			</div>
		</div>
	</div>
	<c:import url="/foot.page"></c:import>
</body>
</html>