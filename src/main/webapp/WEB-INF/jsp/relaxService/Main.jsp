<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<sec:authentication var="user" property="principal" />
<c:if test="${param.error == '1'}">
	<c:set var="msg" value="아이디 또는 비밀번호가 틀렸습니다."></c:set>
</c:if>
<c:if test="${param.error == '999'}">
	<c:set var="msg" value="관리자에게 문의하시기 바랍니다."></c:set>
</c:if>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "" && msg != null) {
		alert(msg);
	}
	
</script>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="../css/title.css">
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<title>LDK 시스템</title>
</head>
<body  style="background-color:#FFCC66">
	<div class="contentwrap">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="#"><img src ="../image/logo.png" width="150" height="50"/></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="navbar-collapse collapse" id="navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">메뉴<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/relaxService/getRelaxServiceRosterList.do">게시판</a></li>
								<li><a
								href="${pageContext.request.contextPath}/relaxService/SecondPage.do">만든이</a></li>
								<li><a
								href="${pageContext.request.contextPath}/relaxService/SecondPage.do">계산기</a></li>
						</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<sec:authorize ifAnyGranted="ROLE_USER">
							<li><a href="#"> ${user.name }님이 로그인하셨습니다.</a></li>
							<li><a href="/login/logoutProcess.do">Logout</a></li>
						</sec:authorize>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
    
	<div class="container">
		<form accept-charset="UTF-8" role="form" method="post"
			action="${pageContext.request.contextPath}/login/loginProcess.do">
			<div class="row">
				<div class="page-header">
					<h2>메인 페이지</h2>
				</div>
				<div class="login-box well">
				</div>

			</div>
			<div class="form-group">
				<input type="submit"
					class="btn btn-default btn-login-submit btn-block m-t-md"
					value="이동" />
			</div>
		</form>
	</div>
</body>
</html>