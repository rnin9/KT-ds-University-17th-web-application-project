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
<title>과정 정보</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style2.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

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

button {
	float: right;
	margin-right: 10px;
}

.table_ th {
	width: 15%;
}

.table_ td {
	width: 40%;
}
</style>

</head>
<script>

function deleteCourse(){
	/*location.href='${contextPath}/course/deleteCourse.do?courseID=${courseVO.courseID}'*/

	var courseID = ${courseVO.courseID};
	url="/springEx/course/deleteCourse.do";
	$.ajax({
		url : url,
		type : 'POST',
		data : {
			courseID : courseID
		},
		success : function(data){
			console.log("success");
			location.href='${contextPath}/course/courseList.do';
			/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
		},
		error : function(data) {
			Swal.fire("과정을 신청한 사용자가 있습니다.","","error");
			console.log("fail");
	    }
	})
	/*if (${isLogOn == true}){
		location.href='${contextPath}/course/deleteCourse.do?courseID=${courseVO.courseID}'
	}
	else{
		alert("로그인 후 시도해주세요.");
	}*/
}
</script>
<script>
function modifyCourse(){
	location.href='${contextPath}/course/courseModifyForm.do?courseID=${courseVO.courseID}'
	/*if (${isLogOn == true}){
		location.href='${contextPath}/course/courseModifyForm.do?courseID=${courseVO.courseID}'
	}
	else{
		alert("로그인 후 시도해주세요.");
	}*/
}
</script>
<body>
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="/springEx/course/courseList.do">과정
						관리</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="/springEx/course/selectCourse.do?courseID=${courseVO.courseID}">과정
						정보</a></li>
			</ul>
		</div>

		<table class="table_">
			<tr>
				<th>과정명</th>
				<td style="line-height: 25px;">[${courseVO.syllabusVO.syllabusCategory1}
					> ${courseVO.syllabusVO.syllabusCategory2}]
					${courseVO.syllabusVO.syllabusName}</td>
				<th>강의실</th>
				<td>${courseVO.courseRoomNumber}호</td>
			</tr>
			<tr>
				<th>교육기간</th>
				<td>${courseVO.courseStart}~${courseVO.courseEnd}</td>
				<th>신청기간</th>
				<td>${courseVO.courseApplyStart}~${courseVO.courseApplyEnd}</td>
			</tr>
			<tr>
				<th>교육시간</th>
				<td>${courseVO.courseTime}</td>
				<th>교육비</th>
				<td>${courseVO.courseFee}</td>
			</tr>
		</table>

		<div class="containerLower" style="margin-top: 30px;">
			<div class="inform">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습개요
				</div>
				<div class="informBox">${courseVO.syllabusVO.syllabusOutline}
				</div>
			</div>
			<div class="inform">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습목표
				</div>
				<div class="informBox">${courseVO.syllabusVO.syllabusPurpose}
				</div>
			</div>
			<div class="inform">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습대상
				</div>
				<div class="informBox">${courseVO.syllabusVO.syllabusTarget}</div>
			</div>
			<div class="inform" style="border-bottom: 1px solid #e0e0e0;">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습내용
				</div>
				<div class="informBox">${courseVO.syllabusVO.syllabusContent}
				</div>
			</div>
		</div>
		<div style="margin-top: 50px;">
			<button class="btn btn-outline-danger" type="button"
				onClick="deleteCourse()">삭제</button>
			<button class="btn btn-outline-danger" type="button"
				onClick="modifyCourse()">수정</button>
		</div>
	</div>
</body>
</html>