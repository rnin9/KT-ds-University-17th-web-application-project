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
<title>강의계획서 작성</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="/juliet/resources/juliet.css">
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>


<style>
.bg-primary {
	background-color: white !important;
}

.container {
	width: 80%;
	font-family: 'Noto Sans KR', sans-serif;
}

.table_syllabus {
	margin-top: 30px;
	border-collapse: collapse;
	text-align: center;
	/* color: #555; */
	width: 100%;
	line-height: 40px;
}

.table_syllabus th {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
	background-color: #f8f8f8;
	text-align: center;
	font-size: 15px;
	width: 30%;
	height: 30px;
}

.table_syllabus td {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
	text-align: center;
	font-size: 15px;
	height: 30px;
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
	background-color: rgba(247, 94, 94, 0.9);
	border-color: rgba(247, 94, 94, 0.8);
	float: right;
	margin-left: 10px;
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

.form-control {
	border: hidden;
}

.form-select {
	border: hidden;
	width: 280px;
	display: inline-block;
}

.informInputBox {
	/* overflow: hidden; */
	min-height: 220px;
	text-align: left;
	font-size: 16px;
	line-height: 30px;
	padding: 20px 60px 20px 60px;
	margin-bottom: 20px;
	margin-top: 20px;
	width: 100%;
	border: 1px solid #e4e4e4;
}
</style>

</head>

<script type="text/javascript">
	function onlyNumber(event){
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        return false;
	}
 
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	
	
</script>

<body>
	<form method="post" action="${contextPath}/syllabus/insertSyllabus.do">

		<div class="container">
			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/syllabus/selectSyllabus.do">강의계획서
							작성</a></li>
				</ul>
			</div>

			<table class="table_syllabus">
				<tr>
					<th>강좌분류</th>

					<td><div class="selectBox" style="text-align: left;">
							<select class="form-select" aria-label="Default select example"
								style="margin-right: 50px;">
								<option selected>-- 1차 분류를 선택하세요 --</option>
								<option value="유료과정">유료과정</option>
								<option value="재직자향상">재직자향상</option>
								<option value="채용예정자과정">채용예정자과정</option>
							</select> <select class="form-select" aria-label="Default select example">
								<option selected>-- 2차 분류를 선택하세요 --</option>
								<option value="OS 분야">OS 분야</option>
								<option value="IoT&모바일">IoT&모바일</option>
								<option value="SW공학">SW공학</option>
								<option value="클라우드">클라우드</option>
								<option value="웹 프로그래밍">웹 프로그래밍</option>
								<option value="빅데이터">빅데이터</option>
								<option value="non-IT">non-IT</option>
								<option value="OA">OA</option>
								<option value="분석/설계">분석/설계</option>
								<option value="프로젝트관리">프로젝트관리</option>
								<option value="오픈소스">오픈소스</option>
								<option value="모바일">모바일</option>
								<option value="보안">보안</option>
								<option value="네트워크">네트워크</option>
								<option value="프로그래밍">프로그래밍</option>
								<option value="데이터베이스">데이터베이스</option>
							</select>
						</div></td>

				</tr>
				<tr>
					<th>강좌명</th>
					<td><input type="text" class="form-control"
						placeholder="강좌명을 입력하세요." name="syllabusName"></td>
				</tr>
				<tr>
					<th>보고용강좌명</th>
					<td><input type="text" class="form-control"
						placeholder="보고용 강좌명을 입력하세요." name="syllabusReportName"></td>
				</tr>
				<tr>
					<th>교육일수</th>
					<td><input type="text" class="form-control"
						onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
						placeholder="교육일수(숫자)를 입력하세요." name="syllabusTotalDays"></td>
				</tr>
				<tr>
					<th>교육시간</th>
					<td><input type="text" class="form-control"
						onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
						placeholder="교육시간(숫자)를 입력하세요." name="syllabusTotalTime"></td>
				</tr>
			</table>

			<div class="containerLower" style="margin-top: 30px;">
				<div class="inform">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습개요
					</div>
					<textarea class="informInputBox" placeholder="학습개요를 입력하세요."></textarea>
				</div>
				<div class="inform">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습목표
					</div>
					<textarea class="informInputBox" placeholder="학습목표를 입력하세요."></textarea>
				</div>
				<div class="inform">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습대상
					</div>
					<textarea class="informInputBox" placeholder="학습대상을 입력하세요."></textarea>
				</div>
				<div class="inform" style="border-bottom: 1px solid #e0e0e0;">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습내용
					</div>
					<textarea class="informInputBox" placeholder="학습내용을 입력하세요."></textarea>
				</div>
			</div>
			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="button_bottom" type="button" onclick="history.back()">취소</button>
				<button class="button_bottom" type="button">등록</button>
			</div>

		</div>
	</form>
</body>
</html>
