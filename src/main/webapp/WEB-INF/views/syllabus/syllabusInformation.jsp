<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style2.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/layoutAdmin.css" />

<html>
<head>
<meta charset=UTF-8">
<title>강의계획서 정보</title>

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
</style>

</head>
<script>
function deleteSyllabus(){
	/*location.href='${contextPath}/syllabus/deleteSyllabus.do?syllabusID=${syllabusVO.syllabusID}'*/
		console.log(${syllabusVO.syllabusID});
		var syllabusID = ${syllabusVO.syllabusID};
		url="/springEx/syllabus/deleteSyllabus.do";
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				syllabusID : syllabusID
			},
			success : function(data){
				console.log("success");
				location.href='${contextPath}/syllabus/syllabusList.do';
				/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
			},
			error : function(data) {
				Swal.fire("강의계획서를 사용하는 강의가 있습니다.","","error");
				console.log("fail");
	        }
		})
	/*if (${isLogOn == true}){
		location.href='${contextPath}/syllabus/deleteSyllabus.do?syllabusID=${syllabusVO.syllabusID}'
	}
	else{
		alert("로그인 후 시도해주세요.");
	}*/
}
</script>
<script>
function modifySyllabus(){
	location.href='${contextPath}/syllabus/syllabusModifyForm.do?syllabusID=${syllabusVO.syllabusID}'
	/*if (${isLogOn == true}){
		location.href='${contextPath}/syllabus/syllabusModifyForm.do?syllabusID=${syllabusVO.syllabusID}'
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
				<li class="on"><a href="/springEx/syllabus/syllabusList.do">강의계획서
						관리</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="/springEx/syllabus/selectSyllabus.do?syllabusID=${syllabusVO.syllabusID}">강의계획서
						정보</a></li>
			</ul>
		</div>

		<table class="table_">
			<tr>
				<th>강의분류</th>
				<td>${syllabusVO.syllabusCategory1}>
					${syllabusVO.syllabusCategory2}</td>
			</tr>
			<tr>
				<th>강의명</th>
				<td>${syllabusVO.syllabusName}</td>
			</tr>
			<tr>
				<th>보고용강의명</th>
				<td>${syllabusVO.syllabusReportName}</td>
			</tr>
			<tr>
				<th>교육일수</th>
				<td>${syllabusVO.syllabusTotalDays}일</td>
			</tr>
			<tr>
				<th>교육시간</th>
				<td>${syllabusVO.syllabusTotalTime}시간</td>
			</tr>
		</table>

		<div class="containerLower" style="margin-top: 30px;">
			<div class="inform">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습개요
				</div>
				<div class="informBox">${syllabusVO.syllabusOutline}</div>
			</div>
			<div class="inform">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습목표
				</div>
				<div class="informBox">${syllabusVO.syllabusPurpose}</div>
			</div>
			<div class="inform">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습대상
				</div>
				<div class="informBox">${syllabusVO.syllabusTarget}</div>
			</div>
			<div class="inform" style="border-bottom: 1px solid #e0e0e0;">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습내용
				</div>
				<div class="informBox">${syllabusVO.syllabusContent}</div>
			</div>
		</div>
		<div style="margin-top: 50px;">
			<button class="btn btn-outline-danger" type="button"
				onClick="deleteSyllabus()">삭제</button>
			<button class="btn btn-outline-danger" type="button"
				onClick="modifySyllabus()">수정</button>
		</div>

	</div>
</body>
</html>