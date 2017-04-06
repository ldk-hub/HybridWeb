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
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function movePaging(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.searchBox.value = document.form1.searchBox.value;
		document.frm.searchCategory.value = document.form1.searchCategory.value;
		document.frm.action = "<c:url value='/relaxService/getRelaxServiceRosterList.do'/>";
		document.frm.submit();
	}
</script>
<title>LDK 시스템</title>
</head>
<body>
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
				<a class="navbar-brand" href="#">LDK시스템</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar-collapse collapse" id="navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">메뉴<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/relaxService/getRelaxServiceRosterList.do">게시판 조회</a></li>
								<li><a
								href="${pageContext.request.contextPath}/relaxService/SecondPage.do">만든이</a></li>
								<li><a
								href="${pageContext.request.contextPath}/relaxService/SecondPage.do">사이트소개</a></li>
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
		<!-- /.container-fluid --> </nav>
	</div>
	<div class="container">
		<div class="page-header">
			<h1>
				<small>게시판 조회</small>
			</h1>
		</div>

		<form class="form-inline" name="form1">
			<div class="form-group">
				<select name="searchCategory" id="searchCategory"
					class="form-control">
					<option value='name'>이름</option>
					<option value='bthday'>생년월일</option>
				</select>
			</div>
			<div class="form-group">
				<input name="searchBox" id="searchBox" itemname="검색어"
					class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-primary" id="searchBtn">검색</button>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th>순번</th>
					<th>회원번호</th>
					<th>이름</th>
					<th>생년월일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${result}" var="list">
					<tr>
						<th scope="row">${list.rnum }</th>
						<td><a href="#" data-toggle="modal" data-target="#modalPop"
							data-aplcmgmtno="${list.aplcMgmtNo }">${list.cnsmContNo }</a></td>
						<td><a href="#" data-toggle="modal" data-target="#modalPop"
							data-aplcmgmtno="${list.aplcMgmtNo }">${list.aplcPsnNm }</a></td>
						<td><a href="#" data-toggle="modal" data-target="#modalPop"
							data-aplcmgmtno="${list.aplcMgmtNo }">${list.bthDay }</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
		<div class="form-group"  style="display: center-block;text-align: center;">
		<ul class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="custom"
				jsFunction="movePaging"  />
		</ul>
		</div>
		</nav>
	</div>
			<div class="form-group"  style="display: center-block;text-align: center;">
				<button class="btn btn-primary" id="searchBtn">글쓰기</button>
			</div>

	<!-- Modal -->
	<div class="modal fade" id="modalPop" tabindex="-1" role="dialog"
		aria-labelledby="modalPopLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalPopLabel">게시판 정보</h4>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th>회원번호</th>
							<td><span id="cnsmContNo"></span></td>
							<th>접수번호</th>
							<td><span id="aplcMgmtNo"></span></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><span id="aplcPsnNm"></span></td>
							<th>생년월일</th>
							<td><span id="bthDay"></span></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><span id="aplcPsnTel"></span></td>
							<th>계약금액</th>
							<td><span id="insuContAmt"></span></td>
						</tr>
						<tr>
							<th>선택상품</th>
							<td><span id="serviceGood"></span></td>
							<th>보상금액</th>
							<td><span id="factCmpnAmt"></span></td>
						</tr>
						<tr>
							<th>행사상태</th>
							<td><span id="aplcProcStNm"></span></td>
							<th>가입일</th>
							<td><span id="payDt"></span></td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3"><span id="addr"></span></td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3"><span id="etc"></span></td>
						</tr>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<!-- <button type="button" class="btn btn-primary" id="eventComplete">행사완료</button> -->
				</div>
			</div>
		</div>
	</div>
	<form name="frm" method="post">
		<input type="hidden" name="pageIndex" /> <input type="hidden"
			name="searchBox" /> <input type="hidden" name="searchCategory" />
	</form>
</body>
</html>
<script type="text/javascript">
	$('#modalPop')
			.on(
					'show.bs.modal',
					function(event) {
						var button = $(event.relatedTarget) // Button that triggered the modal
						var aplcMgmtNo = button.data('aplcmgmtno'); // Extract info from data-* attributes
						var modal = $(this);
						// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
						// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
						//callAjax(form, url, target, type, returnType, data, contentType, jsonpCallback, processData, crossDomain, async);
						var param = new Object();
						param.aplcMgmtNo = aplcMgmtNo;

						/* var result = callAjax(
								null,
								'${pageContext.request.contextPath}/relaxService/relaxServiceDetail.do',
								null, 'post', 'json', param);
						result.done(function(data) {
							var modal = $(this)
							modal.find('.modal-title').text(
									'New message to ' + data.aplcMgmtNo);
							modal.find('.modal-body input').val(aplcMgmtNo);
						}); */

						$
								.ajax({
									url : '${pageContext.request.contextPath}/relaxService/relaxServiceDetail.do',
									data : param,
									dataType : 'json',
									type : 'POST',
									success : function(data) {
										modal.find('#cnsmContNo').text(
												defaultString(data.cnsmContNo));
										modal.find('#aplcMgmtNo').text(
												defaultString(data.aplcMgmtNo));
										modal.find('#aplcPsnNm').text(
												defaultString(data.aplcPsnNm));
										modal.find('#bthDay').text(
												defaultString(data.bthDay));
										modal.find('#aplcPsnTel').text(
												defaultString(data.aplcPsnTel));
										modal
												.find('#insuContAmt')
												.text(
														defaultString(data.insuContAmt));
										modal
												.find('#serviceGood')
												.text(
														defaultString(data.serviceGood));
										modal
												.find('#aplcProcStNm')
												.text(
														defaultString(data.aplcProcStNm));
										modal
												.find('#factCmpnAmt')
												.text(
														defaultString(data.factCmpnAmt));
										modal.find('#addr').text(
												defaultString(data.addr));
										modal.find('#payDt').text(
												defaultString(data.payDt));
										modal.find('#etc').text(
												defaultString(data.etc));
									},
									error : function(data) {
										alert("오류입니다.")
									}
								});
					});
	$('#eventComplete')
			.on(
					'click',
					function(event) {
						var aplcMgmtNo = $("#aplcMgmtNo").text();
						var param = new Object();
						var pageIndex = "${param.pageIndex}";
						param.aplcMgmtNo = aplcMgmtNo;
						$
								.ajax({
									url : '${pageContext.request.contextPath}/relaxService/updateAplcProcSt.do',
									data : param,
									dataType : 'json',
									type : 'POST',
									success : function(data) {
										if (data > 0) {
											alert("게시판처리가 완료 되었습니다.");
											movePaging(pageIndex);
										} else if (data == 0) {
											alert("게시판처리가 완료, 정산완료되었습니다.");
											movePaging(pageIndex);
										}
									},
									error : function(data) {
										alert("오류입니다.")
									}
								});
					});

	$('#searchBtn').on('click', function(event) {
		movePaging("${param.pageIndex}");
	});

	function defaultString(str) {
		if (str == null || str == "") {
			return "";
		} else {
			return str;
		}
	}
</script>