<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<c:choose>
	<c:when test="${isLogOn == true}">
		<!DOCTYPE html>
		<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />


<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>

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

.bg-primary {
	background-color: white !important;
}

button {
	float: right;
	margin-right: 10px;
}

.dataTables_wrapper {
	display: inline-block;
	width: 100%;
}

table.dataTable thead th, table.dataTable thead td {
	padding: 10px 18px;
	border-bottom: 1px solid #96988f;
	background-color: #f8f8f8;
}

table.dataTable td {
	border-top: 1px solid lightgrey;
}

.btn {
	color: #DC3545;
	background-color: white;
	border-color: rgba(247, 94, 94, 0 .8);
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$.extend($.fn.dataTable.defaults, {
			ordering : false
		});

		$('#table_id').DataTable({

			language : {
				info : '',
				sInfoFiltered : '',
				infoEmpty : '',
				emptyTable : '데이터가 없습니다.',
				thousands : ',',
				lengthMenu : '',
				loadingRecords : '데이터를 불러오는 중',
				processing : '처리 중',
				zeroRecords : '검색 결과 없음',
				paginate : {
					first : '처음',
					last : '끝',
					next : '다음',
					previous : '이전'
				},
				search : '',
				sSearchPlaceholder : '통합 검색',

			}
		});
	});
</script>

</head>

<body>
	<div class="sub_visual">
		<span style="color: white;">1:1 문의</span>
	</div>
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="${contextPath}/question/userListQuestion.do?userId=${member.userId}">1:1
						문의</a></li>
				<li style="color: grey; font-weight: bold;"></li>

			</ul>
		</div>

		<!-- <div class="pageIntro">1:1 문의</div> -->

		<table class="table_" id="table_id"
			style="border-bottom: 1px solid #96988f;">
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

						<td><a
							href="${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}"><c:out
									value="${question.questionType}" /></a></td>
						<td><a
							href="${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}">
								<c:out value="${question.questionTitle}" />
						</a></td>
						<td><a
							href="${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}"><c:out
									value="${question.questionRegDate}" /></a></td>
						<td><a
							href="${contextPath}/question/readQuestion.do?questionNum=${question.questionNum}"><c:choose>
									<c:when test="${question.questionCommentRegDate != null }">답변 완료</c:when>
									<c:when test="${question.questionCommentRegDate == null}">처리중</c:when>
								</c:choose></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div style="margin-top: 50px; padding-bottm: 30px;">
			<button type="button" class="btn btn-outline-danger"
				onclick="location.href='${contextPath}/question/questionForm.do' ">문의
				등록</button>
		</div>

		<div style="height: 120px;"></div>

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

			<p>로그인 후 이용가능합니다. 메인으로 이동합니다.</p>

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
	<br>
	<br>
	<br>
	<br>
	<p>비정상적인 접근입니다. 로그인 해주세요. 곧 메인으로 이동합니다.</p>

</body>

		</html>
	</c:otherwise>
</c:choose>
