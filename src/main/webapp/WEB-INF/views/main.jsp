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
	padding-top: 5px;
	background-color: #F44336;
	color: #ffffff;
	text-shadow: 2px 8px 6px rgba(0, 0, 0, 0.2), 0px -3px 20px
		rgba(255, 255, 255, 0.4);
	padding-bottom: 19px;
}

/* card-css */
.card-deck {
	font-family: S-CoreDream-3Light;
	font-stlye: bold;
	margin:20px 20px;
}

.card {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

.card:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.notice {
	display:flex;
	width: 100%;
	height: 50px;
	overflow: hidden;
	background-color: #fff;
	font-size:20px;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 10px 5px;
	border-bottom: 1px solid #e1e1e1;
}

.rolling {
	position: relative;
	width: 100%;
	height: auto;
}

.rolling li {
	width: 70%;
	height: 50px;
	line-height: 50px;
	list-style:none;
}

.notice > h3{
	width: 20%;
	padding:10px;
	}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/main/noticeRolling.js"></script>

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


	<!-- 공지사항 시작-->
	<div class="notice">
		<h3> 공지사항 </h3>
		<ul class="rolling">
			<li><a href="#"> 수찬 반장 당선</a></li>
			<li><a href="#"> (NEW) 와사비 치킨마요 핫해</a></li>
			<li><a href="#"> 프로젝트 준비필요사항 </a></li>
			<li><a href="#"> 공지사항 4입니다</a></li>
		</ul>

	</div>
	<!-- 공지사항 끝 -->
	<!-- card deck 시작 -->
	<div class="card-deck">
		<div class="card">
			<a href="#"> <img class="card-img-top"
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
				src="${pageContext.request.contextPath}/resources/image/sub_visual/universityIntroduce.jpg"
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



