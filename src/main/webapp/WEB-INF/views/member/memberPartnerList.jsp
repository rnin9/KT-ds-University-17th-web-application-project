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
		var checkBtn = $(this);
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		var no = td.eq(0).text();
		var name = td.eq(1).text();
		opener.document.getElementById("hiddenThanksTogangsanim").value = no;
		opener.document.getElementById("partnerID").value = name;
		self.close();
	});
</script>

<body>

	<div class="container">
		<form method="post" action="${contextPath}/syllabus/insertSyllabus.do">

			<div class="lnb" style="margin-bottom: 40px;">
				<h2>
					<br>협력사 리스트
				</h2>
			</div>

			<span>
				<form class="form-horizontal" role="form">
					<span style="width: 71%; display: inline-block;"></span> <span><span>
							<input type="text" id="value" class="form-control"
							onKeyPress="JavaScript:enter();" placeholder="회사명 검색"
							style="border-bottom: 1px solid grey; width: 20%; display: inline-block;">
							<input type="text" style="display: none;" />
					</span> <span><button type="button" class="btn btn-outline-danger"
								onClick="filter()" style="margin-bottom: 5px;">검색</button></span></span>
				</form>
			</span>



			<table class="table_">
				<thead>
					<tr align="center">
						<td><b>사업자 번호</b></td>
						<td><b>회사명</b></td>
						<td><b>대표</b></td>
						<td><b>번호</b></td>
					</tr>
				</thead>

				<tbody id="ajaxTable">
					<c:forEach var="partners" items="${partnersName}">
						<tr class="item">
							<td id="partnerID">${partners.partnerLicenseNum}</td>
							<td class="name">${partners.partnerName} </td>
							<td>${partners.partnerCEO} </td>
							<td>${partners.partnerPhoneNumber} </td>
							<td><input type="button" value="선택" class="checkBtn"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>