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
<body style="height: 100%; padding-top: 50px; padding-bottom: 40px;">
	<c:import url="/head.page"></c:import>
	<div style="height: 100%; width: 100%;">
		<div style="width: 20%; height: 100%; border: 1px solid #ddd; float: left;"></div>
		<div style="border: 1px solid #ddd; width: 80%; height: 100%; float: left;padding-bottom: 34px;">
			<div class="input-group">
				<span class="input-group-addon" id="sizing-addon1">网址书签</span> <input id="website" class="form-control" type="text" placeholder="http://" />
				<div class="input-group-btn">
					<button class="btn btn-default" type="button" onclick="addWebsite();">添加</button>
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span>分类</span> <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" style="min-width: 0px;">
						<li><a href="javascript:categateDropdown(0);">全部分类</a></li>
						<li><a href="javascript:categateDropdown(1);">1</a></li>
					</ul>
				</div>
			</div>
			<div style="overflow-x: auto; height: 100%;">
				<table class="table table-hover table-striped" style="margin: 0px;">
					<c:forEach items="${pages}" var="item" varStatus="status">
						<tr onmouseover="onMouseOver(this);" onmouseout="onMouseOut(this);" id="${item.id}">
							<td style="width: 15px;border-right: 1px solid #ddd;">${status.index+1}</td>
							<td><a href="${item}" target="_blank">${item.title}</a></td>
							<td style="width: 40px;"><a style="display: none;" class="setting_button" href="javascript:void(0);" data-toggle="modal" data-target="#page_dialog" data-page_id="${item.id}"> <span class="glyphicon glyphicon-cog" aria-hidden="true" style="width: 100%; height: 100%;"></span>
							</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
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
						<div name="url" class="form-control" contentEditable="true" style="height: 180px; overflow-x: auto;" disabled></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#page_dialog').on('show.bs.modal', function(e) {
				var a = $(e.relatedTarget);
				var pageId = a.data('page_id');
				var title = $("#" + pageId).find("a").eq(0).text();
				var url = $("#" + pageId).find("a").eq(0).attr('href');
				$(this).find(".form-control[name='title']").val(title);
				$(this).find(".form-control[name='url']").text(url);
			})
		});
	</script>
</body>
</html>