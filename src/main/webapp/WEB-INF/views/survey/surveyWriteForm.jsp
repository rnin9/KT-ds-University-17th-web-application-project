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

<script>
        $(document).ready(function () {
            let activeTab = sessionStorage.getItem('activeTab');

            // 지원 상태 별로 색 설정
            $("span:contains('진행중')").css({color: "green"});
            $("span:contains('불합격')").css({color: "blue"});
            $("span:contains('합격')").css({color: "red"});

            // 새로고침 후 탭 상태 보존
            $('#myTab a[href="' + activeTab + '"]').trigger('click');
        });

        // 모달 body text 설정
        function getPartnerInfo(name, info, addr, email, headcnt, purl) {
            $("#modal_title").text(name);
            $("#partner_info").text(info);
            $("#partner_addr").text(addr);
            $("#partner_email").text(email);
            $("#partner_headcnt").text(headcnt);
            $("#partner_purl").text(purl);
        }

        // 탭 클릭 시 session에 현재 탭 값 저장
        function tabtab(h) {
            sessionStorage.setItem('activeTab', h);
            console.log('href   yyyy' + h);
        }

        // 지원 삭제 함수
        function deleteApplication(partnerApplyPartnerID) {
            const id = '${member.userId}';
            fetch("${contextPath}/member/deleteApplication.do", {
                method: "POST",
                mode: "cors",
                headers: {
                    "Content-Type": "application/json",
                    "accept": "application/json"
                },
                body: JSON.stringify({
                    partnerApplyUserID: '${member.userId}',
                    partnerApplyPartnerID: partnerApplyPartnerID
                })
            })
                .then(res => {
                    console.log(res);

                    swal("지원 삭제 완료.", "지원 삭제 완료.", "success");
                    setTimeout(function () { // 0.9초뒤 실행
                        location.reload(); // 새로고침 -> list 다시 불러옴
                    }, 900);

                })
                .catch(e => console.log(e));
        }

        // 지원 함수
        function chk_apply(a, b, c) {

            // 사용자의 이력서가 등록 되어있다면
            if ('${member.resume}' === "Y") {

                fetch("${contextPath}/member/userApplyPartner.do", {
                    method: "POST",
                    mode: "cors",
                    headers: {
                        "Content-Type": "application/json",
                        "accept": "application/json"
                    },
                    body: JSON.stringify({
                        partnerApplyUserID: b,
                        partnerApplyPartnerID: c
                    })
                })
                    .then(res => {
                        if (res.status == '500') {
                            // mybatis 오류 시 500 error
                            swal("중복 지원.", "중복 지원.", "info");
                        } else {
                            swal("지원 완료.", "지원 완료.", "success");
                            setTimeout(function () { // 0.9초뒤 실행
                                location.reload(); // 새로고침 -> list 다시 불러옴
                            }, 900);
                        }
                    })
                    .catch(e => console.log(e));

            //이력서가 없다면
            } else {
                swal("등록 된 이력서 없음.", "이력서가 필요합니다.", "warning");
            }
        }
    </script>
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
	width: 40%;
	font-family: 'Noto Sans KR', sans-serif;
}

#container1 { /* 이름 밑에 속성들을 감싸서 적용 */
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
</style>
</head>
<body>
	<div class="container">
		<div id="container1">
		<a class="navbar-brand" href="${contextPath}/main.do"><img
				src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
				alt="로고" style="width: 95px; height: 30px;"/></a><br>
		<h4 style="text-align:center; margin-top: 10px;">${allSurveyList.syllabusVO.syllabusName}</h4>
		<b style="float:right; font-size:12px">(5점 리쿼트 척도 : 전혀그렇지 않다=1점, 매우 그렇다=5점)</b>
		<br><br>
			<label>1. ${getQuestion.q1}</label><br>
			<form action="${contextPath}/survey/insertSurvey.do" accept-charset="UTF-8" method="POST">
			<input type="hidden" name="userId" value="${myInfo.userId}">
			<input type="hidden" name="courseID" value="${allSurveyList.courseID}">
		
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer1" value="1" required> <input
							type="radio" id="Q" name="answer1" value="2"> <input
							type="radio" id="Q" name="answer1" value="3"> <input
							type="radio" id="Q" name="answer1" value="4"> <input
							type="radio" id="Q" name="answer1" value="5">매우 그렇다
					</div>
				</div>
				<label> 2. ${getQuestion.q2}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer2" value="1" required> <input
							type="radio" id="Q" name="answer2" value="2"> <input
							type="radio" id="Q" name="answer2" value="3"> <input
							type="radio" id="Q" name="answer2" value="4"> <input
							type="radio" id="Q" name="answer2" value="5">매우 그렇다
					</div>
				</div>
				<label> 3. ${getQuestion.q3}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer3" value="1" required> <input
							type="radio" id="Q" name="answer3" value="2"> <input
							type="radio" id="Q" name="answer3" value="3"> <input
							type="radio" id="Q" name="answer3" value="4"> <input
							type="radio" id="Q" name="answer3" value="5">매우 그렇다
					</div>
				</div>
				<label> 4. ${getQuestion.q4}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer4" value="1" required> <input
							type="radio" id="Q" name="answer4" value="2"> <input
							type="radio" id="Q" name="answer4" value="3"> <input
							type="radio" id="Q" name="answer4" value="4"> <input
							type="radio" id="Q" name="answer4" value="5">매우 그렇다
					</div>
				</div>
				<label> 5. ${getQuestion.q5}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer5" value="1" required> <input
							type="radio" id="Q" name="answer5" value="2"> <input
							type="radio" id="Q" name="answer5" value="3"> <input
							type="radio" id="Q" name="answer5" value="4"> <input
							type="radio" id="Q" name="answer5" value="5">매우 그렇다
					</div>
				</div>
				<label> 6. ${getQuestion.q6}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer6" value="1" required> <input
							type="radio" id="Q" name="answer6" value="2"> <input
							type="radio" id="Q" name="answer6" value="3"> <input
							type="radio" id="Q" name="answer6" value="4"> <input
							type="radio" id="Q" name="answer6" value="5">매우 그렇다
					</div>
				</div>
				<label> 7. ${getQuestion.q7}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer7" value="1" required> <input
							type="radio" id="Q" name="answer7" value="2"> <input
							type="radio" id="Q" name="answer7" value="3"> <input
							type="radio" id="Q" name="answer7" value="4"> <input
							type="radio" id="Q" name="answer7" value="5">매우 그렇다
					</div>
				</div>
				<label> 8. ${getQuestion.q8}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer8" value="1" required> <input
							type="radio" id="Q" name="answer8" value="2"> <input
							type="radio" id="Q" name="answer8" value="3"> <input
							type="radio" id="Q" name="answer8" value="4"> <input
							type="radio" id="Q" name="answer8" value="5">매우 그렇다
					</div>
				</div>
				<label> 9. ${getQuestion.q9}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer9" value="1" required> <input
							type="radio" id="Q" name="answer9" value="2"> <input
							type="radio" id="Q" name="answer9" value="3"> <input
							type="radio" id="Q" name="answer9" value="4"> <input
							type="radio" id="Q" name="answer9" value="5">매우 그렇다
					</div>
				</div>
				<label> 10. ${getQuestion.q10}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer10" value="1" required> <input
							type="radio" id="Q" name="answer10" value="2"> <input
							type="radio" id="Q" name="answer10" value="3"> <input
							type="radio" id="Q" name="answer10" value="4"> <input
							type="radio" id="Q" name="answer10" value="5">매우 그렇다
					</div>
				</div>
				<label> 11. ${getQuestion.q11}</label><br>
				<div id="container2">
					<div class="selectRadio" required>
						전혀그렇지 않다 <input type="radio" id="Q" name="answer11" value="1" required> <input
							type="radio" id="Q" name="answer11" value="2"> <input
							type="radio" id="Q" name="answer11" value="3"> <input
							type="radio" id="Q" name="answer11" value="4"> <input
							type="radio" id="Q" name="answer11" value="5">매우 그렇다
					</div>
				</div>
				<label> 12. ${getQuestion.q12}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer12" value="1" required> <input
							type="radio" id="Q" name="answer12" value="2"> <input
							type="radio" id="Q" name="answer12" value="3"> <input
							type="radio" id="Q" name="answer12" value="4"> <input
							type="radio" id="Q" name="answer12" value="5">매우 그렇다
					</div>
				</div>
				<label> 13. ${getQuestion.q13}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer13" value="1" required> <input
							type="radio" id="Q" name="answer13" value="2"> <input
							type="radio" id="Q" name="answer13" value="3"> <input
							type="radio" id="Q" name="answer13" value="4"> <input
							type="radio" id="Q" name="answer13" value="5">매우 그렇다
					</div>
				</div>
				<label> 14. ${getQuestion.q14}</label><br>
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer14" value="1" required> <input
							type="radio" id="Q" name="answer14" value="2"> <input
							type="radio" id="Q" name="answer14" value="3"> <input
							type="radio" id="Q" name="answer14" value="4"> <input
							type="radio" id="Q" name="answer14" value="5">매우 그렇다
					</div>
				</div>
				<label> 15. ${getQuestion.q15}</label><br>
				
				<div id="container2">
					<div class="selectRadio">
						전혀그렇지 않다 <input type="radio" id="Q" name="answer15" value="1" required> <input
							type="radio" id="Q" name="answer15" value="2"> <input
							type="radio" id="Q" name="answer15" value="3"> <input
							type="radio" id="Q" name="answer15" value="4"> <input
							type="radio" id="Q" name="answer15" value="5">매우 그렇다
					</div>
				</div>
				
				<div style="text-align: right"><input type="submit" value="제출하기"></div>
			</form>
			
		</div>
	</div>
</body>
</html>
