<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height:100%">
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user.nickName}&nbsp;-&nbsp;主页</title>
</head>
<body style="height: 100%; padding-top: 50px;padding-bottom: 40px;">
	<c:import url="/head.page"></c:import>
	<div style="height: 100%;width: 100%;">
		<div style="width: 20%; height: 100%; border: 1px solid #ddd;float: left;"></div>
		<div style="border: 1px solid #ddd;  width: 80%;height: 100%;float: left;overflow-x: auto;">
			<table class="table table-hover" style="margin: 0px;">
				<tr style="background-color: #d0d0d0;">
					<th colspan="2">网址书签</th>
				</tr>
				<c:forEach items="${pages}" var="item">
					<tr onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" id="${item.id}">
						<td><a href="${item}" target="_blank">${item.title}</a></td>
						<td style="width: 40px;"><a href="javascript:$('#page_dialog').modal('show')" class="setting_button" style="display: none;"> <span class="glyphicon glyphicon-cog" aria-hidden="true" style="width: 100%; height: 100%;"></span>
						</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- <div class="content">
		<table class="ui table">
			<thead>
				<tr>
					<th colspan="2">网址收藏</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pages}" var="item">
					<tr>
						<td><a href="${item}" target="_blank">${item.title}</a></td>
						<td style="text-align: center;">${item.id}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2"><div class="ui right labeled input">
							<input type="text" placeholder="Placeholder..." /> <a class="ui label"> Label </a>
						</div></td>
				</tr>
			</tbody>
		</table>
	
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
	</div> -->
	<c:import url="/foot.page"></c:import>
	<!-- dialog -->
	<div id="page_dialog" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="form-group">
						<input name="title" class="form-control" type="text" required />
					</div>
					<div class="form-group">
						<input name="password" class="form-control" type="password" placeholder="密码" required data-minlength="1" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>