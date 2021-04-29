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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<script type="text/javascript">
$(document).ready(function(){
	
	$.extend( $.fn.dataTable.defaults, {
	    ordering:  false
	} );

	$('#adminListQuestion').DataTable({
		
		  
		language: {
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
			sSearchPlaceholder: '통합 검색',
		}
	
	  
	});
});
</script>	
<title>목록창</title>
<style>
div.table
{
margin-top : 50px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="/springEx/question/listQuestion.do">1
						: 1 문의</a></li>
				<li style="color: grey; font-weight: bold;"></li>

			</ul>
		</div>
		<div class="table">
		<table id="adminListQuestion" class="display">

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
								<c:if test="${question.questionCommentRegDate ne null}"><span style="color:green">답변 완료</span></c:if>
								<c:if test="${question.questionCommentRegDate eq null}"><span style="color:red">처리중</span></c:if>
							</a>
					<td><a
						href="${contextPath}/question/adminReadQuestion.do?questionNum=${question.questionNum}"><c:if
								test="${question.question_del_YN == 'Y'}">비공개</c:if><c:if
								test="${question.question_del_YN == 'N'}">공개</c:if></a></td>




				</tr>
			</c:forEach>
			</tbody>
			
		</table>
		</div>





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