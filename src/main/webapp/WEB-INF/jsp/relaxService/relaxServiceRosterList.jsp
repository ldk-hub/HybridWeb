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
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9f62d9b2cb6f39cf29cf2b959862c8eb"></script>
	<script type="text/javascript">
		function movePaging(pageNo) {
			document.frm.pageIndex.value = pageNo;
			document.frm.searchBox.value = document.form1.searchBox.value;
			document.frm.searchCategory.value = document.form1.searchCategory.value;
			document.frm.action = "<c:url value='/relaxService/getRelaxServiceRosterList.do'/>";
			document.frm.submit();
		}
	</script>
	
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
						href="${pageContext.request.contextPath}/relaxService/Main.do">Home</a></li>
						<li><a
						href="${pageContext.request.contextPath}/relaxService/getRelaxServiceRosterList.do">Board</a></li>
						<li><a
						href="${pageContext.request.contextPath}/relaxService/Introduce.do">Introduce</a></li>
					</ul>
				<ul class="nav navbar-nav navbar-right">
					<sec:authorize ifAnyGranted="ROLE_USER">
						<li><a href="#"><span class="glyphicon glyphicon-user"> ${user.name }</a></li>
						<li><a href="/MobileVote/login/login.do"><span class="glyphicon glyphicon-log-in"> Logout</a></li>
					</sec:authorize>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
	<div class="container">
	<!-- 게시판 조회 -->
	<div class="login-box well">
		<div class="page-header">
			<h1>
				<small>게시판 조회</small>
			</h1>
		</div>

		<form class="form-inline" name="form1">
			<div class="form-group">
				<select name="searchCategory" id="searchCategory"
					class="form-control">
					<option value='name'>제목</option>
					<option value='bthday'>작성자</option>
				</select>
			</div>
			<div class="form-group">
				<input name="searchBox" id="searchBox" itemname="검색어"
					class="form-control">
			</div>
			<div class="form-group">
				<button class="btn btn-warning" id="searchBtn">검색</button>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th>순번</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${result}" var="list">
					<tr>
						<th scope="row">${list.rnum }</th>
						<td><a href="#" data-toggle="modal" data-target="#modalPop"
							data-aplcmgmtno="${list.title }">${list.title }</a></td>
						<td><a href="#" data-toggle="modal" data-target="#modalPop"
							data-aplcmgmtno="${list.usr }">${list.usr }</a></td>
						<td><a href="#" data-toggle="modal" data-target="#modalPop"
							data-aplcmgmtno="${list.aplcMgmtNo }">${list.intDate }</a></td>
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
				<!-- 버튼 -->
				<div class="form-group"  style="display: right-block;text-align: center;">
				<button type="button" class="btn btn-warning btn-lg"
					data-toggle="modal" data-target="#myModal">글쓰기</button>
					</div>
				<!-- 모달 팝업 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">게시글 쓰기</h4>
								</div>
									<table class="table">
										<tr>
											<th>글제목</th>
											<td colspan="3"><span id="addr"></span></td>
										</tr>
									</table>
								<textarea id="contents" name="contents"></textarea>
									<script type="text/javascript">
										CKEDITOR.replace( 'contents',{
										customConfig : '/ckeditor/config.js',
										width: '99%',
										height: 250
										});
									</script>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning">저장</button>
								<button type="button" class="btn btn-warning"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
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
							<th>작성자</th>
							<td><span id="usr"></span></td>
							<th>작성일</th>
							<td><span id="intDate"></span></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><span id="email"></span></td>
							<th>조회수</th>
							<td><span id="usrCnt"></span></td>
						</tr>
						<tr>
							<th>글제목</th>
							<td colspan="3"><span id="title"></span></td>
						</tr>
						<tr>
							<th>글내용</th>
							<td colspan="3"><span id="content"></span></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">수정</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">삭제</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
					<!-- <button type="button" class="btn btn-primary" id="eventComplete">행사완료</button> -->
				</div>
			</div>
		</div>
	
	
	<form name="frm" method="post">
		<input type="hidden" name="pageIndex" /> <input type="hidden"
			name="searchBox" /> <input type="hidden" name="searchCategory" />
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
		<script>
			$('.carousel').carousel({
				interval: 5000
			})
		</script>
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