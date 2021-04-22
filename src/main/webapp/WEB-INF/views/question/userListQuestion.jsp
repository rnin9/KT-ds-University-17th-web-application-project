<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<c:choose>
<c:when test="${isLogOn == true}" >
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/juliet/resources/juliet.css">
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>사용자 질문 목록</title>
<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/question.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 55%;
	background-size: cover;
	background-repeat: no-repeat;
}

</style>
</head>

<body>
	<div class="sub_visual">
		<span style="color: white;">1 : 1 문의</span>
	</div>
	<div class="container">
	<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="${contextPath}/question/userListQuestion.do?userId=${member.userId}">1:1 문의</a></li>
				<li style="color: grey; font-weight: bold;"></li>
				
			</ul>
		</div>
		<br>
	<c:set var="QuestionList" value="${QuestionList}"/> 	
	<c:choose>
	<c:when test = "${!empty QuestionList}">	
	<table class="table">
			<thead>
				<tr align="center">
					<td><b>분류</b></td>
					<td><b>제목</b></td>
					<td><b>작성일</b></td>
					<td><b>답변 유무</b></td>	
				</tr>
			</thead>

			<tbody>
				<c:forEach var="question" items="${QuestionList}">
					<tr align="center">
						
						<td><a href= "${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}"><c:out value="${question.questionType}"/></a></td>
						<td><a href= "${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}"> <c:out value="${question.questionTitle}" /></a></td>
						<td><a href= "${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}"><c:out value="${question.questionRegDate}" /></a></td>
						<td><a href= "${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}"><c:choose><c:when test="${question.questionCommentRegDate != null }">답변 완료</c:when><c:when test="${question.questionCommentRegDate == null}">처리중</c:when></c:choose></a></td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>

	 <button type="button"  class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/questionForm.do' ">문의 등록</button>
	 </c:when>
	 
	 <c:when test = "${empty QusetionList}">
	 <button type="button"  class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/questionForm.do' ">문의 등록</button>
	 </c:when>
	 </c:choose>		

		
	



</div>	
</body>
</html>
</c:when>
<c:when test="${isLogOn == false }">
<head>

   <!-- HTML meta refresh URL redirection -->

   <meta http-equiv="refresh" content="3;url=${contextPath}/main.do">

</head>

 <body>

   <p> 로그인 후 이용가능합니다. 메인으로 이동합니다.</p>

</body>

</html>
</c:when>
<c:otherwise>
<html>

<head>

   <!-- HTML meta refresh URL redirection -->

   <meta http-equiv="refresh" content="2;url=${contextPath}/main.do">

</head>

 <body>

   <p>비정상적인 접근입니다. 메인으로 이동합니다.</p>

</body>

</html>
</c:otherwise>
</c:choose>
