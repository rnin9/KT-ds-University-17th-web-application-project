<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>


<!-- Kaushan Font -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap')
	;
</style>

<style type="text/css">
/* carousel-css */
.carouselImg {
	width: 100%;
	-moz-filter: blur(1px) brightness(0.5);
	-ms-filter: blur(1px) brightness(0.5);
	-o-filter: blur(1px) brightness(0.5);
	filter: blur(1px) brightness(0.5);
	-webkit-filter: blur(1px) brightness(0.5);
	-moz-filter: blur(1px) brightness(0.5);
	-moz-filter: blur(1px) brightness(0.5);
}

.carousel-inner {
	height: 100%;
	min-width: 830px;
	position: relative;
	width: 100%;
	overflow: hidden;
	position: relative;
	position: relative;
}

.carousel-caption {
	top: 50%;
	transform: translateY(-50%);
	font-family: Chosunilbo_myungjo;
}

.carousel-caption {
	top: 50%;
	transform: translateY(-50%);
	font-family: Chosunilbo_myungjo;
}

/* welcome Line-css */
.welcome>h1 {
	font-family: 'Kaushan Script', cursive;
	font-style: italic;
	padding-top: 10px;
	padding-bottom: 15px;
	background-color: #F44336;
	color: #ffffff;
	text-shadow: 2px 8px 6px rgba(0, 0, 0, 0.2), 0px -3px 20px
		rgba(255, 255, 255, 0.4);
	padding-bottom: 15px;
}

/* card-css */
.card-deck {
	font-family: S-CoreDream-3Light;
	font-stlye: bold;
	margin-left: 20px;
	margin-right: 20px;
}

.card {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

.card:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
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
	<!-- 캐러셀 시작 -->
	<div id="carouselExampleIndicators"
		class="carousel slide custom-carousel" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="carouselImg"
					src="${pageContext.request.contextPath}/resources/image/mainPage/carousel/carousel1fix.png"
					alt="First slide">
				<div class="carousel-caption">
					<h1 class="animate__animated animate__fadeInDown">사랑받는 국민기업</h1>
					<h2 class="animate__animated animate__fadeInDown"
						style="animation-delay: 1s;">KT ds 교육센터는 교육의 질을 향상시킵니다</h2>
					<button type="button"
						class="btn btn-danger btn-lg animate__animated animate__fadeInUp"
						style="animation-delay: 2s; margin-top: 30px;">자세히 보기</button>
				</div>
			</div>
			<div class="carousel-item">
				<img class="carouselImg"
					src="${pageContext.request.contextPath}/resources/image/mainPage/carousel/carousel2fix.png"
					alt="Second slide">
				<div class="carousel-caption">
					<h2 class="animate__animated animate__fadeInDown">리더십을 갖춘 핵심인재
						육성 교육 서비스</h2>
					<h3 class="animate__animated animate__fadeInDown"
						style="animation-delay: 1s;">Career Development Path 지원과 더불어
						계층별 리더십과 마인드를 함양합니다.</h3>
					<button type="button"
						class="btn btn-danger btn-lg animate__animated animate__fadeInUp"
						style="animation-delay: 2s; margin-top: 30px;">자세히 보기</button>
				</div>
			</div>
			<div class="carousel-item">
				<img class="carouselImg"
					src="${pageContext.request.contextPath}/resources/image/mainPage/carousel/carousel3fix.png"
					alt="Third slide">
				<div class="carousel-caption">
					<h2 class="animate__animated animate__fadeInDown">미래 기술로 도약하는
						IT</h2>
					<h3 class="animate__animated animate__fadeInDown"
						style="animation-delay: 1s;">고객 비즈니스의 신속한 의사결정을 위한 최적의 솔루션을
						제시합니다.</h3>
					<button type="button"
						class="btn btn-danger btn-lg animate__animated animate__fadeInUp"
						style="animation-delay: 2s; margin-top: 30px;">자세히 보기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 캐러셀 종료 -->


	<!-- welcome Message -->
	<div class="welcome">
		<h1>Welcome to Our University!</h1>
	</div>
	<!-- welcom Message 종료 -->

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


	<!-- card deck 시작 -->
	<div class="card-deck">
		<div class="card">
		<a href="#">
			<img class="card-img-top"
				src="${pageContext.request.contextPath}/resources/image/mainPage/cardImage/classPerson.png"
				alt="Card image cap">
		</a>
			<div class="card-body">
				<h5 class="card-title">채용예정자 과정</h5>
				<p class="card-text">취업을 준비하고 있는 채용예정자 또는 대학교 졸업생을 위한 교육비 전액 무료의
					KT ds University의 교육과정입니다.</p>
		
			</div>
		</div>
		<div class="card">
			<img class="card-img-top"
				src="${pageContext.request.contextPath}/resources/image/mainPage/cardImage/partnerPerson.jpg"
				alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title">재직자 과정</h5>
				<p class="card-text">고용보험이 적용되는 중소기업 또는 우선 지원대상기업, 협력사에 재직중인
					임직원을 위한 교육과정입니다.</p>

			</div>
		</div>
		<div class="card">
			<a><img class="card-img-top"
				src="${pageContext.request.contextPath}/resources/image/mainPage/cardImage/class.png"
				alt="Card image cap"></a>
			<div class="card-body">
				<h5 class="card-title">교육장소 소개</h5>
				<p class="card-text">국내 최고수준의 전문강사진과 신규시설 및 최신장비의 인프라, KT ds의
					교육장소를 소개합니다.</p>

			</div>
		</div>
	</div>
	<!-- card deck 끝 -->
</body>



