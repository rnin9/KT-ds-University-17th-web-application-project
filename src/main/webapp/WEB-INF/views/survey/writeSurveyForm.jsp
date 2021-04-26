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



<body>
	<form method="post" action="${contextPath}/survey/surveyInsert.do">

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

			<table class="table_syllabus">
			<h1>courseID= ${courseVO.courseID},${courseVO.syllabusVO.syllabusName}</h1>
			<input type="hidden" name="courseID" value="${courseVO.courseID}">

				<tr>
					<th>1번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="1번 질문을 입력하세요." name="Q1" required="required"></td>
				</tr>
				<tr>
					<th>2번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="2번 질문을 입력하세요." name="Q2" required="required"></td>
				</tr>
				<tr>
					<th>3번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="3번 질문을 입력하세요." name="Q3" required="required"></td>
				</tr>
				<tr>
					<th>4번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="4번 질문을 입력하세요." name="Q4" required="required"></td>
				</tr>
				<tr>
					<th>5번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="5번 질문을 입력하세요." name="Q5" required="required"></td>
				</tr>
				<tr>
					<th>6번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="6번 질문을 입력하세요." name="Q6" required="required"></td>
				</tr>
				<tr>
					<th>7번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="7번 질문을 입력하세요." name="Q7" required="required"></td>
				</tr>
				<tr>
					<th>8번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="8번 질문을 입력하세요." name="Q8" required="required"></td>
				</tr>
				<tr>
					<th>9번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="9번 질문을 입력하세요." name="Q9" required="required"></td>
				</tr>
				<tr>
					<th>10번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="10번 질문을 입력하세요." name="Q10" required="required"></td>
				</tr>
				<tr>
					<th>11번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="11번 질문을 입력하세요." name="Q11" required="required"></td>
				</tr>
				<tr>
					<th>12번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="12번 질문을 입력하세요." name="Q12" required="required"></td>
				</tr>
				<tr>
					<th>13번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="13번 질문을 입력하세요." name="Q13" required="required"></td>
				</tr>
				<tr>
					<th>14번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="14번 질문을 입력하세요." name="Q14" required="required"></td>
				</tr>
				<tr>
					<th>15번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="15번 질문을 입력하세요." name="Q15" required="required"></td>
				</tr>
			</table>

			
			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="btn button_bottom" type="button"
					onclick="history.back()">취소</button>
				<button class="btn button_bottom" type="submit">등록</button>
			</div>

		</div>
	</form>
</body>
</html>
