<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Index</title>

<!-- Bootstrap Core CSS -->
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=path%>/css/scrolling-nav.css" rel="stylesheet">
<!-- jQuery -->
<script src="<%=path%>/js/jquery-2.1.3.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=path%>/js/bootstrap.min.js"></script>

<!-- Scrolling Nav JavaScript -->
<script src="<%=path%>/js/jquery.easing.min.js"></script>
<script src="<%=path%>/js/scrolling-nav.js"></script>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top">Start Bootstrap</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
				<li class="hidden"><a class="page-scroll" href="#page-top"></a></li>
				<li><a class="page-scroll" href="#about">About</a></li>
				<li><a class="page-scroll" href="#services">Services</a></li>
				<li><a class="page-scroll" href="#contact">Contact</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%= path%>/user/main.page">wxjivm@163.com</a></li>
				<li><a href="<%= path%>/user/login.page">Login</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Intro Section -->
	<section id="intro" class="intro-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Scrolling Nav</h1>
				<p>
					<strong>Usage Instructions:</strong> Make sure to include the
					<code>scrolling-nav.js</code>
					,
					<code>jquery.easing.min.js</code>
					, and
					<code>scrolling-nav.css</code>
					files. To make a link smooth scroll to another section on the page, give the link the
					<code>.page-scroll</code>
					class and set the link target to a corresponding ID on the page.
				</p>
				<a class="btn btn-default page-scroll" href="#about">Click Me to Scroll Down!</a>
			</div>
		</div>
	</div>
	</section>

	<!-- About Section -->
	<section id="about" class="about-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>About Section</h1>
			</div>
		</div>
	</div>
	</section>

	<!-- Services Section -->
	<section id="services" class="services-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Services Section</h1>
			</div>
		</div>
	</div>
	</section>

	<!-- Contact Section -->
	<section id="contact" class="contact-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Contact Section</h1>
			</div>
		</div>
	</div>
	</section>

</body>

</html>