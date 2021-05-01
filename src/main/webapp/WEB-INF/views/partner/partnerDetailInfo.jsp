<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기업 수정</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />



<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">

<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
#main { /* 전체를 감싸서 적용 */
	width: auto
}

div.formtag { /* div 속 폼태그 전체 적용 */
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
	line-height: 15px;
}

.container {
	display: flex;
	flex-wrap: wrap;
	width: 80%;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 15%;
}

.container1 { /* 이름 밑에 속성들을 감싸서 적용 */
	background-color: #f2f2f2;
	height: auto;
	position: relative;
	margin-bottom: 40px;
	padding-bottom: 40px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	border-radius: 3px;
	font-family: 'Noto Sans KR', sans-serif;
}

#field {
	background-color: #fafafa;
	height: auto;
	position: relative;
	margin-bottom: 40px;
	padding-bottom: 40px;
	margin-top: -50px;
}

#title_area {
	margin: 20px 10px 20px 10px;
}

.title { /* container 밑 속성값들의 이름 */
	margin: 60px 0px 0px 40px;
	display: inline-block;
	width: 110px;
	position: relative;
}

.must { /* 속성값 옆 필수라는 빨간색 문구 */
	color: #fc0038;
	font-size: 12px;
	letter-spacing: -1px;
	margin-left: -20px;
	margin-right: 40px;
}

.toggle {
	display: inline-block;
	margin-top: 50px;
	margin-left: 35px;
}

div input[type="text"] { /* input type text 태그 지정*/
	width: 63%;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
	height: 40px;
}

.block1 {
	display: flex;
}

.block2 {
	width: 90%;
}

button {
	float: right;
	margin-right: 10px;
}

</style>
<script type="text/javascript">
	$('#partnerHeadCount').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[ㄱ-힣a-zA-Z-]/g, ''));
	});
</script>
<script type="text/javascript">
	function getPost(mode) {
		var theForm = document.partnerSubmit;
		if (mode == "01") {
			theForm.method = "POST";
			$("#partnerLicenseNum").removeAttr("disabled");
			$("#partnerName").removeAttr("disabled");
			theForm.action = "${contextPath}/partner/modPartner.do";

		} else if (mode == "02") {
			theForm.method = "POST";
			$("#partnerLicenseNum").removeAttr("disabled");
			$("#partnerName").removeAttr("disabled");
			theForm.action = "${contextPath}/partner/deletePartner.do";
		}
		theForm.submit();
	}
</script>

<!--이전으로 돌아가는 function -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#back").click(function() {

			window.history.back();
			location.href = document.referrer;

		});

	});
</script>
</head>


<body>


	<div class="container">

		<div class="pageIntro">협력사 정보</div>
		<form name=partnerSubmit accept-charset="UTF-8" autocomplete="off">
			<div id="main">
				<div class="container1">
					<h2 style="padding-top: 30px;">${partnerVO.partnerName}</h2>

					<div class="block1">
						<div class="block2">
							<label class="title">사업자 등록번호</label> <input
								id="partnerLicenseNum" type="text" name="partnerLicenseNum"
								placeholder="" value="${partnerVO.partnerLicenseNum}" disabled>
						</div>
						<div class="block2" style="margin-left: -4px;">
							<label class="title"style="margin-left:2px;">협약 상태</label> <select id="partnerState"
								name="partnerState" size="1" style="width: 20%; height:45%;">
								<option value="">선택하세요</option>
								<option value="협력사"
									<c:if test="${partnerVO.partnerState eq '협력사'}">selected</c:if>>협력사</option>
								<option value="협약사"
									<c:if test="${partnerVO.partnerState eq '협약사'}">selected</c:if>>협약사</option>
								<option value="협약서사본"
									<c:if test="${partnerVO.partnerState eq '협약서사본'}">selected</c:if>>협약서사본</option>
								<option value="협약서없음"
									<c:if test="${partnerVO.partnerState eq '헙약서없음'}">selected</c:if>>협약서없음</option>
							</select>
							
							<label class="title" >근로자수</label> <input type="text"
								id="partnerHeadCount" name="partnerHeadCount"
								placeholder="" value="${partnerVO.partnerHeadCount}" style="width:10%;">
							<div class="partnerHeadCount regex"></div>
						
							
						</div>
					</div>

					<div class="block1">
						<div class="block2">
							<label class="title">기업명</label> <input type="text"
								name="partnerName" placeholder="기업명"
								value="${partnerVO.partnerName}" disabled>
						</div>
						<div class="block2">
							<label class="title">대표 전화번호</label> <input type="text"
								name="partnerPhoneNumber" placeholder="대표 전화번호"
								value="${partnerVO.partnerPhoneNumber}">
						</div>


					</div>
					<div class="block1">
					<div class="block2">
							<label class="title">대표자성명</label> <input type="text"
								name="partnerCEO" placeholder="대표자성명"
								value="${partnerVO.partnerCEO}">
						</div>
					<div class="block2">
							<label class="title">홈페이지</label> <input type="text"
								name="partnerURL" placeholder="홈페이지"
								value="${partnerVO.partnerURL}">
						</div>
						


					</div>
					<div class="block1">
						<div class="block2">
							<label class="title">주소</label> <input type="text"
								name="partnerAddress" placeholder="주소"
								value="${partnerVO.partnerAddress}">
						</div>
						<div class="block2">
							<label class="title">업종형태</label> <input type="text"
								name="partnerIndustryType" placeholder="업종형태"
								value="${partnerVO.partnerIndustryType}">
						
						</div>
						
					</div>
					<hr>
					<h2 style="padding-top: 30px;">담당자 정보</h2>
					<div class="block1">
						<div class="block2">
							<label class="title">성명</label> <input type="text"
								name="partnerCharger" placeholder="성명" class="charger"
								value="${partnerVO.partnerCharger}">
						</div>
						<div class="block2">
							<label class="title">부서</label> <input type="text"
								name="partnerChargerDepartment" placeholder="부서" class="charger"
								value="${partnerVO.partnerChargerDepartment}">
						</div>
					</div>
					<div class="block1">
						<div class="block2">
							<label class="title">ID</label> <input type="text"
								name="partnerChargerID" placeholder="ID" class="charger"
								value="${partnerVO.partnerChargerID}">
						</div>
						<div class="block2">
							<label class="title">이메일</label> <input type="text"
								name="partnerChargerEmail" placeholder="이메일" class="charger"
								value="${partnerVO.partnerChargerEmail}">
						</div>
					</div>

				</div>

				<button type="submit" class="btn btn-outline-danger"
					onClick="getPost('01')">수정</button>
				<button type="submit" class="btn btn-outline-danger"
					onClick="getPost('02')">삭제</button>
				<button type="button" class="btn btn-outline-danger" id="back">이전</button>
			</div>

		</form>
	</div>


	<script>
		$("#partnerHeadCount").on("input", function() {
			var regex = /^\d{1,}/;
			var result = regex.exec($("#partnerHeadCount").val());

			if (result != null) {
				$(".partnerHeadCount.regex").html("");
			} else {
				$(".partnerHeadCount.regex").html("숫자만 입력 가능합니다.");
			}
		})
	</script>




</body>

</html>