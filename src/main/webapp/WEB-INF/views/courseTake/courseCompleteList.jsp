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
<title>강의계획서 관리</title>

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

.container {
	width: 74.62%;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

</head>

<script type="text/javascript">
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
		<form method="post" action="${contextPath}/syllabus/insertSyllabus.do">

			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/syllabus/syllabusList.do">강의계획서
							관리</a></li>
				</ul>
			</div>

			<div class="well-searchbox">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<div class="searchSubject">
							<label class="searchTitle">강의분류</label>
							<div class="col-md-8">
								<select class="form-select" aria-label="Default select example">
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
						<div class="searchSubject">
							<label class="searchTitle">강의명</label>
							<div class="col-md-8">
								<input type="text" class="form-control"
									placeholder="일부 단어만으로도 검색이 가능합니다.">
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

			<table class="table_">
				<thead>
					<tr align="center">
						<td><input type="checkbox" name="check-all" /></td>
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
							<td><input type="checkbox" name="ab"></td>
							<td>${syllabus.syllabusID}</td>
							<td>${syllabus.syllabusCategory1}>
								${syllabus.syllabusCategory2}</td>
							<td><a
								href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">${syllabus.syllabusName}</a></td>
							<td>${syllabus.syllabusTotalDays}</td>
							<td>${syllabus.syllabusTotalTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="btn button_bottom" type="button">선택강의 삭제</button>
				<button class="btn button_bottom"
					onClick="location.href='syllabusForm.do'">강의계획서 등록</button>

			</div>

			<div>여기에 페이징</div>
		</form>
	</div>
</body>
</html>