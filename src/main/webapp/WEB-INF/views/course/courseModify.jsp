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
<title>과정 수정</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<style>
a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.bg-primary {
	background-color: white !important;
}

.container {
	width: 74.63%;
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
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: tomato;
	border-color: rgba(247, 94, 94, 0 .8);
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

.serarchSubject {
	display: flex;
	flex-direction: row;
}

.subject {
	display: flex;
	flex-direction: row;
}

.form-control {
	border: hidden;
	margin-left: 20px;
	width: 88%;
}

.form-select {
	border: hidden;
	width: 280px;
	display: inline-block;
	margin-right: 40px;
	margin-left: 20px;
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
	//달력picker, 키보드로도 입력가능[ex)2021/4], format: "mm/yyyy" 등 으로 변경가능 
	$(document).ready(function() {
		$('#sandbox-container input').datepicker({
			format: "yyyy-mm-dd",
            language: "ko",
            startView: 2,
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true
		});
	});
</script>
<script>
	function showPopup() { 
	  window.open("/springEx/course/syllabusList.do", "강의계획서 리스트", "width=1000, height=600, left=100, top=50"); 
	}
</script>
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
<script>
  function showPopup() { window.open("/springEx/course/syllabusList.do", "강의계획서 리스트", "width=1000, height=600, left=100, top=50"); }
</script>
<body>
	<form method="post" action="${contextPath}/course/modifyCourse.do">

		<div class="container">
			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/course/courseList.do">과정
							관리</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/course/courseRegister.do?syllabusID=${courseVO.courseID}">과정
							수정</a></li>
				</ul>
			</div>
			<input type="hidden" name="courseID" value="${courseVO.courseID}">
			<table class="table_syllabus">
				<tr>
					<th>강의명</th>
					<td><input type="text" class="form-control" placeholder="검색" id="hiddenThanksTogangsanim" onclick="showPopup();" value="${courseVO.syllabusVO.syllabusName}">
						<input type="text" class="form-control" id="syllabusID" name="syllabusID" style="display: none;" value="${courseVO.syllabusID}"></td>
               <td></td>
               <td></td>
				</tr>
				<tr>
					<th>강의시간</th>
					<td><div class="selectBox" style="text-align: left;">
                  <select class="form-select" aria-label="Default select example" name="courseTime">
                     <option value="09:00~18:00" <c:if test="${courseVO.courseTime eq '09:00~18:00'}">selected</c:if>>09:00~18:00</option>
                     <option value="19:00~22:00" <c:if test="${courseVO.courseTime eq '19:00~22:00'}">selected</c:if>>19:00~22:00</option>          
               </div></td>
               <th>교육비</th>
               <td><input type="text" class="form-control"
						placeholder="무료" name="courseFee" value="${courseVO.courseFee}"></td>
				</tr>
				<tr>
					<th>수강신청일</th>
					<td id="sandbox-container"><input type="text" class="form-control" placeholder="연/월을 선택해주세요." name="courseApplyStart" value="${courseVO.courseApplyStart}"> 
					<input type="text" class="form-control" placeholder="연/월을 선택해주세요." name="courseApplyEnd" value="${courseVO.courseApplyEnd}"></td>
				
               		<th>교육기간</th>
					<td id="sandbox-container"><input type="text" class="form-control" placeholder="연/월을 선택해주세요." name="courseStart" value="${courseVO.courseStart}"> 
					<input type="text" class="form-control" placeholder="연/월을 선택해주세요." name="courseEnd" value="${courseVO.courseEnd}"></td>
				</tr>
				<tr>
					<th>강의실정보</th>
					<td><input type="text" class="form-control"
						onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
						placeholder="강의실(숫자)을 입력하세요." name="courseRoomNumber" value="${courseVO.courseRoomNumber}"></td>
              	 	<th>수강인원수</th>
					<td><input type="text" class="form-control"
						onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
						placeholder="수강인원수(숫자)를 입력하세요." name="coursePeopleMax" value="${courseVO.coursePeopleMax}"></td>
				</tr>
			</table>

			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="btn button_bottom" type="button"
					onclick="history.back()">취소</button>
				<button class="btn button_bottom" type="submit">수정</button>
			</div>

		</div>
	</form>
</body>
</html>
