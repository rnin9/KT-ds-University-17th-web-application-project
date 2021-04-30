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
<title>강의계획서 등록</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style2.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/layoutAdmin.css" />


<style>
a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.container {
	/* font-family: 'Noto Sans KR', sans-serif;
	margin-left: 15%;
	position: relative; */
	display: flex;
	width: 80%;
	margin-left: 15%;
	flex-wrap: wrap;
	justify-content: space-around;
	flex-direction: column;
	font-family: 'Noto Sans KR';
}

button {
	float: right;
	margin-right: 10px;
}
</style>

</head>

<script type="text/javascript">
	//교육일수랑 교육시간에 숫자만 들어가게 하는 함수
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
					<li class="on"><a href="/springEx/syllabus/syllabusList.do">강의계획서
							관리</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/syllabus/syllabusForm.do">강의계획서
							등록</a></li>
				</ul>
			</div>

			<table class="table_">
				<tr>
					<th>강의분류</th>

					<td><div class="selectBox" style="text-align: left;">
							<select class="form-select" aria-label="Default select example"
								name="syllabusCategory1">
								<option selected>-- 1차 분류를 선택하세요 --</option>
								<option value="재직자향상">재직자향상</option>
								<option value="채용예정자">채용예정자</option>
							</select> <select class="form-select" aria-label="Default select example"
								name="syllabusCategory2">
								<option selected>-- 2차 분류를 선택하세요 --</option>
								<option value="OS 분야">OS 분야</option>
								<option value="IoTchr(38)모바일">IoT&모바일</option>
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
					<th>강의명</th>
					<td><input type="text" class="form-control"
						placeholder="강좌명을 입력하세요." name="syllabusName"></td>
				</tr>
				<tr>
					<th>보고용강의명</th>
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
					<textarea class="informInputBox" placeholder="학습개요를 입력하세요."
						name="syllabusOutline"></textarea>
				</div>
				<div class="inform">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습목표
					</div>
					<textarea class="informInputBox" placeholder="학습목표를 입력하세요."
						name="syllabusPurpose"></textarea>
				</div>
				<div class="inform">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습대상
					</div>
					<textarea class="informInputBox" placeholder="학습대상을 입력하세요."
						name="syllabusTarget"></textarea>
				</div>
				<div class="inform" style="border-bottom: 1px solid #e0e0e0;">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습내용
					</div>
					<textarea class="informInputBox" placeholder="학습내용을 입력하세요."
						name="syllabusContent"></textarea>
				</div>
			</div>
			<div style="margin-top: 50px;">
				<button class="btn btn-outline-danger" type="button"
					onclick="history.back()">취소</button>
				<button class="btn btn-outline-danger" type="submit">등록</button>
			</div>

		</div>
	</form>

</body>
</html>
