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
	href="/juliet/resources/juliet.css">
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<style>
.container {
	width: 80%;
	font-family: 'Noto Sans KR', sans-serif;
}

.serarchSubject {
	display: flex;
	flex-direction: row;
}

.subject {
	display: flex;
	flex-direction: row;
}

.col {
	font-size: 13px;
}

.table_courseApplyList {
	border-collapse: collapse;
	font-size: 14px;
	line-height: 2.2;
	text-align: center;
	/* color: #555; */
	width: 100%;
	margin: auto;
	line-height: 40px;
}

.table_courseApplyList thead {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
	background-color: #f8f8f8;
	text-align: center;
}

.well-searchbox {
	min-height: 20px;
	min-width: 400px;
	padding: 19px;
	top: 90px;
	background: #f8f8f8;
	margin-bottom: 20px;
	padding-bottom: 0px;
	border: 1px solid #e3e3e3;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	margin-top: 30px;
}

.well-searchbox label {
	/* color: #555; */
	width: 20%;
	margin: 10px;
	text-align: right;
}

.btn {
	color: white;
	background-color: tomato;
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

.button_bottom {
	background-color: tomato;
	float: right;
	margin-left: 10px;
}

.form-control {
	border: hidden;
	width: 88%;
}

.form-select {
	border: hidden;
	width: 41%;
	display: inline-block;
	margin-right: 6%;
}

.col-md-8 {
	display: inline-block;
	text-align: left;
}

.searchTitle {
	margin-right: 20px;
}
</style>

</head>

<script>
	//달력picker, 키보드로도 입력가능[ex)2021/4], format: "mm/yyyy" 등 으로 변경가능 
	$(document).ready(function() {
		$('#sandbox-container input').datepicker({
			format : "yyyy/mm",
			startView : 1,
			minViewMode : 1,
			language : "ko",
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true
		});
	});

	//체크박스(개별 체크박스 항목이 선택 해제 될때, '전체선택' 항목도 선택 해제)
	   function checkSelectAll(checkbox)  {
		   const selectall 
		     = document.querySelector('input[name="check-all"]');
		   
		   if(checkbox.checked === false)  {
		     selectall.checked = false;
		   }
		 }

		 function selectAll(selectAll)  {
		   const checkboxes 
		      = document.getElementsByName('ab');
		   
		   checkboxes.forEach((checkbox) => {
		     checkbox.checked = selectAll.checked
		   })
		 }
</script>

<body>
	<div class="container">
	<!-- 홈>강의관리>수강관리 -->
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="/springEx/courseTake/courseApplyList.do">강의관리</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="/springEx/courseTake/courseApplyList.do">수강관리</a></li>
			</ul>
		</div>
		<!-- 검색박스 -->
		<div class="well-searchbox">
			<form class="form-horizontal" role="form">

				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">강의명</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="강의명">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">수강연월</label>
						<div class="col-md-8">
							<div id="sandbox-container">
								<div class="input-group date" style="width: 88%;">
									<input type="text" class="form-control" placeholder="연/월 입력">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">소속회사</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="소속회사">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">이름</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="이름">
						</div>
					</div>

					<div class="col-sm-offset-4 col-sm-5"
						style="display: inline-block; text-aglin: center;">
						<button type="submit" class="btn button_search"
							style="margin-top: 10px;">검색</button>
					</div>
				</div>
			</form>
		</div>

		<br>
		<ul class="nav justify-content-end"
			style="display: flex; float: right;">
			<li class="nav-item"><a class="nav-link active" href="#">신청일순</a></li>
			<li class="nav-item"><a class="nav-link" href="#">이름순</a></li>
			<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li> -->
		</ul>

		<!-- 테이블(표, 리스트) -->
		<table class="table_courseApplyList">
			<thead>
				<tr align="center">
					<td><input type="checkbox" class="check-all" /></td>
					<td><b>아이디</b></td>
					<td><b>이름</b></td>
					<td><b>전화번호</b></td>
					<td><b>이메일</b></td>
					<td><b>소속회사</b></td>
					<td><b>강의명</b></td>
					<td><b>수강상태</b></td>
					<td><b>신청일</b></td>
					<td><b>수료일</b></td>
				</tr>
			</thead>

			<tbody id="ajaxTable">
				<c:forEach var="courseTake" items="${courseApplyList}">
					<tr align="center">
						<td><input type="checkbox" name="ab" /></td>
						<td>${courseTake.userID}</td>
						<td>${courseTake.userName}</td>
						<td>${courseTake.userPhoneNumber}</td>
						<td>${courseTake.userEmail}</td>
						<td>${courseTake.userCompany}</td>
						<td>${courseTake.userEmail}</td>
						<td>${courseTake.courseTake_State}</td>
						<td>${courseTake.courseTake_ApplyDate}</td>
						<td>${courseTake.courseTake_CompleteDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>

		<!-- 버튼 -->
		<div style="margin-top: 40px; padding-bottom: 150px;">
			<button class="btn button_bottom" type="button">수료증출력</button>
			<button class="btn button_bottom" type="button">수료완료</button>
			<button class="btn button_bottom" type="button">신청승인</button>
		</div>

		<!-- 페이징(미완, 사용하지 말 것) -->
		<nav aria-label="..."
			style="display: inline-block; text-aglin: center;">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active" aria-current="page"><a
					class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>

	</div>
</body>
</html>