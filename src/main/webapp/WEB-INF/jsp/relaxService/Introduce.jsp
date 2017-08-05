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
	<div class="container">
		<!-- CK에디터 -->
		<div class="box">
			<div class="col-lg-12 text-center">
				<hr>
				<h2 class="intro-text text-center">
					WebSite <strong>Developer Introduce</strong>
				</h2>
				<hr>
				<p>Developer</p>
				<p>Name : LEE DONG OK</p>
				<p>E-MAIL : orm6711@gmail.com</p>
				<p>address : Korea republic</p>
				<p>Develope Career : 18Month</p>
				<hr>
				<p>Development environment</p>
				<p>JAVA,javascript,SPRING FRAMEWORK(MVC,SECURITY),</p>
				<p>Bootstrap,AJAX,MYBATIS,ORACLE</p>
				<hr>
			</div>
		</div>

		<!-- 지도 API -->
		<div class="box">
			<div class="col-lg-12 text-center">
				<div id="map" style="width: 100%; height: 400px; margin: auto;">
					<script>
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new daum.maps.LatLng(37.72176756698391, 126.75141594184569), //지도의 중심좌표.
					level: 6 //지도의 레벨(확대, 축소 정도)
					};
					
					
					var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
					
					function panTo() {
					    // 이동할 위도 경도 위치를 생성합니다 
					    var moveLatLon = new daum.maps.LatLng(37.72176756698391, 126.75141594184569);
					 // 지도를 클릭한 위치에 표출할 마커입니다
						var marker = new daum.maps.Marker({ 
						    // 지도 중심좌표에 마커를 생성합니다 
						    position: map.getCenter() 
						}); 
						// 지도에 마커를 표시합니다
						marker.setMap(map);
					    // 지도 중심을 부드럽게 이동시킵니다
					    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
					    map.panTo(moveLatLon);            
					}        
					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new daum.maps.MapTypeControl();

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new daum.maps.ZoomControl();
					map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
					
					
					
				</script>
				</div>
				<div class="brand-before">
					<small>Developer adress : 서울시 </small>
				</div>
				<button class="btn btn-warning" onclick="panTo()">원래 주소 되돌리기</button>
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
	</body>
</html>