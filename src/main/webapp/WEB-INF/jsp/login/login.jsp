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
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/business-casual.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	
	
<title>Diet System</title>
</head>
<body>
<div class="brand">Diet System</div>
	<div class="contentwrap">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			<a class="navbar-brand" href="#">Diet System</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar-collapse collapse" id="navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left">
						<li><a
						href="${pageContext.request.contextPath}/relaxService/getRelaxServiceRosterList.do">Board</a></li>
						<li><a
						href="${pageContext.request.contextPath}/relaxService/Main.do">Introduce</a></li>
					</ul>
					</ul>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
    
	<div class="container">
		<form accept-charset="UTF-8" role="form" method="post"
			action="${pageContext.request.contextPath}/login/loginProcess.do">
			<div class="row">
				
				<div class="box">
				<div class="page-header">
					<h2>LOGIN</h2>
				</div>
					<div class="form-group">
						<label for="username">아이디</label> <input name="username" value=''
							id="username" placeholder="id" type="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">패스워드</label> <input name="password"
							id="password" value='' placeholder="Password" type="password"
							class="form-control" />
					</div>
					<div class="form-group">
						<input type="submit"
							class="btn btn-warning btn-login-submit btn-block m-t-md"
							value="로그인" />
					</div>
				</div>
			</div>
			<!-- 버튼 -->
				<div class="form-group"  style="display: right-block;text-align: center;">
				<button type="button" class="btn btn-warning btn-lg"
					data-toggle="modal" data-target="#Modal">회원가입</button>
					</div>
				<!-- 모달 팝업 -->
				<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">회원가입</h4>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning">저장</button>
								<button type="button" class="btn btn-warning"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			
	</form>
	</div>
	<!-- 풋터 -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
				<p>Copyright © Website 2017 </p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>