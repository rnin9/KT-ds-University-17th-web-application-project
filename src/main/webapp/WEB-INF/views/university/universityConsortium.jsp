<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/universityConsortium.jpg");
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
	margin-top: 80px;
}
</style>
</head>
<body>
	<div class="sub_visual">
		<span style="color: white;">컨소시엄</span>
	</div>
	
	<div class="lnb">
			<ul>
				<li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="${pageContext.request.contextPath}/faq.do">FAQ</a></li>
			</ul>
		</div>

		<!-- 페이지에 대한 intro -->
		<div class="faqIntro">컨소시엄</div>
		
	<!-- 사업 소개 -->
	<div class="main-intro">
		<div class="intro-explain">
			<h2>IT 분야 HRD 업무노하우를 바탕으로,</h2>
			<h3>
				<span
					style="color: red; margin-right: 5px; font-style: normal; text-shadow: none;">IT
					전문 교육기관</span>으로 신뢰받는 기업
			</h3>
			<p>
				IT 분야 HRD 업무노하우를 바탕으로 IT 전문 교육기관으로 신뢰받는 기업입니다. KTDS는 KT 정보시스템 구축 기술과
				노하우를 기반으로 <span>새로운 IT 서비스를 창출하고 우수한 인재를 양성하여 고객의 가치를 최고로
					실현하는 IT 서비서 전문 기업입니다.</span>
			</p>

			<p>ktds University는 2012년 ktds 교육센터의 새로운 이름으로 시설 및 최신장비 구축 등 최고의
				인프라와 함께 새롭게 런칭하였으며, 그 동안 축적된 IT분야 HRD업무 노하우를 바탕으로 인재육성 전략 요구에 부응하는
				최신 HRD Trend가 적용된 커리큘럼 및 Learning Solution으로 그룹사 및 협력사 외 교육을 필요로 하는
				모든 기업 재직자를 대상으로 교육서비스를 제공합니다.</p>

			<p>
				국내 최고 수준의 전문강사진과 신규 시설 및 최신 장비의 인프라로 보다 <span>쾌적한 교육환경으로
					IT분야의 새로운 Trend에 앞장서며 IT 전문 교육기관으로서 고객에게 신뢰받는 기업이 될 것입니다.</span>
			</p>
		</div>
		<img class="img-fluid introImage"
			src="${pageContext.request.contextPath}/resources/image/mainPage/Introduce/mainIntroduce.png" />

	</div>
	<!-- 사업 끝 -->
</body>
</html>