<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<!-- 시큐리티 로그인 에러 리턴 메세지 조건1 -->
<sec:authentication var="user" property="principal" />
	<c:if test="${param.error == '1'}">
		<c:set var="msg" value="아이디 또는 비밀번호가 틀렸습니다."></c:set>
	</c:if>
	<c:if test="${param.error == '999'}">
		<c:set var="msg" value="관리자에게 문의하시기 바랍니다."></c:set>
	</c:if>
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
<!-- 시큐리티 로그인 에러 리턴 메세지 조건2 -->	
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "" && msg != null) {
		alert(msg);
	}
</script>

<!-- 회원가입  keyup 이벤트 -->
<script type="text/javascript">
		jQuery( function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행
			// 정규식을 변수에 할당
			// 정규식을 직접 작성할 줄 알면 참 좋겠지만
			// 변수 우측에 할당된 정규식은 검색하면 쉽게 찾을 수 있다 
			// 이 변수들의 활약상을 기대한다
			// 변수 이름을 're_'로 정한것은 'Reguar Expression'의 머릿글자
			var re_id = /^[a-z0-9_-]{3,16}$/; // 아이디 검사식
			var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
			var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
			
			// 선택할 요소를 변수에 할당
			// 변수에 할당하지 않으면 매번 HTML 요소를 선택해야 하기 때문에 귀찮고 성능에도 좋지 않다
			// 쉼표를 이용해서 여러 변수를 한 번에 선언할 수 있다
			// 보기 좋으라고 쉼표 단위로 줄을 바꿨다 
			var 
				uid = $('#uid'), 
				upw = $('#upw'), 
				mail = $('#mail');
			
			// #uid, #upw 인풋에 입력된 값의 길이가 적당한지 알려주려고 한다
			// #uid, #upw 다음 순서에 경고 텍스트 출력을 위한 빈 strong 요소를 추가한다
			// 무턱대고 자바스크립트를 이용해서 HTML 삽입하는 것은 좋지 않은 버릇
			// 그러나 이 경우는 strong 요소가 없어도 누구나 form 핵심 기능을 이용할 수 있으니까 문제 없다
			$('#uid, #upw').after('<strong></strong>');
			
			// #uid 인풋에서 onkeyup 이벤트가 발생하면
			uid.keyup( function() {
				var s = $(this).next('strong'); // strong 요소를 변수에 할당
				if (uid.val().length == 0) { // 입력 값이 없을 때
					s.text(''); // strong 요소에 포함된 문자 지움
				} else if (uid.val().length < 3) { // 입력 값이 3보다 작을 때
					s.text('너무 짧아요.'); // strong 요소에 문자 출력
				} else if (uid.val().length > 16) { // 입력 값이 16보다 클 때
					s.text('너무 길어요.'); // strong 요소에 문자 출력
				} else if ( re_id.test(uid.val()) != true ) { // 유효하지 않은 문자 입력 시
					s.text('유효한 문자를 입력해 주세요.'); // strong 요소에 문자 출력
				} else { // 입력 값이 3 이상 16 이하일 때
					s.text('적당해요.'); // strong 요소에 문자 출력
				}
			});
			
			// #upw 인풋에서 onkeyup 이벤트가 발생하면
			upw.keyup( function() {
				var s = $(this).next('strong'); // strong 요소를 변수에 할당
				if (upw.val().length == 0) { // 입력 값이 없을 때
					s.text(''); // strong 요소에 포함된 문자 지움
				} else if (upw.val().length < 6) { // 입력 값이 6보다 작을 때
					s.text('너무 짧아요.'); // strong 요소에 문자 출력
				} else if (upw.val().length > 18) { // 입력 값이 18보다 클 때
					s.text('너무 길어요.'); // strong 요소에 문자 출력
				} else { // 입력 값이 6 이상 18 이하일 때
					s.text('적당해요.'); // strong 요소에 문자 출력
				}
			});
		});
</script>

<!-- 회원가입 정규표현식  -->
<script type="text/javascript">		
  function memberInsert(){
	  	var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
		var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
		
	var	uid = $('#uid').val(),
		name = $('#name_acc').val(),
		upw = $('#upw').val(), 
		mail = $('#mail').val();
		
		// if (사용자 입력 값이 정규식 검사에 의해 참이 아니면) {포함한 코드를 실행}
		// if 조건절 안의 '정규식.test(검사할값)' 형식은 true 또는 false를 반환한다
		// if 조건절 안의 검사 결과가 '!= true' 참이 아니면 {...} 실행
		// 사용자 입력 값이 참이 아니면 alert을 띄운다
		// 사용자 입력 값이 참이 아니면 오류가 발생한 input으로 포커스를 보낸다
		if(uid ==""){
				alert("아이디를 입력하시오.");
				uid.focus();
				return false;
			}else if(upw ==""){
				alert("패스워드를 입력하시오.");
				upw.focus();
				return false;
			}else if(name ==""){
				alert("이름을 입력하시오.");
				name.focus();
				return false;
			}else if(mail ==""){
				alert("이메일주소를 입력하시오.");
				mail.focus();
				return false;
			}
			if (re_pw.test(upw) != true) { // 비밀번호 검사
				alert('[PW 입력 오류] 유효한 PW를 입력해 주세요.');
				upw.focus();
				return false;
			} else if(re_mail.test(mail) != true) { // 이메일 검사
				alert('[Email 입력 오류] 유효한 이메일 주소를 입력해 주세요.');
				mail.focus();
				return false;
			}  
					$.ajax({
						url : '${pageContext.request.contextPath}/login/insertId.do',
						data : {
							"userId":uid,
							"name":name,
							"password":upw,
							"email":mail,
						},
						type : 'POST',
						success : function(data) {
							alert("회원가입 완료.");
							$('#Modal').modal('hide')
							return;
						},
						error : function(data) {
							alert("오류입니다.");
							$('#Modal').modal('hide')
						}
					});
  }
 </script>
<!-- 회원가입 중복체크  -->
<script type="text/javascript">	
		function idCheck(){
			var	uid = $('#uid').val()
			$.ajax({
				url : '${pageContext.request.contextPath}/login/idCheck.do',
				data : {"userId":uid},
				type : 'POST',
					success : function(data) {
						alert(data);
						if($.trim(data)== "YES"){
							alert("사용가능");
						}else{
							alert("사용불가");
							uid.focus();
							return false;
						}
					}
			});
		}
</script>

<title>Hybrid Web</title>
</head>
<body>
<div class="brand">Hybrid Web</div>
	<div class="contentwrap">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			<a class="navbar-brand" href="#">Hybrid Web</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				</div>
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
			</div>
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
							value="로그인"/>
					</div>
					<div class="form-group"  style="display: right-block;text-align: center;">
						<button type="button" class="btn btn-warning btn-lg"
							data-toggle="modal" data-target="#PassModal">비밀번호를 분실하셨나요?</button>
					</div>
				</div>
			</div>
				
				<!-- 비밀번호 분실정보 모달 -->
				<div class="modal fade" id="PassModal" tabindex="-1" role="dialog"
					aria-labelledby="ModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="ModalLabel">비밀번호 이메일 찾기</h4>
							</div>
							<div class="box">
								<div class="form-group">
									<label for="userid_acc">아이디 </label>
									<input name="userid_acc" value=''
										id="uid" placeholder="ID" type="text" class="form-control" />
								</div>
								<div class="form-group">
									<label for="email_acc">이메일</label> <input name="email_acc"
										id="mail" value='' placeholder="E-Mail" type="text"
										class="form-control" />
								</div>
								</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" OnClick="">메일 보내기</button>
								<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
							</div>
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
					aria-labelledby="ModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="ModalLabel">회원가입</h4>
							</div>
							<div class="box">
								<div class="form-group">
									<label for="userid_acc">아이디 </label>
									<button type="button" class="btn btn-warning btn-sm" OnClick="idCheck()">중복체크</button>
									<input name="userid_acc" value=''
										id="uid" placeholder="ID" type="text" class="form-control" />
								</div>
								<div class="form-group">
									<label for="password_acc">패스워드</label> <input name="password_acc"
										id="upw" value='' placeholder="Password" type="password"
										class="form-control" />
								</div>
								<div class="form-group">
									<label for="name_acc">이름</label> <input name="name_acc" value=''
										id="name_acc" placeholder="Name" type="text" class="form-control" />
								</div>
								<div class="form-group">
									<label for="email_acc">이메일</label> <input name="email_acc"
										id="mail" value='' placeholder="E-Mail" type="text"
										class="form-control" />
								</div>
								</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-warning" OnClick="memberInsert()">저장</button>
								<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
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