<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta charset=UTF-8">
<title>공지사항 정보</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<style>
.bg-primary {
	background-color: white !important;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.table_notice {
	margin-top: 30px;
	border-collapse: collapse;
	text-align: center;
	/* color: #555; */
	width: 100%;
	line-height: 40px;
}

.table_notice th {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
	background-color: #f8f8f8;
	text-align: center;
	font-size: 15px;
	width: 30%;
}

.table_notice td {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
	text-align: center;
	font-size: 15px;
}

.informTitle {
	margin-top: 20px;
	text-align: left;
	font-size: 18px;
	font-weight: 600;
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #e0e0e0;
	letter-spacing: 5px;
	padding-bottom: 20px;
	background-color: #f8f8f8;
}

.informBox {
	overflow: hidden;
	height: auto;
	text-align: left;
	font-size: 16px;
	line-height: 30px;
	padding: 20px 60px 20px 60px;
	margin-bottom: 20px;
	margin-bottom: 20px;
}

.button_bottom_U {
	background-color: tomato;
	float: right;
	margin-left: 10px;
}

.button_bottom_D {
	background-color: tomato;
	float: right;
	margin-left: 10px;
}

.button_bottom_C {
	background-color: tomato;
	float: right;
	margin-left: 10px;
}
</style>


</head>



<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 수정 
						$(".button_bottom_U")
								.on(
										"click",
										function() {
											formObj
													.attr("action",
															"${contextPath}/notice/updateView.do");
											formObj.attr("method", "get");
											formObj.submit();
										})

						// 삭제
						$(".button_bottom_D")
								.on(
										"click",
										function() {

											var deleteYN = confirm("삭제하시겠습니까?");
											if (deleteYN == true) {

												formObj
														.attr("action",
																"${contextPath}/notice/deleteNotice.do");
												formObj.attr("method", "post");
												formObj.submit();
											}
										})

						// 취소
						$(".button_bottom_C")
								.on(
										"click",
										function() {

											location.href = "${contextPath}/notice/listNotice.do";
										})
					})
</script>

<script type="text/javascript">
	// 첨부파일 다운로드
	function fn_fileDown(nt_file_no) {
		var formObj = $("form[name='readForm']");
		$("#NT_FILE_NO").attr("value", nt_file_no);
		console.log('yeeeeeee' + nt_file_no);
		formObj.attr("action", "${contextPath}/notice/fileDown.do");
		formObj.submit();
	}
	
	chk = (num, name) => {
		console.log(num + 'meeeeeeeeeee' + name);
	}
</script>


<body>
	<form name="readForm" role="form" method="post">
		<input type="hidden" id="notice_no" name="notice_no"
			value="${readNotice.notice_no}" /> <input type="hidden"
			id="NT_FILE_NO" name="NT_FILE_NO" value="">

		<div class="container">
			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/notice/listNotice.do">공지사항
							관리</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a
						href="/springEx/notice/readNotice.do?notice_no=${readNotice.notice_no}">공지사항
							정보</a></li>
				</ul>
			</div>



			<table class="table_notice">
				<tr>
					<th>분류</th>
					<td>${readNotice.notice_category}</td>
				</tr>

				<tr>
					<th>제목</th>
					<td>${readNotice.notice_title}</td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${readNotice.notice_adminID}</td>
				</tr>

				<tr>
					<th>작성일</th>
					<td>${readNotice.notice_date}</td>
				</tr>


				<tr>
					<th>조회수</th>
					<td>${readNotice.notice_hit}</td>
				</tr>

				<tr>
					<th>파일</th>
					<td><c:forEach var="fileVO" items="${fileList}">
						<!--  	<a href="#"
								onclick="fn_fileDown('${fileVO.NT_FILE_NO}'); return false;">${fileVO.ORG_NT_FILE_NAME}</a>(${fileVO.FILE_NT_SIZE}kb)<br> -->
					
							<a href="/KT-ds-University-17th-web-application-project/filepath/${fileVO.STR_NT_FILE_NAME}"download><i class="fas fa-file-alt"></i>'${fileVO.ORG_NT_FILE_NAME}'('${fileVO.NT_FILE_SIZE}'kb)</a>
						</c:forEach></td>
				</tr>

			</table>

			<div class="containerLower" style="margin-top: 30px;">
				<div class="inform">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>내용
					</div>
					<div class="informBox">${readNotice.notice_contents}</div>
				</div>
			</div>


			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button type="button" class="btn button_bottom_C">취소</button>
				<button type="button" class="btn button_bottom_D">삭제</button>
				<button type="submit" class="btn button_bottom_U">수정</button>
			</div>
		</div>
	</form>
</body>
</html>