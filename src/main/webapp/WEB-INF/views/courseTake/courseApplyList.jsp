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

<style>
.container {
	width: 80%;
	font-family: 'Noto Sans KR', sans-serif;
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
}

.well-searchbox label {
	/* color: #555; */
	width: 20%;
	margin: 10px;
	text-align: right;
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
	margin-top: 12px;
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

.button_bottom {
	display: inline-block;
	margin-bottom: 0;
	font-weight: 400;
	text-align: center;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	white-space: nowrap;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
	color: #fff;
	background-color: #28a745;
	border-color: #28a745;
	float: right;
	margin-left: 10px;
}
</style>



<!--  
<script type="text/javascript">
	function searchFunction(){
		
	}




</script>
-->


</head>

<script>
	$(document).ready(function() {
		$('#sandbox-container input').datepicker({
			format : "mm/yyyy",
			startView : 1,
			minViewMode : 1,
			language : "ko",
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true
		});
	});
</script>

<body>
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="/springEx/courseTake/courseApplyList.do">수강관리</a></li>
			</ul>
		</div>
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
								<div class="input-group date">
									<input type="text" class="form-control" placeholder="연/월 선택"
										style="border-radius: 4px;">
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
						<button type="submit" class="btn btn-success"
							style="margin-top: 10px;">Search</button>
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

		<table class="table_courseApplyList">
			<thead>
				<tr align="center">
					<td><input type="checkbox" /></td>
					<td><b>아이디</b></td>
					<td><b>이름</b></td>
					<td><b>전화번호</b></td>
					<td><b>이메일</b></td>
					<td><b>소속회사</b></td>
					<td><b>과정명</b></td>
					<td><b>수강상태</b></td>
					<td><b>신청일</b></td>
					<td><b>이수일</b></td>
				</tr>
			</thead>

			<tbody id="ajaxTable">
				<c:forEach var="courseTake" items="${courseApplyList}">
					<tr align="center">
						<td><input type="checkbox" /></td>
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

				<tr align="center">
					<td><input type="checkbox" /></td>
					<td>eunjinfizz</td>
					<td>권은진</td>
					<td>01041130320</td>
					<td>eunjinfizz@gmail.com</td>
					<td>kt ds University</td>
					<td>원격_처음 시작하는 R 데이터 분석</td>
					<td>승인대기</td>
					<td>2021.04.07</td>
					<td></td>
				</tr>

				<tr align="center">
					<td><input type="checkbox" /></td>
					<td>eunjinfizz</td>
					<td>권은진</td>
					<td>01041130320</td>
					<td>eunjinfizz@gmail.com</td>
					<td>kt ds University</td>
					<td>원격_처음 시작하는 R 데이터 분석</td>
					<td>승인대기</td>
					<td>2021.04.07</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br> <br>

		<div style="margin-top: 40px; padding-bottom: 150px;">
			<button class="button_bottom" type="button">이수증출력</button>
			<button class="button_bottom" type="button">이수완료</button>
			<button class="button_bottom" type="button">신청승인</button>
		</div>


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
