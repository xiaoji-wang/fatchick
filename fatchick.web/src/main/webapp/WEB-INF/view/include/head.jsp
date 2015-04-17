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
<link rel="stylesheet" href="<%=path%>/css/pure-release-0.6.0/pure-min.css"/>
<link rel="stylesheet" href="<%=path%>/css/font-awesome-4.3.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="<%=path%>/css/fatchick.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/fatchick.js"></script>
<script type="text/javascript">
	var path='<%=path%>';
</script>
</head>
<body>
	<div style="height:64px;margin-bottom: 2px;"></div>
	<div style="background-color:#6699cc; height:64px;position: fixed;width: 100%;top: 0px;">
		<div style="width: 1000px;margin-left: auto;margin-right: auto;">
			<ul class="menu">
				<li>
					<a href="<%=path%>/user/setting.page">
						<img class="head_image" src="<%=path%>/picture?path=${user.id}&name=head.png">	
					</a>
				</li>
				<!-- <li style="margin-left: 5px;">
					<form class="search" action="http://www.baidu.com/baidu" target="_blank">
						<input name="tn" type="hidden" value="baidu" />
						<input style="width: 400px;" type="text" name="word" placeholder="百度一下" />
						<a href="javascript:find()" style="position: relative; top: 11px; left: -41px;border: none;">
							<img src="<%=path%>/images/search.png"/>
						</a>	
					</form>
				</li> -->
				<li class="item" onmouseover="selectItem(this);" onmouseout="initItemSelect();">
					<a href="javascript:logout()">退出</a>
					<form class="logout" action="<%=path%>/user/logout.data"></form>
				</li>
				<!--
				<li class="item" onmouseover="selectItem(this);" onmouseout="initItemSelect();">
					<a href="#">笔记</a>
				</li>
				<li class="item" onmouseover="selectItem(this);" onmouseout="initItemSelect();">
					<a href="#">资源</a>
				</li> 
				<li class="item" onmouseover="selectItem(this);" onmouseout="initItemSelect();">
					<a href="<%=path%>/user/main.page">网站</a> 
				</li>
				-->
			</ul>
		</div>
	</div>
</body>
</html>