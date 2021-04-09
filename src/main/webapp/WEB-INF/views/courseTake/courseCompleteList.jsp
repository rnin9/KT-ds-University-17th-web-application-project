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



<style>
.bg-primary {
	background-color: white !important;
}

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
	margin-top:30px;
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

.btn-success {
	background-color: tomato;
	border-color: rgba(247, 94, 94, 0.8);
}


.table_syllabusList {
	border-collapse: collapse;
	font-size: 14px;
	line-height: 2.2;
	margin-top: 40px;
	text-align: center;
	/* color: #555; */
	width: 100%;
	line-height: 40px;
}

.table_syllabusList thead {
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
	padding: 6px 20px;
	font-size: 14px;
	line-height: 1.428571429;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
	color: #fff;
	background-color: tomato;
	border-color: rgba(247, 94, 94, 0.8);
	float: right;
	margin-left: 10px;
}

.form-control {
	border: hidden;
}

.form-select {
	border: hidden;
	width: 280px;
	display: inline-block;
}
</style>

</head>

<script type="text/javascript">
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}

	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
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
					<li class="on"><a href="/springEx/syllabus/syllabusList.do">강의계획서</a></li>
				</ul>
			</div>

			<div class="well-searchbox">
				<form class="form-horizontal" role="form">

					<div class="form-group">
						<div class="serarchSubject">
							<label class="searchTitle">강의분류</label>
							<div class="col-md-8">
								<select class="form-select" aria-label="Default select example"
									style="margin-right: 100px;text-align:left;">
									<option selected>-- 1차 분류를 선택하세요 --</option>
									<option value="유료과정">유료과정</option>
									<option value="재직자향상">재직자향상</option>
									<option value="채용예정자과정">채용예정자과정</option>
								</select><select class="form-select" aria-label="Default select example">
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
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="serarchSubject">
							<label class="searchTitle">강의명</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									placeholder="일부 단어만으로도 검색이 가능합니다.">
							</div>
						</div>

						<div class="col-sm-offset-4 col-sm-5"
							style="display: inline-block; text-aglin: center;">
							<button type="submit" class="button_bottom"
								style="margin-top: 10px; margin-right:50%;">검색</button>
						</div>
					</div>
				</form>
			</div>

			<table class="table_syllabusList">
				<thead>
					<tr align="center">
						<td><input type="checkbox" /></td>
						<td><b>번호</b></td>
						<td><b>분류</b></td>
						<td><b>강의명</b></td>
						<td><b>교육일수</b></td>
						<td><b>교육시간</b></td>
					</tr>
				</thead>

				<tbody id="ajaxTable">
					<c:forEach var="syllabus" items="${syllabusList}">
						<tr>
							<td><input type="checkbox"></td>
							<td>${syllabus.syllabusID}</td>
							<td>${syllabus.syllabusCategory1}>
								${syllabus.syllabusCategory2}</td>
							<td><a
								href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">${syllabus.syllabusName}</a></td>
							<td>${syllabus.syllabusTotalDays}</td>
							<td>${syllabus.syllabusTotalTime}</td>
						</tr>
					</c:forEach>

					<tr>
						<td><input type="checkbox"></td>
						<td>dddd</td>
						<td>ddddd</td>
						<td><a
							href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">ddddd</a></td>
						<td>vsvsd</td>
						<td>adfdsd</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>dddd</td>
						<td>ddddd</td>
						<td><a
							href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">ddddd</a></td>
						<td>vsvsd</td>
						<td>adfdsd</td>
					</tr>
				</tbody>
			</table>

			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="button_bottom" type="button">삭제</button>
				<button class="button_bottom"
					onClick="location.href='syllabusForm.do'">등록</button>

			</div>

			<div>여기에 페이징</div>


		</div>
	</form>
</body>
</html>
