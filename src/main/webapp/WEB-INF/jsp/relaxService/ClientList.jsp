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


<script type="text/javascript">
	function movePaging(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/relaxService/ClientList.do'/>";
		document.frm.submit();
	}
</script>
<!-- 엑셀 다운로드  xlsx 로딩바 포함 -->
<script type="text/javascript">
		$(function() {
			$("#btn-excel").on("click", function() {
				var $preparingFileModal = $("#preparing-file-modal");
				$preparingFileModal.dialog({
					modal : true
				});
				$("#progressbar").progressbar({
					value : false
				});
				// 다운로드 경로 수정
				$.fileDownload("/pentode/excel.do", {
					successCallback : function(url) {
						$preparingFileModal.dialog('close');
					},
					failCallback : function(responseHtml, url) {
						$preparingFileModal.dialog('close');
						$("#error-modal").dialog({
							modal : true
						});
					}
				});
				// 버튼의 원래 클릭 이벤트를 중지 시키기 위해 필요
				return false;
			});
		});
	</script>

<title>Hybrid Web</title>
</head>
<body>
	<div class="brand">Hybrid Web</div>
	<div class="contentwrap">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Hybrid Web</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					<li><a
						href="${pageContext.request.contextPath}/relaxService/Main.do">Home</a></li>
					<li><a
						href="${pageContext.request.contextPath}/relaxService/getRelaxServiceRosterList.do">Board</a></li>
					<li><a
						href="${pageContext.request.contextPath}/relaxService/Introduce.do">Introduce</a></li>
					<li><a
						href="${pageContext.request.contextPath}/relaxService/ClientList.do">ClientList</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<sec:authorize ifAnyGranted="ROLE_USER">
						<li><a href="#">
						<span class="glyphicon glyphicon-user">${user.name }</a></li>
						<li><a href="LDK/login/logoutProcess.do">
						<span class="glyphicon glyphicon-log-in"> Logout</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	
	<form name="frm" method="post">
			<input type="hidden" name="pageIndex" /> 
	</form>
	
	<div class="container">
		<!-- 게시판 조회 -->
		<div class="login-box well">
			<div class="page-header">
				<h1>
					<small>회원정보</small>
				</h1>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>순번</th>
						<th>회원명</th>
						<th>아이디</th>
						<th>가입날짜</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${result}" var="list2">
						<tr>
							<th scope="row">${list2.certNo }</th>
							<th scope="row">${list2.name }</th>
							<th scope="row">${list2.username }</th>
							<th scope="row">${list2.fstdate }</th>
							<th scope="row">${list2.email }</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="form-group"
				style="display: center-block; text-align: center;">
				<ul class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="custom"
						jsFunction="movePaging" />
				</ul>
			</div>
			</div>
			</div>
	

			<button id="btn-excel">엑셀 다운로드</button>
			<!-- 파일 생성중 보여질 진행막대를 포함하고 있는 다이얼로그  -->
			<div title="Data Download" id="preparing-file-modal"
				style="display: none;">
				<div id="progressbar"
					style="width: 100%; height: 22px; margin-top: 20px;"></div>
			</div>
			
			<!-- 에러발생시 보여질 메세지 다이얼로그  -->
			<div title="Error" id="error-modal" style="display: none;">
				<p>생성실패.</p>
			</div>

			<!-- 버튼-->
			<div class="form-group"
				style="display: right-block; text-align: center;">
				<button type="button" class="btn btn-warning btn-lg"
					data-toggle="modal" data-target="#">엑셀 다운로드</button>
			</div> 

		<!-- 풋터 -->
		<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<p>Copyright © Website 2017</p>
					</div>
				</div>
			</div>
		</footer>
	</body>
</html>