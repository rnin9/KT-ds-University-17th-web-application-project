<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>


<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/resume.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}

.container { /* 이름 밑에 속성들을 감싸서 적용 */
	position: relative;
	text-align: left;
}

div.formtag { /* div 속 폼태그 전체 적용 */
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
	line-height: 15px;
}

.title { /* main 밑 속성값들의 이름 */
	margin: 60px 0px 0px 40px;
	display: inline-block;
	width: 100px;
	position: relative;
}

#title_area {
	display: inline-block;
	position: relative;
	margin-left: 5px;
}

.headbutton {
	display: inline-block;
	background-color: tomato;
	border: 1px solid tomato;
	border-radius: 5px;
	width: 223px;
	height: 60px;
	text-align: center;
	color: white;
	line-height: 60px;
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 15px;
	font-weight: bolder;
	margin-left: -5px;
}



.none {
	display: inline-block;
	background-color: white;
	color: black;
	line-height: 46px;
	margin-top: 43px;
}

.must { /* 속성값 옆 필수라는 빨간색 문구 */
	color: tomato;
	font-size: 12px;
	letter-spacing: -1px;
	margin-left: -20px;
	margin-right: 40px;
}

div input[type="text"] { /* input type text 태그 지정*/
	width: 250px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 42px;
	margin-right: 10px;
	line-height: 15px;
}

/* toggle은 남녀를 구분하기 위해 만듦 */
.toggle {
	display: inline-block;
	margin-top: 1px;
	margin-left: 44px;
}

.toggle input[type=radio] { /* radio를 보이지 않게 만들고, */
	display: none;
}

.toggle input[type=radio]+label { /* 라벨을 삽입해서 체크했을때와 안했을 때를 구분함 */
	background-color: #e0e0e0;
	margin: -1.7px;
	padding: 8px 40px;
	cursor: pointer;
}

.toggle input[type=radio]:checked+label {
	background-color: tomato;
	border-radius: 4px;
	border: 2px solid tomato;
}

.photo { /* 프로필 사진 첨부 관련 겉 테두리 */
	top: 311px;
	right: 117px;
	position: absolute;
	border: 1px solid #e9e9e9;
	padding: 9px;
	width: 120px;
	height: 160px;
	box-sizing: border-box;
	text-align: center;
	background-color: #fff;
}

.photo label { /* 프로필 사진 관련 속 테두리 */
	position: relative;
	width: 100px;
	height: 140px;
	background-color: #fafafa;
	box-sizing: border-box;
	padding-top: 50px;
	display: block;
	color: #444;
	text-decoration: none;
}

.photo input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#img {
	width: 120px;
	height: 160px;
	cursor: pointer;
	position: absolute;
	margin-top: -159px;
	right: -1px;
	position: absolute;
}


/* 올바른 문자가 삽입 되었는지 확인하는 부분 */
.regex {
	font-size: 12px;
	text-align: left;
	position: absolute;
	margin-top: 5px;
	margin-left: 200px;
}

#eng {
   margin-left: 660px;
   font-size: 13px;
}
#detailAddress {
	margin-top: 10px;
	margin-left: 226px;
	width: 500px;
}

.buttonGroups {
	margin-top: 55px;
	margin-bottom: 50px;
	width: 100%;
	border-top: 1px solid #eeeeee;
	padding-top: 30px;
}

#btn {
	float: right;
	width: 90px;
	height: 35px;
	font-size: 1em;
}
</style>

<!-- 날짜 관리 스크립트-->
<script>
	$(document).ready(function() {
		var resumeID = 
		$('#date input').datepicker({
			format : "yyyymmdd",
			language : "ko",
			startView : 2,
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true
		});
	});
</script>
<script>
function getPost(mode)
	{
		var theForm = document.page1Form;
		theForm.enctype = "multipart/form-data"
		if (mode == "toPage2") {
			theForm.method = "POST";
			theForm.action = "${contextPath}/resume/resumeWriteDetail.do?userID=${member.userId}&resumeID=${resumeVO.resumeID}";

		} else if (mode == "toPage3") {
			theForm.method = "POST";
			theForm.action = "${contextPath}/resume/page1Topage3.do?userID=${member.userId}&resumeID=${resumeVO.resumeID}";
			
		} else if (mode == "toPage4") {
			theForm.method = "POST";
			theForm.action = "${contextPath}/resume/page1Topage4.do?userID=${member.userId}&resumeID=${resumeVO.resumeID}";
			
		} else if (mode == "toPage5") {
			theForm.method = "POST";
			theForm.action = "${contextPath}/resume/page1Topage5.do?userID=${member.userId}&resumeID=${resumeVO.resumeID}";
		}
		theForm.submit();
	}
</script>


</head>


<body>
	<div class="sub_visual">
		<span style="color: white;">이력서</span>
	</div>
	<div class="container">


		

			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a
						href="${contextPath}/resume/resumeList.do?resumeUser=${member.userId}">이력서
							관리</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a
						href="${contextPath}/resume/resumeWrite.do?resumeUser=${member.userId}">이력서
							작성</a></li>
				</ul>
			</div>
			<form accept-charset="UTF-8" autocomplete="off" enctype="multipart/form-data" name="page1Form">
			<div id="title_area">
			
				<div id="first" class="headbutton move">기본정보</div>
				<button id="second" class="btn headbutton move none" type="submit"
					onClick="getPost('toPage2')">상세정보</button>
				<button id="third" class="btn headbutton move none" type="submit"
					onClick="getPost('toPage3')">경력사항 / 교육수료사항</button>
				<button id="forth" class="btn headbutton move none" type="submit"
					onClick="getPost('toPage4')">프로젝트 관련사항</button>
				<button id="last" class="btn headbutton move none" type="submit"
					onClick="getPost('toPage5')">자기소개서</button>
			</div>
			
			<h3>기본정보</h3>
			<div>
				<label class="title">성명</label><span class="must">필수</span> <input
					type="text" name="resume_name" id="name" placeholder="한글명"
					onfocus="this.placeholder=''" onblur="this.placeholder='한글명'"
					value="${resumeWrite.userName}" disabled>
				<div class="name regex"></div>
				<input type="text" name="resume_eng_name" id="eng_name"
					placeholder="영문명" onfocus="this.placeholder=''"
					onblur="this.placeholder='영문명'" value="${resumeVO.resumeForeign}" >
				<div class="eng_name regex" id="eng"></div>
			</div>
			<div id="date">
				<label class="title">생년월일</label><span class="must">필수</span> <input
					type="text" name="resume_date" id="birthDate" placeholder="생년월일"
					value='${resumeWrite.birth}' disabled>
				<div class="toggle">
					<input type="radio" id="male" name="sex" value="남" <c:if test="${resumeWrite.userGender eq '남자'}">checked="checked"</c:if> onclick="return(false);"/> <label
						for="male">남</label> <input type="radio" id="female" name="sex"
						value="여" <c:if test="${resumeWrite.userGender eq '여자'}">checked="checked"</c:if> onclick="return(false);"/> <label for="female">여</label>
				</div>
			</div>
			<input type="text" style="display: none" name="resumeID"
				id="resumeID" value="${resumeVO.resumeID}"> <input
				type="text" style="display: none" name="resumeUser" id="resumeUser"
				value="${resumeVO.resumeUser}">
			<div>
				<label class="title">휴대폰</label><span class="must">필수</span> <input
					type="text" name="resume_phone" id="phone" placeholder="휴대폰 번호 입력"
					onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰 번호 입력'"
					value="${resumeWrite.userPhoneNumber}" disabled>
				<div class="phone regex"></div>
			</div>
			<div>
				<label class="title">이메일</label><span class="must">필수</span> <input
					type="text" name="resume_email" id="email" placeholder="이메일 입력"
					onfocus="this.placeholder=''" onblur="this.placeholder='이메일 입력'"
					value="${resumeWrite.userEmail}" disabled>
				<div class="email regex"></div>
			</div>
			<div>
				<label class="title">주소</label><span class="must">필수</span> <input
					type="text" name="roadAddress" id="roadAddress"
					placeholder="도로명 주소" value="${resumeWrite.userAddress1}" disabled>
				<input type="button" onclick="sample4_execDaumPostcode()"
					value="주소 찾기">
				<div>
					<input type="text" name="detailAddress" id="detailAddress"
						placeholder="상세 주소" value="${resumeWrite.userAddress2}" disabled>
				</div>
			</div>

			<div class="photo">
				<input type="file" id="file1" class="pic" name="file"> <label
					for="file1">사진추가</label>
					<c:choose> 
					<c:when test="${empty resumeVO.resumePic}"> <img id="img" style="display: none;" ></c:when>
					<c:when test="${not empty resumeVO.resumePic}"> <img id="img" src="${pageContext.request.contextPath}/resources/image/resume/${resumeVO.resumePic}" style="display: black;" ></c:when>
					</c:choose>

			</div>
			<div class="buttonGroups">
				<button id="btn" class="btn button_bottom btn-outline-danger save btn-outline-danger" type="submit" onClick="getPost('toPage2')">다음</button>
			</div>


		</form>
	</div>

	<!-- 각 입력칸에 다른 값을 입력할때 자동으로 삭제 -->


	<script type="text/javascript">
		$(function() {
			$('#name').on("blur keyup", function() {
				$(this).val($(this).val().replace(/[a-zA-Z0-9]/g, ''));
			});

			$(function() {
				$('#eng_name').on("blur keyup", function() {
					$(this).val($(this).val().replace(/[ㄱ-힣0-9]/g, ''));
				});
			})

			$(function() {
				$('#phone').on("blur keyup", function() {
					$(this).val($(this).val().replace(/[ㄱ-힣a-zA-Z-]/g, ''));
				});
			})
		})
	</script>

	<!-- 각 입력칸에 다른 값을 입력할때 입력칸 밑에 내용 표시 -->

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

		// 각 항목의 값을 받을때, 다른 값을 입력하면 오류 메세지 출력

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
			var regex = /[a-zA-Z\s]{1,2}$/;
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
				$(".email.regex").html("올바른 이메일이 아닙니다.");
			}
		})
	</script>


	<script type="text/javascript">
		//이미지 미리보기
		var sel_file;

		$(document).ready(function() {
			$("#file1").on("change", handleImgFileSelect);
		});

		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

			filesArr.forEach(function(f) {
				if (!f.type.match(reg)) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}

				sel_file = f;

				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img").attr("src", e.target.result);
					$("#img").attr("style", "display: block;");
				}
				reader.readAsDataURL(f);

			});
		}
	</script>

	<script>
		$(document).ready(function() {
			$("#img").on("click", function() {
				$(this).attr("style", "display: none;");
				$(this).removeAttr("src");
			});
		});
	</script>


</body>

</html>
