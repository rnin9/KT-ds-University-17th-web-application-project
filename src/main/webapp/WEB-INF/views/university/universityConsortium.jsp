<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/university/UniversityConsortium.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/layout.css" />
<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/universityIntro.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}


.pageIntro {
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 50px;
	text-align: left;
	font-size: 34px;
	font-weight: 450;
	background:
		url("${pageContext.request.contextPath}/resources/image/icon/ico_title_bar.png")
		no-repeat;
	background-repeat: no-repeat;
}

.introImage {
	max-height: 350px;
	width: 60%;
	height: 60%;
	margin-right: 20px;
}

.main-intro>dl>dt {
	float: left;
}

.main-intro>dl {
	width: 70%
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	width: 80%;
}


.card {
  background: #fff;
  border-radius: 2px;
  display: inline-block;
  height: 90%;
  margin: 1rem;
  position: relative;
  width: 40%;
}
.card-2 {
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
  text-align : center;
}

<c:choose>
		<c:when test="${isLogOn == true  && member.userPosition == '재직자'}">
@media screen and (max-width: 719px) {
    #floatMenu {
    display :none;
    }
}



#floatMenu {
	position: absolute;
	width: 160px;
	height: 200px;
	left: 80%;
	top: 500px;
	background-color: white;
	color: #fff;
}
</c:when>
</c:choose>
</style>
<script>
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});
</script>


</head>
<body>
	<div class="sub_visual">
		<span style="color: white;">kt ds University</span>
	</div>
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="${pageContext.request.contextPath}/universityConsortium.do">컨소시엄소개</a></li>
			</ul>
		</div>

		<!-- 페이지에 대한 intro -->
		<!-- <div class="pageIntro">컨소시엄 소개</div> -->

		<!-- 사업 소개 -->
		<br>
		<br>
		<br>
		<div class="main-intro-image">
		<img class="first-image" width="80%"  src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium-intro.png" />
		</div>
		<br>
		<br>
		<br>
		<div class="consortium-gujo">
		<img class="gujo-image" width="80%"  src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium-gujo.png" />
		</div>
		<br>
		<br>
		<br>
		<div class="consortium-studygujo">
		<img class="studygujo-image" width="80%" height="10%" src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium-studygujo.png" />
		</div>
		<br>
		<br>
		<br>
		<div class="consortium-studysinchung">
		<img class="studysinchung-image" width="80%" height="10%" src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium-studysinchung.png" />
		</div>
		<br>
		<br>
		<br>
		
		<div class="card card-2" >
		<br>
		<!-- <h5><span>교육 시간</span></h5> -->
		<img class="studytime-image" width="80%" height="75%" src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium-studytime.png" />
		<br>
		</div>
		
		<div class="card card-2">
		<br>
		<!-- <h5><span style="color:rgb(238,28,36);">연락처</span></h5> -->
		<img class="address-image" width="80%" height="75%" src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium-address.png" />
		<br>
		</div>
		<br>
		<br>
		<br>
	</div>	
		<c:choose>
		<c:when test="${isLogOn == true  && member.userPosition == '재직자'}">
		<div id="floatMenu">
			<a href="https://c11.kr/ktdscon" target="_blank"><p style="font-size:15px; margin-bottom:0px;">재직자향상교육<br>카카오톡 오픈채팅</p></a>
			<a href="https://c11.kr/ktdscon" target="_blank"><img class="kakao-QR" width="100%" height="80%" src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/kakao-QR.png" /></a>
			<button type="button" class="btn btn-outline-danger" onclick="window.open('https://c11.kr/ktdscon')">입장</button>
		</div>
		</c:when>
		</c:choose>
		<!-- 사업 끝 -->
</body>
</html>