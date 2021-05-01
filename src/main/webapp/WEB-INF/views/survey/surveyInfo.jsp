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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/layoutAdmin.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.bg-primary {
	background-color: white !important;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	/* font-family: 'Noto Sans KR', sans-serif; */
	display: flex;
	flex-wrap: wrap;
	width: 80%;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 15%;
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
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	margin-top: 30px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
	margin-top: 30px;
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
<script>
function handleModify() { 
	   Swal.fire({               /* 수정실행 확인 */
	     title:'정보 수정',
	     text: '해당 내용으로 수정하시겠습니까?',
	     showCancelButton: true,
	     icon:"warning",
	     confirmButtonColor: '#3085d6',
	     cancelButtonColor: '#d33',
	     confirmButtonText: 'Save!'
	   }).then((result) => {
	     /* Read more about isConfirmed, isDenied below */
	     if (result.isConfirmed) {
	       Swal.fire('수정완료!', '', 'success').then(()=>{
	           $("#modForm").submit();
	       })
	     } else{
	         return;     /* 수정실행 취소 */
	     }
	   })
	}
</script>

</head>



<body>
	<form id="modForm" method="post"
		action="${contextPath}/survey/surveyModify.do">

		<div class="container">
			<div class="pageIntro">설문 수정</div>
			<input type="hidden" name="courseID"

					value="${surveyInfoList.courseID}">

			<table class="table_" style="text-align: left">
				<tr>
					<th>강의명</th>
					<td style="text-align: left">courseID=${surveyInfoList.courseID},${surveyInfoList.syllabusVO.syllabusName}
					</td>
				</tr>
				<tr>
					<th>질문분류</th>
					<td><div class="selectBox" style="text-align: left;">
							<select class="form-select" aria-label="Default select example"
								id="questionSelect" name="question" size='1'
								style="width: 100%;">
								<c:forEach var="question" items="${questionList}">
									<option id="questionSelect" value="${question.questionName}">${question.questionName}</option>
								</c:forEach>
							</select>
						</div></td>
				</tr>
			</table>
			
			
			<table class="table_" style="text-align: left">
				<tr>
					<th>1번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q1}" name="Q1" id="Q1"
						value="${surveyInfoList.q1}"></td>
				</tr>
				<tr>
					<th>2번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q2}" name="Q2" id="Q2"
						value="${surveyInfoList.q2}"></td>
				</tr>
				<tr>
					<th>3번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q3}" name="Q3" id="Q3"
						value="${surveyInfoList.q3}"></td>
				</tr>
				<tr>
					<th>4번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q4}" name="Q4" id="Q4"
						value="${surveyInfoList.q4}"></td>
				</tr>
				<tr>
					<th>5번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q5}" name="Q5" id="Q5"
						value="${surveyInfoList.q5}"></td>
				</tr>
				<tr>
					<th>6번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q6}" name="Q6" id="Q6"
						value="${surveyInfoList.q6}"></td>
				</tr>
				<tr>
					<th>7번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q7}" name="Q7" id="Q7"
						value="${surveyInfoList.q7}"></td>
				</tr>
				<tr>
					<th>8번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q8}" name="Q8" id="Q8"
						value="${surveyInfoList.q8}"></td>
				</tr>
				<tr>
					<th>9번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q9}" name="Q9" id="Q19"
						value="${surveyInfoList.q9}"></td>
				</tr>
				<tr>
					<th>10번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q10}" name="Q10" id="Q10"
						value="${surveyInfoList.q10}"></td>
				</tr>
				<tr>
					<th>11번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q11}" name="Q11" id="Q11"
						value="${surveyInfoList.q11}"></td>
				</tr>
				<tr>
					<th>12번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q12}" name="Q12" id="Q12"
						value="${surveyInfoList.q12}"></td>
				</tr>
				<tr>
					<th>13번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q13}" name="Q13" id="Q13"
						value="${surveyInfoList.q13}"></td>
				</tr>
				<tr>
					<th>14번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q14}" name="Q14" id="Q14"
						value="${surveyInfoList.q14}"></td>
				</tr>
				<tr>
					<th>15번 질문</th>
					<td><input type="text" class="form-control"
						placeholder="${surveyInfoList.q15}" name="Q15" id="Q15"
						value="${surveyInfoList.q15}"></td>
				</tr>
			</table>


			<div style="margin-top: 50px; float: right; text-align: right;">
				<input class="btn btn-outline-danger" id="submitbtn" type="button"
					value="수정하기" onclick='handleModify()'>
				<button class="btn btn-outline-danger" type="button"
					onclick="history.back()">취소</button>
			</div>



		</div>
	</form>
</body>
<script type="text/javascript">
	$(function() {

		$("#questionSelect")
				.click(
						function() {
							if ($("#questionSelect").val() == "${questionList[0].questionName}") {
								$("#Q1").val("${questionList[0].question1}");
								$("#Q2").val("${questionList[0].question2}");
								$("#Q3").val("${questionList[0].question3}");
								$("#Q4").val("${questionList[0].question4}");
								$("#Q5").val("${questionList[0].question5}");
								$("#Q6").val("${questionList[0].question6}");
								$("#Q7").val("${questionList[0].question7}");
								$("#Q8").val("${questionList[0].question8}");
								$("#Q9").val("${questionList[0].question9}");
								$("#Q10").val("${questionList[0].question10}");
								$("#Q11").val("${questionList[0].question11}");
								$("#Q12").val("${questionList[0].question12}");
								$("#Q13").val("${questionList[0].question13}");
								$("#Q14").val("${questionList[0].question14}");
								$("#Q15").val("${questionList[0].question15}");
							} else if ($("#questionSelect").val() == "${questionList[1].questionName}") {
								$("#Q1").val("${questionList[1].question1}");
								$("#Q2").val("${questionList[1].question2}");
								$("#Q3").val("${questionList[1].question3}");
								$("#Q4").val("${questionList[1].question4}");
								$("#Q5").val("${questionList[1].question5}");
								$("#Q6").val("${questionList[1].question6}");
								$("#Q7").val("${questionList[1].question7}");
								$("#Q8").val("${questionList[1].question8}");
								$("#Q9").val("${questionList[1].question9}");
								$("#Q10").val("${questionList[1].question10}");
								$("#Q11").val("${questionList[1].question11}");
								$("#Q12").val("${questionList[1].question12}");
								$("#Q13").val("${questionList[1].question13}");
								$("#Q14").val("${questionList[1].question14}");
								$("#Q15").val("${questionList[1].question15}");
							} else if ($("#questionSelect").val() == "${questionList[2].questionName}") {
								$("#Q1").val("${questionList[2].question1}");
								$("#Q2").val("${questionList[2].question2}");
								$("#Q3").val("${questionList[2].question3}");
								$("#Q4").val("${questionList[2].question4}");
								$("#Q5").val("${questionList[2].question5}");
								$("#Q6").val("${questionList[2].question6}");
								$("#Q7").val("${questionList[2].question7}");
								$("#Q8").val("${questionList[2].question8}");
								$("#Q9").val("${questionList[2].question9}");
								$("#Q10").val("${questionList[2].question10}");
								$("#Q11").val("${questionList[2].question11}");
								$("#Q12").val("${questionList[2].question12}");
								$("#Q13").val("${questionList[2].question13}");
								$("#Q14").val("${questionList[2].question14}");
								$("#Q15").val("${questionList[2].question15}");
							}else if ($("#questionSelect").val() == "${questionList[3].questionName}") {
								$("#Q1").val("${questionList[3].question1}");
								$("#Q2").val("${questionList[3].question2}");
								$("#Q3").val("${questionList[3].question3}");
								$("#Q4").val("${questionList[3].question4}");
								$("#Q5").val("${questionList[3].question5}");
								$("#Q6").val("${questionList[3].question6}");
								$("#Q7").val("${questionList[3].question7}");
								$("#Q8").val("${questionList[3].question8}");
								$("#Q9").val("${questionList[3].question9}");
								$("#Q10").val("${questionList[3].question10}");
								$("#Q11").val("${questionList[3].question11}");
								$("#Q12").val("${questionList[3].question12}");
								$("#Q13").val("${questionList[3].question13}");
								$("#Q14").val("${questionList[3].question14}");
								$("#Q15").val("${questionList[3].question15}");
							}else if ($("#questionSelect").val() == "${questionList[4].questionName}") {
								$("#Q1").val("${questionList[4].question1}");
								$("#Q2").val("${questionList[4].question2}");
								$("#Q3").val("${questionList[4].question3}");
								$("#Q4").val("${questionList[4].question4}");
								$("#Q5").val("${questionList[4].question5}");
								$("#Q6").val("${questionList[4].question6}");
								$("#Q7").val("${questionList[4].question7}");
								$("#Q8").val("${questionList[4].question8}");
								$("#Q9").val("${questionList[4].question9}");
								$("#Q10").val("${questionList[4].question10}");
								$("#Q11").val("${questionList[4].question11}");
								$("#Q12").val("${questionList[4].question12}");
								$("#Q13").val("${questionList[4].question13}");
								$("#Q14").val("${questionList[4].question14}");
								$("#Q15").val("${questionList[4].question15}");
							}else if ($("#questionSelect").val() == "${questionList[5].questionName}") {
								$("#Q1").val("${questionList[5].question1}");
								$("#Q2").val("${questionList[5].question2}");
								$("#Q3").val("${questionList[5].question3}");
								$("#Q4").val("${questionList[5].question4}");
								$("#Q5").val("${questionList[5].question5}");
								$("#Q6").val("${questionList[5].question6}");
								$("#Q7").val("${questionList[5].question7}");
								$("#Q8").val("${questionList[5].question8}");
								$("#Q9").val("${questionList[5].question9}");
								$("#Q10").val("${questionList[5].question10}");
								$("#Q11").val("${questionList[5].question11}");
								$("#Q12").val("${questionList[5].question12}");
								$("#Q13").val("${questionList[5].question13}");
								$("#Q14").val("${questionList[5].question14}");
								$("#Q15").val("${questionList[5].question15}");
							}else if ($("#questionSelect").val() == "${questionList[6].questionName}") {
								$("#Q1").val("${questionList[6].question1}");
								$("#Q2").val("${questionList[6].question2}");
								$("#Q3").val("${questionList[6].question3}");
								$("#Q4").val("${questionList[6].question4}");
								$("#Q5").val("${questionList[6].question5}");
								$("#Q6").val("${questionList[6].question6}");
								$("#Q7").val("${questionList[6].question7}");
								$("#Q8").val("${questionList[6].question8}");
								$("#Q9").val("${questionList[6].question9}");
								$("#Q10").val("${questionList[6].question10}");
								$("#Q11").val("${questionList[6].question11}");
								$("#Q12").val("${questionList[6].question12}");
								$("#Q13").val("${questionList[6].question13}");
								$("#Q14").val("${questionList[6].question14}");
								$("#Q15").val("${questionList[6].question15}");
							}else if ($("#questionSelect").val() == "${questionList[7].questionName}") {
								$("#Q1").val("${questionList[7].question1}");
								$("#Q2").val("${questionList[7].question2}");
								$("#Q3").val("${questionList[7].question3}");
								$("#Q4").val("${questionList[7].question4}");
								$("#Q5").val("${questionList[7].question5}");
								$("#Q6").val("${questionList[7].question6}");
								$("#Q7").val("${questionList[7].question7}");
								$("#Q8").val("${questionList[7].question8}");
								$("#Q9").val("${questionList[7].question9}");
								$("#Q10").val("${questionList[7].question10}");
								$("#Q11").val("${questionList[7].question11}");
								$("#Q12").val("${questionList[7].question12}");
								$("#Q13").val("${questionList[7].question13}");
								$("#Q14").val("${questionList[7].question14}");
								$("#Q15").val("${questionList[7].question15}");
							}else if ($("#questionSelect").val() == "${questionList[8].questionName}") {
								$("#Q1").val("${questionList[8].question1}");
								$("#Q2").val("${questionList[8].question2}");
								$("#Q3").val("${questionList[8].question3}");
								$("#Q4").val("${questionList[8].question4}");
								$("#Q5").val("${questionList[8].question5}");
								$("#Q6").val("${questionList[8].question6}");
								$("#Q7").val("${questionList[8].question7}");
								$("#Q8").val("${questionList[8].question8}");
								$("#Q9").val("${questionList[8].question9}");
								$("#Q10").val("${questionList[8].question10}");
								$("#Q11").val("${questionList[8].question11}");
								$("#Q12").val("${questionList[8].question12}");
								$("#Q13").val("${questionList[8].question13}");
								$("#Q14").val("${questionList[8].question14}");
								$("#Q15").val("${questionList[8].question15}");
							}else if ($("#questionSelect").val() == "${questionList[9].questionName}") {
								$("#Q1").val("${questionList[9].question1}");
								$("#Q2").val("${questionList[9].question2}");
								$("#Q3").val("${questionList[9].question3}");
								$("#Q4").val("${questionList[9].question4}");
								$("#Q5").val("${questionList[9].question5}");
								$("#Q6").val("${questionList[9].question6}");
								$("#Q7").val("${questionList[9].question7}");
								$("#Q8").val("${questionList[9].question8}");
								$("#Q9").val("${questionList[9].question9}");
								$("#Q10").val("${questionList[9].question10}");
								$("#Q11").val("${questionList[9].question11}");
								$("#Q12").val("${questionList[9].question12}");
								$("#Q13").val("${questionList[9].question13}");
								$("#Q14").val("${questionList[9].question14}");
								$("#Q15").val("${questionList[9].question15}");
							}else if ($("#questionSelect").val() == "${questionList[10].questionName}") {
								$("#Q1").val("${questionList[10].question1}");
								$("#Q2").val("${questionList[10].question2}");
								$("#Q3").val("${questionList[10].question3}");
								$("#Q4").val("${questionList[10].question4}");
								$("#Q5").val("${questionList[10].question5}");
								$("#Q6").val("${questionList[10].question6}");
								$("#Q7").val("${questionList[10].question7}");
								$("#Q8").val("${questionList[10].question8}");
								$("#Q9").val("${questionList[10].question9}");
								$("#Q10").val("${questionList[10].question10}");
								$("#Q11").val("${questionList[10].question11}");
								$("#Q12").val("${questionList[10].question12}");
								$("#Q13").val("${questionList[10].question13}");
								$("#Q14").val("${questionList[10].question14}");
								$("#Q15").val("${questionList[10].question15}");
							}else if ($("#questionSelect").val() == "${questionList[11].questionName}") {
								$("#Q1").val("${questionList[11].question1}");
								$("#Q2").val("${questionList[11].question2}");
								$("#Q3").val("${questionList[11].question3}");
								$("#Q4").val("${questionList[11].question4}");
								$("#Q5").val("${questionList[11].question5}");
								$("#Q6").val("${questionList[11].question6}");
								$("#Q7").val("${questionList[11].question7}");
								$("#Q8").val("${questionList[11].question8}");
								$("#Q9").val("${questionList[11].question9}");
								$("#Q10").val("${questionList[11].question10}");
								$("#Q11").val("${questionList[11].question11}");
								$("#Q12").val("${questionList[11].question12}");
								$("#Q13").val("${questionList[11].question13}");
								$("#Q14").val("${questionList[11].question14}");
								$("#Q15").val("${questionList[11].question15}");
							}else if ($("#questionSelect").val() == "${questionList[12].questionName}") {
								$("#Q1").val("${questionList[12].question1}");
								$("#Q2").val("${questionList[12].question2}");
								$("#Q3").val("${questionList[12].question3}");
								$("#Q4").val("${questionList[12].question4}");
								$("#Q5").val("${questionList[12].question5}");
								$("#Q6").val("${questionList[12].question6}");
								$("#Q7").val("${questionList[12].question7}");
								$("#Q8").val("${questionList[12].question8}");
								$("#Q9").val("${questionList[12].question9}");
								$("#Q10").val("${questionList[12].question10}");
								$("#Q11").val("${questionList[12].question11}");
								$("#Q12").val("${questionList[12].question12}");
								$("#Q13").val("${questionList[12].question13}");
								$("#Q14").val("${questionList[12].question14}");
								$("#Q15").val("${questionList[12].question15}");
							}else if ($("#questionSelect").val() == "${questionList[13].questionName}") {
								$("#Q1").val("${questionList[13].question1}");
								$("#Q2").val("${questionList[13].question2}");
								$("#Q3").val("${questionList[13].question3}");
								$("#Q4").val("${questionList[13].question4}");
								$("#Q5").val("${questionList[13].question5}");
								$("#Q6").val("${questionList[13].question6}");
								$("#Q7").val("${questionList[13].question7}");
								$("#Q8").val("${questionList[13].question8}");
								$("#Q9").val("${questionList[13].question9}");
								$("#Q10").val("${questionList[13].question10}");
								$("#Q11").val("${questionList[13].question11}");
								$("#Q12").val("${questionList[13].question12}");
								$("#Q13").val("${questionList[13].question13}");
								$("#Q14").val("${questionList[13].question14}");
								$("#Q15").val("${questionList[13].question15}");
							}else if ($("#questionSelect").val() == "${questionList[14].questionName}") {
								$("#Q1").val("${questionList[14].question1}");
								$("#Q2").val("${questionList[14].question2}");
								$("#Q3").val("${questionList[14].question3}");
								$("#Q4").val("${questionList[14].question4}");
								$("#Q5").val("${questionList[14].question5}");
								$("#Q6").val("${questionList[14].question6}");
								$("#Q7").val("${questionList[14].question7}");
								$("#Q8").val("${questionList[14].question8}");
								$("#Q9").val("${questionList[14].question9}");
								$("#Q10").val("${questionList[14].question10}");
								$("#Q11").val("${questionList[14].question11}");
								$("#Q12").val("${questionList[14].question12}");
								$("#Q13").val("${questionList[14].question13}");
								$("#Q14").val("${questionList[14].question14}");
								$("#Q15").val("${questionList[14].question15}");
							}else if ($("#questionSelect").val() == "${questionList[15].questionName}") {
								$("#Q1").val("${questionList[15].question1}");
								$("#Q2").val("${questionList[15].question2}");
								$("#Q3").val("${questionList[15].question3}");
								$("#Q4").val("${questionList[15].question4}");
								$("#Q5").val("${questionList[15].question5}");
								$("#Q6").val("${questionList[15].question6}");
								$("#Q7").val("${questionList[15].question7}");
								$("#Q8").val("${questionList[15].question8}");
								$("#Q9").val("${questionList[15].question9}");
								$("#Q10").val("${questionList[15].question10}");
								$("#Q11").val("${questionList[15].question11}");
								$("#Q12").val("${questionList[15].question12}");
								$("#Q13").val("${questionList[15].question13}");
								$("#Q14").val("${questionList[15].question14}");
								$("#Q15").val("${questionList[15].question15}");
							}else if ($("#questionSelect").val() == "${questionList[16].questionName}") {
								$("#Q1").val("${questionList[16].question1}");
								$("#Q2").val("${questionList[16].question2}");
								$("#Q3").val("${questionList[16].question3}");
								$("#Q4").val("${questionList[16].question4}");
								$("#Q5").val("${questionList[16].question5}");
								$("#Q6").val("${questionList[16].question6}");
								$("#Q7").val("${questionList[16].question7}");
								$("#Q8").val("${questionList[16].question8}");
								$("#Q9").val("${questionList1[16].question9}");
								$("#Q10").val("${questionList[16].question10}");
								$("#Q11").val("${questionList[16].question11}");
								$("#Q12").val("${questionList[16].question12}");
								$("#Q13").val("${questionList[16].question13}");
								$("#Q14").val("${questionList[16].question14}");
								$("#Q15").val("${questionList[16].question15}");
							}
						});
	});
</script>
</html>
