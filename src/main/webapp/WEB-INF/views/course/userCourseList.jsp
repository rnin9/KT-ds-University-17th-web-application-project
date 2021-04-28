<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset=UTF-8">
<title>수강관리</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styleTab.css" />

<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/faq.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}

.card-body {
	width: 265px;
	height: 265px;
	/* margin: 2% 2% 2% 2%; */
	display: inline-table;
}

p {
	text-align: left;
}

.card-text {
	margin-top: 30px;
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
	height: 120px;
}

.container {
	width: 100%;
}
</style>

</head>

<body>
	<div class="sub_visual">
		<span style="color: black;"></span>
	</div>


	<div class="container">
		<!-- 홈>강의관리>수강관리 -->
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="/springEx/course/userCourseList.do">과정신청</a></li>
			</ul>
		</div>

		<div class="pageIntro">과정신청</div>

		<!-- Start Tabs HTML -->
		<div class="tabs"
			style="margin-top: 50px; overflow: hidden; padding: 0;">

			<input type="radio" id="tab1" name="tab-control" checked> <input
				type="radio" id="tab2" name="tab-control"> <input
				type="radio" id="tab3" name="tab-control"> <input
				type="radio" id="tab4" name="tab-control">
			<ul>
				<li title="Features"><label for="tab1" role="button"><span>전체</span></label></li>
				<li title="Delivery Contents"><label for="tab2" role="button"><span>재직자향상
							과정</span></label></li>
				<li title="Shipping"><label for="tab3" role="button"><span>채용예정자
							과정</span></label></li>
			</ul>

			<div class="slider">
				<div class="indicator"></div>
			</div>
			<div class="content">
				<section>
					<div
						style="width: 100%; display: flex; flex-direction: inherit; flex-wrap: wrap;">
						<c:forEach var="courseVO" items="${courseUserList}">
							<a
								href="/springEx/course/selectUserCourse.do?courseID=${courseVO.courseID}">
								<div class="card" style="margin:10px 5px;">
									<div class="card-body">
										<span class="card-title"
											style="margin: 1% 1% 1% 1%; height: 25px;"><span
											style="float: left; font-size: 18px; margin-top: 5px;">
												<c:if
													test="${courseVO.syllabusVO.syllabusCategory1=='채용예정자'}">
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
											</span> </span></span>
										<p class="card-text">${courseVO.syllabusVO.syllabusName}</p>
										<hr>
										<p
											style="heighth: 13px; color: grey; font-weight: 200; margin-bottom: 20px; font-size: 15px;">수강기간
											${courseVO.courseStart} ~ ${courseVO.courseEnd}</p>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>

				</section>


				<section>
					<div
						style="width: 100%; display: flex; flex-direction: inherit; flex-wrap: wrap; min-width: 800px;">
						<c:forEach var="courseVO" items="${courseUserList}">
							<c:if test="${courseVO.syllabusVO.syllabusCategory1=='재직자향상'}">
								<a
									href="/springEx/course/selectUserCourse.do?courseID=${courseVO.courseID}">
									<div class="card">
										<div class="card-body">
											<span class="card-title"
												style="margin: 1% 1% 1% 1%; height: 25px;"><span
												style="float: left; font-size: 18px; margin-top: 5px;">
													<c:if
														test="${courseVO.syllabusVO.syllabusCategory1=='채용예정자'}">
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
												</span> </span></span>
											<p class="card-text">${courseVO.syllabusVO.syllabusName}</p>
											<hr>
											<p
												style="heighth: 13px; color: grey; font-weight: 200; margin-bottom: 20px; font-size: 14px;">수강기간
												${courseVO.courseStart} ~ ${courseVO.courseEnd}</p>
										</div>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</div>
				</section>
				<section>
					<div
						style="width: 100%; display: flex; flex-direction: inherit; flex-wrap: wrap; min-width: 800px;">
						<c:forEach var="courseVO" items="${courseUserList}">
							<c:if test="${courseVO.syllabusVO.syllabusCategory1=='채용예정자'}">
								<a
									href="/springEx/course/selectUserCourse.do?courseID=${courseVO.courseID}">
									<div class="card">
										<div class="card-body">
											<span class="card-title"
												style="margin: 1% 1% 1% 1%; height: 25px;"><span
												style="float: left; font-size: 18px; margin-top: 5px;">
													<c:if
														test="${courseVO.syllabusVO.syllabusCategory1=='채용예정자'}">채용예정자</c:if>
													<c:if
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
												</span> </span></span>
											<p class="card-text">${courseVO.syllabusVO.syllabusName}</p>
											<hr>
											<p
												style="heighth: 13px; color: grey; font-weight: 200; margin-bottom: 20px; font-size: 14px;">수강기간
												${courseVO.courseStart} ~ ${courseVO.courseEnd}</p>
										</div>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</div>
				</section>
			</div>
		</div>
		<!-- End Tabs HTML -->
	</div>
</body>
</html>