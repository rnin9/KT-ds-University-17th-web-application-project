<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Kaushan Font -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap')
	;

.carousel-indicators>li {
	border-radius: 50%;
	width: 9px;
	height: 8px;
}
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
	margin: 20px 20px;
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
	width: 80%;
	margin-left: 10%;
	display: flex;
	height: 50px;
	overflow: hidden;
	background-color: #fff;
	font-size: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 10px 5px;
}

.rolling {
	position: relative;
	width: 100%;
	text-align: left;
}

.rolling li {
	list-style: none;
	text-align: left;
	height: 50px;
	font-size: 20px;
	width: 100%;
}

#cardHover:hover {
	color: red;
}

.courseCard {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/main/noticeRolling.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
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
						style="animation-delay: 2s; margin-top: 30px;"
						onClick="location.href='${pageContext.request.contextPath}/universityIntro.do'">자세히
						보기</button>
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
						style="animation-delay: 2s; margin-top: 30px;"
						onClick="location.href='${pageContext.request.contextPath}/universityIntro.do'">자세히
						보기</button>
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
						style="animation-delay: 2s; margin-top: 30px;"
						onClick="location.href='${pageContext.request.contextPath}/universityIntro.do'">자세히
						보기</button>
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


	<!-- course card  -->
	<div class="courseCard">
		<div
			style="height: 80px; width: 80%; margin-left: 11%; font-family: 'Noto Sans KR', sans-serif;">
			<div
				style="float: left; font-size: 26px; font-weight: 500; margin-top: 20px;">#접수중
				강좌</div>
			<div style="float: right; vertical-align: bottom; margin-top: 20px;">
				<a href="${contextPath}/course/userCourseList.do"
					style="color: grey; font-size: 20px; text-decoration: underline;">전체보기</a>
			</div>
		</div>

		<div class="owl-carousel" style="z-index:0;">

			<c:forEach var="courseVO" items="${courseUserList}">
				<div class="item">
					<div class="card" style="margin-right: 2%; width: 310px;">
						<a id="cardHover"
							href="/springEx/course/selectUserCourse.do?courseID=${courseVO.courseID}">
							<div class="card-body">
								<span class="card-title"
									style="margin: 1% 1% 1% 1%; height: 25px;"><span
									style="float: left; font-size: 18px; margin-top: 5px;">
										<c:if test="${courseVO.syllabusVO.syllabusCategory1=='채용예정자'}">
                              채용예정자
                              </c:if> <c:if
											test="${courseVO.syllabusVO.syllabusCategory1 !='채용예정자'}">
                              ${courseVO.syllabusVO.syllabusCategory1}</c:if>
								</span><span style="float: right;"><span
										style="color: lightgrey; font-weight: 550; font-size: 22px;">│</span>
										<span class="dday"
										style="color: red; height: 13px; width: 100px; font-weight: 500; font-size: 24px;">
											<c:choose>
												<c:when test="${courseVO.courseState eq '조기마감'}">

                                    조기마감
                                    </c:when>
												<c:when test="${courseVO.dday > 0}">
                                    D-${courseVO.dday}
                                    </c:when>

												<c:when test="${courseVO.dday < 0}">
                                    접수마감
                                    </c:when>
											</c:choose>
									</span> </span></span> <br> <br>
								<p class="card-text"
									style="text-align: left; margin-top: 30px; margin-bottom: 10px; font-size: 20px; font-weight: bold; height: 120px;">${courseVO.syllabusVO.syllabusName}</p>
								<hr>
								<p
									style="color: grey; font-weight: 200; font-size: 17px; text-align: left">수강기간
									${courseVO.courseStart} ~ ${courseVO.courseEnd}</p>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<br>

	<!-- 공지사항 시작-->
	<div class="notice" style="margin-left: 11%;">
		<div style="font-size: 20px; font-weight: bold; width: 15%;">공지사항</div>
		<ul class="rolling">
			<li><a
				href="${pageContext.request.contextPath}/notice/readNoticeUser.do?notice_no=323">
					[공지] 컨소시엄 교육 신청 및 협약체결 안내</a></li>
			<li><a
				href="${pageContext.request.contextPath}/notice/readNoticeUser.do?notice_no=324">
					[공지] 개인정보 보호를 위한 패스워드 변경요청</a></li>
			<li><a
				href="${pageContext.request.contextPath}/notice/readNoticeUser.do?notice_no=325">
					[공지] 2021년 컨소시엄 재직자향상 교육 안내</a></li>
			<li><a
				href="${pageContext.request.contextPath}/notice/readNoticeUser.do?notice_no=326">
					[공지] 자바&파이썬 웹애플리케이션 전문가 양성과정 모집</a></li>
		</ul>
		<div class="contact"
			style="width: 100%; font-size: 17px; color: grey; font-weight: 400; text-align: right;">전화문의
			: 010-2709-8965 이메일 문의 : hongeun.lee@kt.com</div>
	</div>
	<!-- 공지사항 끝 -->
	<!-- card deck 시작 -->
	<%-- <div class="card-deck">
		<div class="card">
			<a href="#"> <img class="card-img-top"
				src="${pageContext.request.contextPath}/resources/image/mainPage/cardImage/classPerson.png"
				alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">채용예정자 과정</h5>
					<p class="card-text">취업을 준비하고 있는 채용예정자 또는 대학교 졸업생을 위한 교육비 전액
						무료의 KT ds University의 교육과정입니다.</p>
				</div>
			</a>
		</div>
		<div class="card">
			<a href="#"> <img class="card-img-top"
				src="${pageContext.request.contextPath}/resources/image/mainPage/cardImage/partnerPerson.jpg"
				alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">재직자 과정</h5>
					<p class="card-text">고용보험이 적용되는 중소기업 또는 우선 지원대상기업, 협력사에 재직중인
						임직원을 위한 교육과정입니다.</p>
				</div>
			</a>
		</div>
		<div class="card">
			<a href="${contextPath}/location.do"> <img class="card-img-top"
				src="${pageContext.request.contextPath}/resources/image/sub_visual/universityIntroduce.jpg"
				alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">교육장 안내</h5>
					<p class="card-text">국내 최고수준의 전문강사진과 신규시설 및 최신장비의 인프라, KT ds의
						교육장소를 소개합니다.</p>
				</div>
			</a>
		</div>
	</div> --%>
	<!-- card deck 끝 -->
	<!--OWL JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".owl-carousel").owlCarousel({
				stagePadding : 50,
				loop : true,
				margin : 100,
				nav : false,
				dots : false,
				autoplay : false,
				autoplayTimeout : 3000,
				autoplayHoverPause : true,
				responsive : {
					0 : {
						items : 1
					},
					720 : {
						items : 3
					},
					1280 : {
						items : 5
					}
				}
			});
		});
	</script>
</body>