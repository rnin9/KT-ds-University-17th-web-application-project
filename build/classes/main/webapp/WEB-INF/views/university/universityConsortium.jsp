<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/university/UniversityConsortium.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/layout.css" />
<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/universityConsortiums.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}

.main-intro {
	display: flex;
	margin: 60px;
	justify-content: center;
}

.intro-explain {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	font-family: Chosunilbo_myungjo;
	margin-right: 20px
}

.intro-explain>p {
	max-width: 453px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.intro-explain>p>span {
	border-bottom: 1px solid #000;
	padding-bottom: 1px;
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

.intro-explain>h2, .intro-explain>h3 {
	font-family: 'Wemakeprice-Bold';
	text-shadow: 2px 8px 6px rgba(0, 0, 0, 0.2), 0px -3px 20px
		rgba(255, 255, 255, 0.4);
	margin-bottom: 5px;
	font-style: italic;
	color: darkslategray;
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

.lnb>ul {
	list-style: none;
	padding: 0;
	text-align: left;
}

.lnb>ul>li {
	display: inline-block;
	margin-left: 9px;
	padding-left: 15px;
	margin-left: 9px;
}
</style>
</head>
<body>
	<div class="sub_visual">
		<span style="color: white;">컨소시엄</span>
	</div>
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="${pageContext.request.contextPath}/universityConsortium.do">컨소시엄</a></li>
			</ul>
		</div>

		<!-- 페이지에 대한 intro -->
		<div class="pageIntro">컨소시엄</div>

		<!-- 사업 소개 -->

		<div class="main-intro">
			<dl>
				<dt>대상기업</dt>
				<dd>고용보험이 적용되는 중소기업 또는 우선지원대상기업 (제조업 500인 이하)</dd>
				<dt>대상자</dt>
				<dd>상기 기업에 재직중인 임직원 (고용보험 가입자)</dd>
				<dt>제출서류</dt>
				<dd>-국가인적자원개발 컨소시엄 협약서(1회 체결시 1년 지속)</dd>
				<dt></dt>
				<dd>-국가인적자원개발 컨소시엄 협약서(1회 체결시 1년 지속)</dd>
				<dt>본사</dt>
				<dd>(06707) 서울 서초구 효령로 176</dd>
				<dt>대표전화</dt>
				<dd>02-523-7029</dd>
			</dl>
		</div>
		<div class="main-intro">
			<img class="img-fluid introImage"
				src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium1.png" />
		</div>
		<div class="main-intro">
			<dl>
				<dt>설립연월</dt>
				<dd>2008년 8월 1일</dd>
				<dt>회사명</dt>
				<dd>kt ds</dd>
				<dt>대표이사</dt>
				<dd>우정민</dd>
				<dt>본사</dt>
				<dd>(06707) 서울 서초구 효령로 176</dd>
				<dt>대표전화</dt>
				<dd>02-523-7029</dd>
			</dl>
		</div>
		<div class="main-intro">
			<img class="img-fluid introImage"
				src="${pageContext.request.contextPath}/resources/image/mainPage/consortium/consortium2.png" />
		</div>
		<!-- 사업 끝 -->
	</div>
</body>
</html>