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
	href="${contextPath}/resources/css/layout.css" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/university/UniversityConsortium.css" />

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

.main-intro {
	display: flex;
	margin: 60px;
	justify-content: center;
	min-width: 900px;
}

.intro-explain {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	font-family: 'Noto Sans KR', sans-serif;
	margin-right: 20px
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

.container {
	font-family: 'Noto Sans KR', sans-serif;
	width: 80%;
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

.intro-explain>p {
	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	max-width: 430px;
}

.intro-explain>p>span {
	border-bottom: 1px solid palevioletred;
}

.intro-explain>h2, .intro-explain>h3 {
	font-family: 'Noto Sans KR', sans-serif;
	text-shadow: 2px 8px 6px rgba(0, 0, 0, 0.2), 0px -3px 20px
		rgba(255, 255, 255, 0.4);
	margin-bottom: 5px;
	font-style: italic;
	color: darkslategray;
}

.introImage {
	max-height: 290px;
}

.intro dl dt {
	float: left;
	font-weight: bold;
	clear: both;
	width: 60px;
	font-size: 12px;
}

.intro dl dd {
	font-size: 10px;
}
.sansil {
width : 100%
}
</style>
</head>
<body>
	<div class="sub_visual">
		<span style="color: white;">회사소개</span>
	</div>
	<div class="container">

		<div class="lnb">
			<ul>
				<li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="${pageContext.request.contextPath}/universityIntro.do">회사소개</a></li>
			</ul>
		</div>

		<!-- 페이지에 대한 intro -->
		<div class="pageIntro">회사 소개</div>

		<!-- 사업 소개 -->
		<div class="main-intro">
				<img class="sansil"
					src="${pageContext.request.contextPath}/resources/image/mainPage/Introduce/sansil.jpg" />
				
			
		</div>
		<!-- 사업 끝 -->

		<!-- Company History시작 -->

		<div class="pageIntro">연혁</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="main-timeline">
						<div class="timeline">
							<div class="timeline-icon">
								<i class="fas fa-chalkboard-teacher"></i>
							</div>
							<span class="year">2013 ~ 현재</span>
							<div class="timeline-content">
								<h5 class="title">kt ds IOC</h5>
								<p class="description">
									- kt ds University 교육포탈 (www.ktdsuniversity.com) 오픈<br /> -
									고용노동부 청년취업 아카데미 운영기관 선정<br /> - kt ds IOC(Innovative Operation
									Center) 오픈<br />
								</p>
							</div>
						</div>
						<div class="timeline">
							<div class="timeline-icon">
								<i class="fa fa-rocket"></i>
							</div>
							<span class="year">2012</span>
							<div class="timeline-content">
								<h5 class="title">kt ds University</h5>
								<p class="description">
									- 국가인적자원개발 컨소시엄 사업 운영기관 선정<br /> - kt ds University로 명칭 변경
								</p>
							</div>
						</div>
						<div class="timeline">
							<div class="timeline-icon">
								<i class="fa fa-briefcase"></i>
							</div>
							<span class="year">2011</span>
							<div class="timeline-content">
								<h5 class="title">kt ds Academy</h5>
								<p class="description">- kt 및 협력사 AMO/IMO Academy 교육 수행</p>
							</div>
						</div>
						<div class="timeline">
							<div class="timeline-icon">
								<i class="fas fa-globe"></i>
							</div>
							<span class="year">2010</span>
							<div class="timeline-content">
								<h5 class="title">kt ds 평생교육시설</h5>
								<p class="description">
									- 지식경제부 인재양성(IT멘토링) 기업특별상 수상<br /> - 교육부 평생교육시설 인증(노동부 환급기관)<br />
									- SAP, HP, Oracle, 삼성멀티캠퍼스, CISCO등 9개 교육기관과 파트너십 체결
								</p>
							</div>
						</div>
						<div class="timeline">
							<div class="timeline-icon">
								<i class="fas fa-school"></i>
							</div>
							<span class="year">2009</span>
							<div class="timeline-content">
								<h5 class="title">kt ds 교육센터</h5>
								<p class="description">- kt ds 인력개발팀에서 교육센터로 HRD전담 조직 확대</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Company History끝-->
</body>
</html>