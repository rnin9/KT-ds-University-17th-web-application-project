<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<title>채용공고</title>


<style>
.selectRadio {
	transition: background-color 200ms cubic-bezier(0.0, 0.0, 0.2, 1);
	background-color: #fff;
	border: 1px solid #dadce0;
	border-radius: 8px;
	margin-bottom: 12px;
	padding: 24px;
	page-break-inside: avoid;
	word-wrap: break-word;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.bg-primary {
	background-color: white !important;
}

.container {
	width: 100%;
	font-family: 'Noto Sans KR', sans-serif;
}

#container1 { /* 이름 밑에 속성들을 감싸서 적용 */
	width:70%;
	margin: 10px;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
	border: 0px solid #bcbcbc;
	background-color: #f7f7f7;
	position: relative;
	border-radius: 3px;
}

#container2 {
	text-align: center;
}

.container4 { /* 이름 밑에 속성들을 감싸서 적용 */
	width:70%;
	margin: 10px;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
	border: 0px solid #bcbcbc;
	background-color: #f7f7f7;
	position: relative;
	border-radius: 3px;
}

input[type=radio] {
	/* Double-sized Checkboxes */
	-ms-transform: scale(1.5); /* IE */
	-moz-transform: scale(1.5); /* FF */
	-webkit-transform: scale(1.5); /* Safari and Chrome */
	-o-transform: scale(1.5); /* Opera */
	padding: 5px;
	font-size: 17px;
	width: 15px;
	height: 15px;
	padding-left: 5px;
	margin-left: 10px;
	margin-right: 10px;
}
.textarea_test {
	margin-top: 10px;
	resize: none;
	line-height: 30px;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	overflow-y: hidden;
	height: 30px;
	border: 1px solid #E0E0E0;
	outline: none;
}

.textarea_test:focus {
	border-color: dodgerBlue;
	box-shadow: 0 0 8px 0 dodgerBlue;
}
</style>
</head>
<body>
	<div class="container">
		<form action="${contextPath}/survey/insertSurvey.do"
			accept-charset="UTF-8" method="POST">
			<div id="container1">
				<a class="navbar-brand" href="${contextPath}/main.do"><img
					src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
					alt="로고" style="width: 95px; height: 30px;" /></a><br>
				<h4 style="text-align: center; margin-top: 10px;">${allSurveyList.syllabusVO.syllabusName}</h4>
				<b style="float: right; font-size: 12px">(5점 리쿼트 척도 : 전혀그렇지
					않다=1점, 매우 그렇다=5점)</b> <br>
				<br> <label>1. ${getQuestion.q1}</label><br> <input
					type="hidden" name="userId" value="${myInfo.userId}"> <input
					type="hidden" name="courseID" value="${allSurveyList.courseID}">

				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer1"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer1" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer1" value="보통"> <input type="radio" id="Q"
							name="answer1" value="그렇다"> <input type="radio" id="Q"
							name="answer1" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 2. ${getQuestion.q2}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer2"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer2" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer2" value="보통"> <input type="radio" id="Q"
							name="answer2" value="그렇다"> <input type="radio" id="Q"
							name="answer2" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 3. ${getQuestion.q3}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer3"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer3" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer3" value="보통"> <input type="radio" id="Q"
							name="answer3" value="그렇다"> <input type="radio" id="Q"
							name="answer3" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 4. ${getQuestion.q4}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer4"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer4" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer4" value="보통"> <input type="radio" id="Q"
							name="answer4" value="그렇다"> <input type="radio" id="Q"
							name="answer4" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 5. ${getQuestion.q5}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer5"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer5" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer5" value="보통"> <input type="radio" id="Q"
							name="answer5" value="그렇다"> <input type="radio" id="Q"
							name="answer5" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 6. ${getQuestion.q6}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer6"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer6" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer6" value="보통"> <input type="radio" id="Q"
							name="answer6" value="그렇다"> <input type="radio" id="Q"
							name="answer6" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 7. ${getQuestion.q7}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer7"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer7" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer7" value="보통"> <input type="radio" id="Q"
							name="answer7" value="그렇다"> <input type="radio" id="Q"
							name="answer7" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 8. ${getQuestion.q8}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer8"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer8" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer8" value="보통"> <input type="radio" id="Q"
							name="answer8" value="그렇다"> <input type="radio" id="Q"
							name="answer8" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 9. ${getQuestion.q9}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer9"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer9" value="그렇지 않다"> <input type="radio" id="Q"
							name="answer9" value="보통"> <input type="radio" id="Q"
							name="answer9" value="그렇다"> <input type="radio" id="Q"
							name="answer9" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 10. ${getQuestion.q10}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer10"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer10" value="그렇지 않다"> <input type="radio"
							id="Q" name="answer10" value="보통"> <input type="radio"
							id="Q" name="answer10" value="그렇다"> <input type="radio"
							id="Q" name="answer10" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 11. ${getQuestion.q11}</label><br>
				<div id="container2">
					<div class="selectRadio" required>
						전혀그렇지 않다 <input type="radio" id="Q" name="answer11"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer11" value="그렇지 않다"> <input type="radio"
							id="Q" name="answer11" value="보통"> <input type="radio"
							id="Q" name="answer11" value="그렇다"> <input type="radio"
							id="Q" name="answer11" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 12. ${getQuestion.q12}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer12"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer12" value="그렇지 않다"> <input type="radio"
							id="Q" name="answer12" value="보통"> <input type="radio"
							id="Q" name="answer12" value="그렇다"> <input type="radio"
							id="Q" name="answer12" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 13. ${getQuestion.q13}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer13"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer13" value="그렇지 않다"> <input type="radio"
							id="Q" name="answer13" value="보통"> <input type="radio"
							id="Q" name="answer13" value="그렇다"> <input type="radio"
							id="Q" name="answer13" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 14. ${getQuestion.q14}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer14"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer14" value="그렇지 않다"> <input type="radio"
							id="Q" name="answer14" value="보통"> <input type="radio"
							id="Q" name="answer14" value="그렇다"> <input type="radio"
							id="Q" name="answer14" value="매우 그렇다">매우 그렇다
					</div>
				</div>
				<label> 15. ${getQuestion.q15}</label><br>

				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer15"
							value="전혀 그렇지 않다" required> <input type="radio" id="Q"
							name="answer15" value="그렇지 않다"> <input type="radio"
							id="Q" name="answer15" value="보통"> <input type="radio"
							id="Q" name="answer15" value="그렇다"> <input type="radio"
							id="Q" name="answer15" value="매우 그렇다">매우 그렇다
					</div>
				</div>
			</div>
<hr>
			<div class="container4">
				<label> 16.본 교육과 나의 업무 연관 정도</label><br>
				<div id="container2">
					<div class="selectRadio">
						100~81% <input type="radio" id="Q" name="answer16"
							value="100~81%" required> 80~61% <input type="radio"
							id="Q" name="answer16" value="80~61%"> 60~41% <input
							type="radio" id="Q" name="answer16" value="60~41%"> 40~21% <input
							type="radio" id="Q" name="answer16" value="40~21%"> 20미만 <input
							type="radio" id="Q" name="answer16" value="20미만">
					</div>
				</div>
				<label> 17.컨소시엄 교육과정을 알게 된 경로</label><br>
				<div id="container2">
					<div class="selectRadio">
						회사 <input type="radio" id="Q" name="answer17"
							value="회사" required> 컨소시엄 홈페이지 <input type="radio"
							id="Q" name="answer17" value="컨소시엄 홈페이지"> ktds 홍보메일 <input
							type="radio" id="Q" name="answer17" value="ktds 홍보메일"> SNS <input
							type="radio" id="Q" name="answer17" value="SNS"> 기타 <input
							type="radio" id="Q" name="answer17" value="기타">
					</div>
				</div>
				<label> 18.본 과정의 좋았던 점</label><br>
				<div id="container2">
					<div class="selectRadio">
						<textarea class="textarea_test" name="answer18"
							id="search_ssh_command"
							onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';"></textarea>
					</div>
				</div>
				<label> 19.본 과정의 개선할 점</label><br>
				<div id="container2">
					<div class="selectRadio">
						<textarea class="textarea_test" name="answer19"
							id="search_ssh_command"
							onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';"></textarea>
					</div>
				</div>
				<label> 20.기타 하고 싶은 말</label><br>
				<div id="container2">
					<div class="selectRadio">
						<textarea class="textarea_test" name="answer20"
							id="search_ssh_command"
							onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';"></textarea>
					</div>
				</div>
			</div>
			<div style="text-align: right">
				<input type="submit" value="제출하기">
			</div>
		</form>
	</div>
</body>
</html>
