<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "${contextPath}/notice/updateView.do");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true){
			
			formObj.attr("action", "${contextPath}/notice/deleteNotice.do");
			formObj.attr("method", "post");
			formObj.submit();
			}
		})

		// 취소
		$(".list_btn").on("click", function() {

			location.href = "${contextPath}/notice/listNotice.do";
		})
	})
</script>






<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />
		<div>
			<%@include file="noticeNav.jsp"%>
		</div>
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="notice_no" name="notice_no"
					value="${readNotice.notice_no}" />
			</form>
			<table>
				<tbody>
					<tr>
						<td><label for="notice_category">분류</label><input type="text"
							id="notice_category" name="notice_category"
							value="${readNotice.notice_category}" readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="notice_title">제목</label><input type="text"
							id="notice_title" name="notice_title"
							value="${readNotice.notice_title}" readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="notice_contents">내용</label> <textarea
								id="notice_contents" name="notice_contents" readonly="readonly"><c:out
									value="${readNotice.notice_contents}" /></textarea></td>
					</tr>
					<tr>
						<td><label for="notice_adminID">작성자</label><input type="text"
							id="notice_adminID" name="notice_adminID"
							value="${readNotice.notice_adminID}" readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="notice_date">작성날짜</label> <fmt:formatDate
								value="${readNotice.notice_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td><label for="notice_hit">조회수</label><input type="text"
							id="notice_hit" name="notice_hit"
							value="${readNotice.notice_hit}" readonly="readonly" /></td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</section>
		<hr />
	</div>
</body>
</html>