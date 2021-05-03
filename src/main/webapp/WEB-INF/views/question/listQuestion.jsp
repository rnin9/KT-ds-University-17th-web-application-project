
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<c:choose>
	<c:when test="${isLogOn == true  && member.userPosition == 'ADMIN'}">
		<!DOCTYPE html>
		<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<script type="text/javascript">
	$(document).ready(function() {

		

		$('#adminListQuestion').DataTable({
			dom : 'lfrtp',
			order: [[ 5, "desc" ]],
			language : {
				info : '총 _TOTAL_ 개의 질문 중 _START_번 부터 _END_번',
				infoEmpty : '데이터가 없습니다.',
				emptyTable : '데이터가 없습니다.',
				thousands : ',',
				lengthMenu : '_MENU_ 개씩 보기',
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
				sSearchPlaceholder : ' 통합 검색',
			}

		});
	});
</script>
<title>목록창</title>
<style>
a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-wrap: wrap;
	width: 80%;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 15%;
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
</style>
</head>

<body>

	<div class="container">
		<div class="pageIntro">1:1문의</div>

		<table id="adminListQuestion" class="table_">

			<thead>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>처리 구분</th>
					<th>공개 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="question" items="${QuestionList}">
					<tr>

						<td><a
							href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}">
								<c:out value="${question.questionNum}" />
						</a></td>
						<td><a
							href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}">${question.questionType}</a></td>
						<td><a
							href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}">
								<c:out value="${question.questionTitle}" />
						</a></td>

						<td><a
							href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}">
								<c:out value="${question.userId}" />
						</a></td>
						<td><a
							href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}"><c:out
									value="${question.questionRegDate}" /></a></td>
						<td><a
							href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}">
								<c:if test="${question.questionCommentRegDate ne null}">
									<span style="color: green">답변 완료</span>
								</c:if> <c:if test="${question.questionCommentRegDate eq null}">
									<span style="color: red">처리중</span>
								</c:if>
						</a>
						<td><a
							href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}"><c:if
									test="${question.question_del_YN == 'Y'}">비공개</c:if> <c:if
									test="${question.question_del_YN == 'N'}">공개</c:if></a></td>

					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
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