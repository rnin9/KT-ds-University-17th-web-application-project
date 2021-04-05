<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 작성</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<scripts
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script> <!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 -->
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
h2 {
	font-family: 'Font Awesome 5 Brands';
	font-weight: 550;
	margin: 20px 0px 5px;
}

body {
	text-align: left;
}

#main { /* 전체를 감싸서 적용 */
	width: 980px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

div.formtag { /* div 속 폼태그 전체 적용 */
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
	line-height: 15px;
}

#container1 { /* 이름 밑에 속성들을 감싸서 적용 */
	width: 64%;
	margin: 10px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	border: 0px solid #bcbcbc;
	background-color: #fafafa;
	height: 1325px;
	position: relative;
	border-radius: 3px;
}

#container2 {
	width: 800%;
	height: 80%;
	text-align: left;
	margin-left: 80px;
}

.title { /* container 밑 속성값들의 이름 */
	margin: 60px 0px 0px 40px;
	display: inline-block;
	width: 100px;
	position: relative;
	font-size: 15px;
	font-weight: 550;
}

.password1 {
	margin: 80px 0px 0px 40px;
	display: inline-block;
	width: 100px;
	position: relative;
}

.must { /* 속성값 옆 필수라는 빨간색 문구 */
	color: #fc0038;
	font-size: 12px;
	letter-spacing: -1px;
	margin-left: 15px;
	margin-right: 40px;
}

div input[type="text"] { /* input type text 태그 지정*/
	width: 300px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
	border-radius: 3px;
}

/* toggle은 남녀를 구분하기 위해 만듦 */
#toggle {
	display: inline-block;
	margin-top: 1px;
	margin-left: -3px
}

#toggle input[type=radio] { /* radio를 보이지 않게 만들고, */
	display: none;
}

#toggle input[type=radio]+label { /* 라벨을 삽입해서 체크했을때와 안했을 때를 구분함 */
	background-color: #333333;
	margin: -1.6px;
	color: #DEE1E6;
	padding: 10px 12px;
	cursor: pointer;
	border-radius: 5px;
}

#toggle input[type=radio]:checked+label {
	background-color: #FF0000;
	border-radius: 4px;
	border: 2px solid;
}

#toggle2 {
	display: inline-block;
	margin-top: 1px;
	margin-left: 10px
}

#toggle2 input[type=radio] { /* radio를 보이지 않게 만들고, */
	display: none;
}

#toggle2 input[type=radio]+label { /* 라벨을 삽입해서 체크했을때와 안했을 때를 구분함 */
	background-color: #333333;
	margin: -1.6px;
	color: #DEE1E6;
	padding: 10px 12px;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
	width: 150px;
}

#toggle2 input[type=radio]:checked+label {
	background-color: #FF0000;
	border-radius: 4px;
	border: 2px solid;
}

#toggle3 {
	display: inline-block;
	margin-top: 1px;
	margin-left: 10px
}

#toggle3 input[type=radio] { /* radio를 보이지 않게 만들고, */
	display: none;
}

#toggle3 input[type=radio]+label { /* 라벨을 삽입해서 체크했을때와 안했을 때를 구분함 */
	background-color: #333333;
	margin: -1.6px;
	color: #DEE1E6;
	padding: 10px 12px;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
	width: 150px;
}

#toggle3 input[type=radio]:checked+label {
	background-color: #FF0000;
	border-radius: 4px;
	border: 2px solid;
}

.photo { /* 프로필 사진 첨부 관련 겉 테두리 */
	top: 50px;
	right: 50px;
	position: absolute;
	border: 1px solid #e9e9e9;
	padding: 9px;
	width: 120px;
	height: 160px;
	box-sizing: border-box;
	text-align: center;
	background-color: #fff;
}

.pic { /* 프로필 사진 관련 속 테두리 */
	position: relative;
	width: 100px;
	height: 140px;
	background-color: #fafafa;
	box-sizing: border-box;
	padding-top: 50px;
	display: block;
}

a { /* 프로필 사진 첨부 관련 사진추가 라는 링크 */
	color: #444;
	text-decoration: none;
}

#position {
	width: 300px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
	border-radius: 3px;
	color: grey;
}

.regex {
	font-size: 12px;
	text-align: center;
	position: absolute;
	margin-top: 5px;
	margin-left: 152px;
	color: red;
}

#eng {
	margin-left: 580px;
}

#detailAddress {
	margin-top: 10px;
	margin-left: 152px;
	width: 300px;
}

.pw {
	width: 300px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
	border-radius: 3px;
}

.btn {
	width: 12%;
	padding: 16px 10px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: -66px;
	line-height: 13px;
	color: #DEE1E6;
	background-color: #FF0000;
}

#datepicker {
	width: 207px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
	border-radius: 3px;
}

.address_detail {
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	color: #DEE1E6;
	background-color: #333333;
	border-radius: 5px;
	line-height: 2.3;
	margin-left: -5px;
}

#roadAddress {
	width: 207px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
}

hr {
	box-sizing: content-box;
	height: 1px;
	overflow: visible;
	width: 500px;
	text-align: center;
	margin-left: -15px;
}

.navbar-brand2 img {
	width: 200px;
	height: 80px;
	padding-bottom: -9px;
	padding-top: 17px;
	margin-left: 150px;
	margin-bottom: -8px; /*
	text-align: center;
}
</style>
<!-- 중복관련 스크립트ajax --> <script type="text/javascript">
	$(		
			function() { 
				$("#joinForm").submit(function(){ <!--From submit jQuery-->
					if($("#pw").val() !== $("#pw2").val()){
						alert("비밀번호가 다릅니다.");
						$("#pw").val("").focus();
						$("#pw2").val("");
						return false;
					}else if ($("#pw").val().length < 8) {
						alert("비밀번호는 8자 이상으로 설정해야 합니다.");
						$("#pw").val("").focus();
						return false;
					}else if($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()){
						alert("공백은 입력이 불가능합니다.");
						return false;
					}
				});
				
				<!--아이디 관련 jQuery-->
				$("#id").click(function(){
					if($("#id").val()==""){
					$("#id_check").html("필수 항목입니다.");
					$("#joinBtn").attr("disabled", "disabled");
					}
				});
				

				$("#id").keyup(function() {
					$.ajax({
						url : "${contextPath}/member/check_id.do",
						type : "POST",
						data : {
							id : $("#id").val()
						},
						success : function(result) {
							if (result == 1) {
								$("#id_check").html("중복된 아이디가 있습니다.");
								$("#joinBtn").attr("disabled", "disabled");
							}else {
								if($("#id").val()==""){
									$("#id_check").html("필수 항목입니다.");
									$("#joinBtn").attr("disabled", "disabled");
								}else{
								$("#id_check").html("");
								$("#joinBtn").removeAttr("disabled");
								}
							}
						},
					})
				});
				<!--이메일 관련 jQuery -->
				$("#email").keyup(function() {
					$.ajax({
						url : "${contextPath}/member/check_email.do",
						type : "POST",
						data : {
							email : $("#email").val()
						},
						success : function(result) {
							console.log(result);
							if (result == 1) {
								$("#email_check").html("중복된 이메일이 있습니다.");
								$("#joinBtn").attr("disabled", "disabled");
							} else {
								$("#email_check").html("");
								$("#joinBtn").removeAttr("disabled");	
							}
						},
					})
				});
				
				
				<!-- 각 입력칸에 다른 값을 입력할때 자동으로 삭제 -->
				$('#name').on("blur keyup", function() {
					$(this).val($(this).val().replace(/[a-zA-Z0-9]/g, ''));
				});
				$('#phone').on("blur keyup", function() {
					$(this).val($(this).val().replace(/[ㄱ-힣a-zA-Z-]/g, ''));
				});
				
				<!--날짜 선택-->
				$("#datepicker").datepicker({
					viewMode : 'years',
					format : "yyyymmdd",
					language : "ko",
					startView : 2,
					keyboardNavigation : false,
					forceParse : false,
					autoclose : true
				});

			})
</script>
</head>


<body>

	<form action="${contextPath}/member/join_member.do" id="joinForm"
		accept-charset="UTF-8" name="basic" method="POST">
		<div id="main">
			<div id="title_area"></div>

			<div id="container1">
				<div id="container2">


					<a class="navbar-brand2" href="${contextPath}/main.do"><img
						src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
						alt="로고" /></a>
					<div>
						<label class="title">아이디</label> <input type="text" name="userId"
							id="id">
						<div class="eng_name regex" id="id_check"></div>
					</div>
					<div>
						<label class="title">비밀번호</label> <input type="password"
							class="pw" id="pw" name="userPassword" placeholder="8자 이상, 공백 불허">
					</div>
					<div>
						<label class="title">비밀번호 확인</label>
						<!-- <span class="must">필수</span> -->
						<input type="password" class="pw" id="pw2" name="userPassword2"
							placeholder="비밀번호 확인">
					</div>

					<div>
						<label class="title">성명</label> <input type="text" name="userName"
							id="name" placeholder="한글명" onfocus="this.placeholder=''"
							onblur="this.placeholder='한글명'">
						<div class="name regex"></div>
					</div>
					<div>
						<label class="title">이메일</label> <input type="text" name="userEmail"
							id="email">
						<div class="email regex" id="email_check"></div>
					</div>
					<div id="date">
						<label class="title">생년월일</label> <input type="text" name="birth"
							class="birth" id="datepicker" placeholder="생년월일">

						<div id="toggle">
							<input type="radio" id="male" name="userGender" value="남자"> 
							<label for="male">남</label> 
							<input type="radio" id="female" name="userGender" value="여자"> 
							<label for="female">여</label>
						</div>
					</div>
					<div>
						<label class="title">전공구분</label>
						<div id="toggle2">
							<input type="radio" id="major" name="userMajor" value="전공"> 
							<label for="major">전공</label> 
							<input type="radio" id="nomajor" name="userMajor" value="비전공"> 
							<label for="nomajor">비전공</label>
						</div>
					</div>

					<div>
						<label class="title">직업</label> <select id="position"
							name="userJob" size='1'>
							<option value=''>직업선택</option>
							<option name="userJob" value="학생">학생</option>
							<option name="userJob" value="컴퓨터/인터넷">컴퓨터/인터넷</option>
							<option name="userJob" value="언론">언론</option>
							<option name="userJob" value="공무원">공무원</option>
							<option name="userJob" value="군인">군인</option>
							<option name="userJob" value="서비스업">서비스업</option>
							<option name="userJob" value="교육">교육</option>
							<option name="userJob" value="금융/증권/보험업">금융/증권/보험업</option>
							<option name="userJob" value="유통업">유통업</option>
							<option name="userJob" value="예술">예술</option>
							<option name="userJob" value="의료">의료</option>
						</select>

					</div>
					<div>
						<label class="title">position</label>
						<div id="toggle3">
							<input type="radio" id="position1" name="userPosition" value="채용예정자"> 
							<label for="position1">채용예정자과정</label> 
							<input type="radio" id="position2" name="userPosition" value="재직자"> 
							<label for="position2">재직자과정</label>

						</div>
					</div>
					
					<div>
						<label class="title">회사</label> <input type="text" name="userCompany"
							placeholder="회사명">
					</div>

					<div>
						<label class="title">휴대폰</label> <input type="text" name="userPhoneNumber"
							id="phone" placeholder="휴대폰 번호 입력" onfocus="this.placeholder=''"
							onblur="this.placeholder='휴대폰 번호 입력'">
						<div class="phone regex"></div>
					</div>

					<div>
						<label class="title">주소</label> <input type="text" name="userAddress1"
							id="roadAddress" placeholder="도로명 주소"> <input
							type="button" onclick="sample4_execDaumPostcode()"
							class="address_detail" value="주소 찾기">
						<div>
							<input type="text" name="userAddress2" id="detailAddress"
								placeholder="상세 주소">
						</div>
					</div>
					<hr>
					<input type="submit" class="btn" id="joinBtn" value="회원가입" />
				</div>
			</div>
		</div>
	</form>



	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("roadAddress").value = roadAddr;
				}
			}).open();
		}
		$("#name").on("input", function() {
			var regex = /[ㄱ-힣]{1,}/;
			var result = regex.exec($("#name").val());

			if (result != null) {
				$(".name.regex").html("");
			} else {
				$(".name.regex").html("한글만 입력 가능합니다.");
			}
		})
		$("#eng_name").on("input", function() {
			var regex = /[a-zA-Z]{2,}$/;
			var result = regex.exec($("#eng_name").val());

			if (result != null) {
				$(".eng_name.regex").html("");
			} else {
				$(".eng_name.regex").html("영어만 입력 가능합니다.");
			}
		})
		$("#phone").on("input", function() {
			var regex = /^\d{1,}/;
			var result = regex.exec($("#phone").val());

			if (result != null) {
				$(".phone.regex").html("");
			} else {
				$(".phone.regex").html("숫자만 입력 가능합니다.");
			}
		})
		$("#email").on("input", function() {
			var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
			var result = regex.exec($("#email").val());

			if (result != null) {
				$(".email.regex").html("");
			} else {
				$(".email.regex").html("올바른 이메일이 아닙니다");
			}
		})
	</script>

</body>
</html>