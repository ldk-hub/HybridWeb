<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<sec:authentication var="user" property="principal" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/bootstrap/css/business-casual.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=9f62d9b2cb6f39cf29cf2b959862c8eb"></script>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	function movePaging(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.searchBox.value = document.form1.searchBox.value;
		document.frm.searchCategory.value = document.form1.searchCategory.value;
		document.frm.action = "<c:url value='/relaxService/getRelaxServiceRosterList.do'/>";
		document.frm.submit();
	}
</script>

<title>INTRODUCE System</title>
</head>
<body>
	<div class="brand">INTRODUCE System</div>
	<div class="contentwrap">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">INTRODUCE System</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar-collapse collapse" id="navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					<li><a
						href="${pageContext.request.contextPath}/relaxService/Main.do">Home</a></li>
					<li><a
						href="${pageContext.request.contextPath}/relaxService/getRelaxServiceRosterList.do">Board</a></li>
					<li><a
						href="${pageContext.request.contextPath}/relaxService/Introduce.do">Introduce</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<sec:authorize ifAnyGranted="ROLE_USER">
						<li><a href="#"><span class="glyphicon glyphicon-user">
									${user.name }</a></li>
						<li><a href="/MobileVote/login/login.do"><span
								class="glyphicon glyphicon-log-in"> Logout</a></li>
					</sec:authorize>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
	<div class="container">
		<!-- 슬라이드 박스 -->
		<div class="box">
			<div class="col-lg-12 text-center">
				<div id="carousel-example-generic" class="carousel slide">
					<ol class="carousel-indicators hidden-xs">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- 슬라이드 이미지 삽입 -->
					<div class="carousel-inner">
						<div class="item active">
							<a
								href="${pageContext.request.contextPath}/relaxService/getRelaxServiceRosterList.do">
								<img class="img-reponsive img-full" src="../image/slide-1.jpg"
								alt="Coffe">
								<div class="carousel-caption">
									<h2>Board Page</h2>
								</div>
							</a>
						</div>
						<div class="item">
							<a
								href="${pageContext.request.contextPath}/relaxService/Introduce.do">
								<img class="img-reponsive img-full" src="../image/slide-3.jpg"
								alt="Brunch">
								<div class="carousel-caption">
									<h2>Introduce</h2>
								</div>
							</a>
						</div>
						<div class="item">
							<img class="img-reponsive img-full" src="../image/slide-2.jpg"
								alt="I-PAD">
							<div class="carousel-caption">
								<h2>Hello?</h2>
							</div>
						</div>
						<!-- 슬라이드 컨트롤 -->
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="icon-prev"></span></a> <a
							class="right carousel-control" href="#carousel-example-generic"
							data-slide="next"> <span class="icon-next"></span></a>
					</div>
				</div>
				<h2 class="brand-before">
					<small>Welcome to</small>
				</h2>
				<h1 class="brand-name">Portfolio Site</h1>
			</div>
		</div>
	</div>
		<!-- 풋터 -->
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<p>Copyright © Website 2017</p>
					</div>
				</div>
			</div>
		</footer>
			<script>
				$('.carousel').carousel({
					interval : 5000
				})
			</script>
	</body>
</html>