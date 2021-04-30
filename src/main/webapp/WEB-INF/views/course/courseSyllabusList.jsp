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

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style>
a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>

</head>

<script type="text/javascript">
	function filter() {

		var value = document.getElementById("value").value.toUpperCase();
		var item = document.getElementsByClassName("item");

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
<script type="text/javascript">
	function enter() {
		// 엔터키의 코드는 13입니다.
		if (event.keyCode == 13) {
			filter() // 실행할 이벤트
		}
	}
</script>
<script>
	$(document).on("click", "input[class=checkBtn]", function() {
		console.log(123123);
		var checkBtn = $(this);
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		var no = td.eq(0).text();
		var name = td.eq(2).text();
		opener.document.getElementById("syllabusID").value = no;
		opener.document.getElementById("hiddenThanksTogangsanim").value = name;
		self.close();
	});
	/*function getSyllabusID(){
	   
	   var checkBtn = $(this);
	   var tr = checkBtn.parent().parent();
	   console.log(tr);
	   var td = tr.children();
	   var no = td.eq(0).text();
	   console.log(no);
	   opener.document.getElementById("syllabusID").value = no;
	   self.close();
	}*/
</script>

<body>

	<div class="container">
		<form method="post" action="${contextPath}/syllabus/insertSyllabus.do">

			<div class="lnb" style="margin-bottom: 40px;">
				<h2>
					<br>강의계획서 리스트
				</h2>
			</div>

			<span>
				<form class="form-horizontal" role="form">
					<span style="width: 71%; display: inline-block;"></span> <span><span>
							<input type="text" id="value" class="form-control"
							onKeyPress="JavaScript:enter();" placeholder="강의명"
							style="border-bottom: 1px solid grey; width: 20%; display: inline-block;">
							<input type="text" style="display: none;" />
					</span> <span><button type="button" class="btn btn-outline-danger"
								onClick="filter()" style="margin-bottom: 5px;">검색</button></span></span>
				</form>
			</span>

			<!-- 		<div>
				<form class="form-horizontal" role="form">

					<span class="searchTitle">강의명</span>
					<div class="form-group">
						<div class="serarchSubject">

							<div class="col-md-8">
								<input type="text" id="value" class="form-control"
									onKeyPress="JavaScript:enter();"
									placeholder="일부 단어만으로도 검색이 가능합니다."> <input type="text"
									style="display: none;" />
							</div>
						</div>

						<div class="col-sm-offset-4 col-sm-5"
							style="display: inline-block; text-aglin: center;">
							<button type="button" class="btn btn-outline-danger"
								onClick="filter()" style="margin-top: 10px;">검색</button>
						</div>
					</div>
				</form>
			</div> -->

			<table class="table_">
				<thead>
					<tr align="center">
						<td><b>번호</b></td>
						<td><b>분류</b></td>
						<td><b>강의명</b></td>
						<td><b>교육일수</b></td>
						<td><b>교육시간</b></td>
						<td><b>선택</b></td>
					</tr>
				</thead>

				<tbody id="ajaxTable">
					<c:forEach var="syllabus" items="${syllabusList}">
						<tr class="item">
							<td id="syllabusID">${syllabus.syllabusID}</td>
							<td>${syllabus.syllabusCategory1}>
								${syllabus.syllabusCategory2}</td>
							<td class="name">${syllabus.syllabusName}</td>
							<td>${syllabus.syllabusTotalDays}</td>
							<td>${syllabus.syllabusTotalTime}</td>
							<!--<td><input type="button" value="선택" onclick="getSyllabusID()"></td>-->
							<td><input type="button" value="선택" class="checkBtn"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>