<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap Core CSS -->
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/simple-sidebar.css" rel="stylesheet" />

<!-- jQuery -->
<script src="<%=path%>/js/jquery-2.1.3.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=path%>/js/bootstrap.min.js"></script>


<title>${user.nickName}&nbsp;-&nbsp;主页</title>
</head>
<body>
	<!--<c:import url="/head.page"></c:import>
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
							<td>
								<a href="${item}" target="_blank">
									<img src="<%=path%>/images/icon.png" style="width: 16px;height: 16px;"/>
									<span style="vertical-align:middle;">${item.title}</span>
								</a>
							</td>
							<td style="width: 40px;">
								<a style="display: none;" class="setting_button" href="javascript:void(0);" data-toggle="modal" data-target="#page_dialog" data-page_id="${item.id}"> 
									<span class="glyphicon glyphicon-cog" aria-hidden="true" style="width: 100%; height: 100%;"></span>
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<c:import url="/foot.page"></c:import>-->
	<!-- dialog -->
	<!-- 	<div id="page_dialog" class="modal fade">
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
	</div>-->

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#" style="padding-top: 8px;"> <img style="width: 48px; height: 48px; border-radius: 24px;" src="<%=path%>/picture?path=${user.id}&name=head.png" /> <span>wxjivm@163.com</span>
				</a></li>
				<li><a href="<%=path%>">首页</a></li>
				<li><a href="#">记事本</a></li>
				<li><a href="#">网址</a></li>
				<li><a href="#">Events</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="<%=path%>/user/logout.data">退出</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Simple Sidebar</h1>
						<p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>
						<p>
							Make sure to keep all page content within the
							<code>#page-content-wrapper</code>
							.
						</p>
						<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->



	<!-- Menu Toggle Script -->


	<script type="text/javascript">
		$(function() {
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
			/*$('#page_dialog').on('show.bs.modal', function(e) {
				var a = $(e.relatedTarget);
				var pageId = a.data('page_id');
				var title = $("#" + pageId).find("a").eq(0).text();
				var url = $("#" + pageId).find("a").eq(0).attr('href');
				$(this).find(".form-control[name='title']").val(title);
				$(this).find(".form-control[name='url']").text(url);
			})*/
		});
	</script>
</body>
</html>