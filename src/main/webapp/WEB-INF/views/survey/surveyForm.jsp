
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>


<!doctype html>
<html>
<head>
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

.bg-primary {
	background-color: white !important;
}

.container {
	width: 74.64%;
	font-family: 'Noto Sans KR', sans-serif;
}

.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	/* 	background-image:
		url("${pageContext.request.contextPath}/resources/image/sub_visual/faq.jpg");
	background-color: black;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover; */
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/faq.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
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

.cursor_test {
	cursor: pointer;
}

.navbar-brand2 {
	width: 216px;
}
</style>

<script type="text/javascript">
	function filter() {

		var value = document.getElementById("value").value.toUpperCase();
		var value2 = document.getElementById("value").value.toUpperCase();
		var value3 = document.getElementById("value").value.toUpperCase();
		var item = document.getElementsByClassName("item");
		var item2 = document.getElementsByClassName("item");
		var form_select = document.getElementsByClassName("form-select");

		for (var i = 0; i < item.length; i++) {
			var name = item[i].getElementsByClassName("name");
			if (name[0].innerText.toUpperCase().indexOf(value) > -1) {
				item[i].style.display = "table-row";
			} else {
				item[i].style.display = "none";
			}
		}
	}
</script>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/modalstyle.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<div class="sub_visual">
		<span style="color: white;">설문조사</span>
	</div>
	<div class="container">

		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="/springEx/survey/listSurvey.do">설문조사
				</a></li>
			</ul>
		</div>


		<%-- <a class="navbar-brand2" href="${contextPath}/main.do"><img
				src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
				alt="로고" /></a> --%>
		<div class="well-searchbox">
			<form class="form-horizontal" role="form">

				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">강의명</label>
						<div class="col-md-8">
							<input onkeyup="filter()" type="text" id="value"
								class="form-control" placeholder="일부 단어만으로도 검색이 가능합니다.">
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







		<table class="table_syllabusList">
			<thead>
				<tr align="center">

					<th>번호</th>
					<th>강의명</th>
					<th>시작일</th>
					<th>detail</th>

				</tr>
			</thead>

			<tbody id="ajaxTable">
				<c:forEach var="survey" items="${surveyList}">
					<tr class="item">
						<td>${survey.syllabusID}</td>
						<td class="name">${survey.syllabusName}</td>
						<td>${survey.courseVO.courseStart}</td>
						<td><a
							href="${contextPath}/survey/surveyDetailForm.do?courseID=${survey.courseVO.courseID}">상세</a></td>

					</tr>
				</c:forEach>

			</tbody>

		</table>
		<br>
		<button type="button"
			style="font-size: 1.05em; text-align: right; font-weight: bolder"
			class="btn btn-primary" data-toggle="modal" data-target="#myModal">작성하기</button>



	</div>



	

</body>
</html>