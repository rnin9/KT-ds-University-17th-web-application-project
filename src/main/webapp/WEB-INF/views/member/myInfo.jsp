
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- <link rel="stylesheet" type="text/css"
	href="/juliet/resources/juliet.css"> -->
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/universityConsortium.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}

#main { /* 전체를 감싸서 적용 */
	width: 980px;
}

div.formtag { /* div 속 폼태그 전체 적용 */
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
	line-height: 15px;
}

#container { /* 이름 밑에 속성들을 감싸서 적용 */
	background-color: #fafafa;
	height: 500px;
	position: relative;
}

.title { /* container 밑 속성값들의 이름 */
	margin: 60px 0px 0px 40px;
	display: inline-block;
	width: 100px;
	position: relative;
}

.must { /* 속성값 옆 필수라는 빨간색 문구 */
	color: #fc0038;
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
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
}

div input[type="password"] { /* input type text 태그 지정*/
	width: 250px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-left: 8px;
	margin-right: 10px;
	line-height: 15px;
}

/* toggle은 남녀를 구분하기 위해 만듦 */
.toggle {
	display: inline-block;
	margin-top: 1px;
	margin-left: 35px;
	width: 43%;
	text-align: left;
}

.toggle input[type=radio] { /* radio를 보이지 않게 만들고, */
	display: none;
}

.toggle input[type=radio]+label { /* 라벨을 삽입해서 체크했을때와 안했을 때를 구분함 */
	background-color: #e0e0e0;
	margin: -2.6px;
	padding: 8px 25px;
	cursor: pointer;
}

.toggle input[type=radio]:checked+label {
	background-color: #fc0038;
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

.phone_regex {
	text-align: center;
	margin-top: 5px;
	display: inline-block;
}

#eng {
	margin-left: 580px;
}

#detailAddress {
	margin-top: 10px;
	margin-left: 138px;
	width: 413px;
}

#date {
	display: inline-block;
	width: 51%;
}

.name_regex, .email_regex {
	font-size: 12px;
	text-align: center;
	position: absolute;
	margin-top: 5px;
	margin-left: 350px;
}

.phone_regex_valid, .pwd_regex {
	font-size: 12px;
	text-align: center;
	position: absolute;
	margin-top: 5px;
	margin-left: 800px;
}
</style>

<script>
	$(document).ready(function() {
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

<script type="text/javascript">
	$(function() {
		$('#name').on("blur keyup", function() {
			$(this).val($(this).val().replace(/[a-zA-Z0-9]/g, ''));
		});
	})
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
	$(function() {
		$('#nav-profile').on("click", function() {
			$('.modifyInfo').hide();
		});
	})
</script>

<script>
function handleModify() { 
	Swal.fire({					/* 수정실행 확인 */
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
			return;  	/* 수정실행 취소 */
	  }
	})
}
</script>

</head>
<body>
	<div class="sub_visual">
		<span style="color: white;">마이 페이지</span>
	</div>

	<div class="lnb">
		<ul>
			<li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
			<li style="color: grey; font-weight: bold;">〉</li>
			<li class="on"><a
				href="${pageContext.request.contextPath}/myInfo.do">마이 페이지</a></li>
		</ul>
	</div>
	<!-- 페이지에 대한 intro -->
	<div class="faqIntro">${myInfo.userId}의페이지</div>

	<!-- 내정보/수강정보 탭 -->
	<section id="tabs" class="project-tab">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav style="margin-top: 50px;">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" data-toggle="tab" href="#nav-home">마이
									페이지</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#nav-profile">수강 목록</a></li>
						</ul>
					</nav>
					<!-- 마이페이지 탭 시작-->
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">

							<form action="${contextPath}/member/modMyInfo.do" method="POST"
								id="modForm">
								<div id="main">
									<div id="container">
										<div>
											<input type="hidden" name="userId" value='${myInfo.userId}'>
											<label class="title">성명</label><span class="must">필수</span> <input
												type="text" name="userName" id="name" placeholder="한글명"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='한글명'" value='${myInfo.userName}'>
											<div class="name_regex"></div>
											<label class="title">비밀번호</label><span class="must">필수</span>
											<input type="password" name="userPassword" id="password"
												placeholder="한글명" onfocus="this.placeholder=''"
												onblur="this.placeholder='비밀번호'"
												value='${myInfo.userPassword}'>
											<div class="pwd_regex"></div>
										</div>
										<div id="date">
											<label class="title" style="margin-left: 0px;">생년월일</label><span
												class="must">필수</span> <input type="text" name="birth"
												id="date" placeholder="생년월일" value='${myInfo.birth}'>
										</div>
										<div class="phone_regex">
											<label class="title" style="margin-left: 0px;">휴대폰</label><span
												class="must">필수</span> <input type="text"
												name="userPhoneNumber" id="phone" placeholder="휴대폰 번호 입력"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='휴대폰 번호 입력'"
												value='${myInfo.userPhoneNumber}'>
										</div>
										<div class="phone_regex_valid"></div>
										<div>
											<label class="title">이메일</label><span class="must">필수</span>
											<input type="text" name="userEmail" id="email"
												value='${myInfo.userEmail}'>
											<div class="email_regex"></div>
											<c:choose>
												<c:when test="${myInfo.userPosition =='채용예정자'}">
													<div class="toggle">
														<label class="title" style="margin-right: 5%;">대상</label>
														<input type="radio" id="ktu" name="userPosition"
															checked="checked" value="채용예정자"> <label for="ktu">채용예정자</label>
														<input type="radio" id="ktp" name="userPosition"
															value="재직자"> <label for="ktp">재직자</label>
													</div>
												</c:when>
												<c:otherwise>

													<div class="toggle">
														<label class="title" style="margin-right: 5%;">대상</label>
														<input type="radio" id="ktu" name="userPosition"
															value="채용예정자"> <label for="ktu">채용예정자</label> <input
															type="radio" id="ktp" name="userPosition"
															checked="checked" value="재직자"> <label for="ktp">재직자</label>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<div style="display: flex;">
											<div style="transform: translateX(-6%); width: 120%;">
												<label class="title">주소</label><span class="must">필수</span>
												<input type="text" name="userAddress1" id="roadAddress"
													placeholder="도로명 주소" value='${myInfo.userAddress1}'>
												<input type="button" onclick="sample4_execDaumPostcode()"
													value="주소 찾기">
												<div>
													<input type="text" name="userAddress2" id="detailAddress"
														value='${myInfo.userAddress2}' placeholder="상세 주소">
												</div>
											</div>
											<c:choose>
												<c:when test="${myInfo.userMajor =='전공'}">
													<div class="toggle"
														style="transform: translateY(50%); margin-right: 20px">
														<input type="radio" id="major" name="userMajor"
															checked="checked" value="전공"> <label for="major">전공</label>
														<input type="radio" id="nonMajor" name="userMajor"
															value="비전공"> <label for="nonMajor">비전공</label>
													</div>
												</c:when>
												<c:otherwise>
													<div class="toggle"
														style="transform: translateY(50%); margin-right: 20px">
														<input type="radio" id="major" name="userMajor" value="전공">
														<label for="major">전공</label> <input type="radio"
															id="nonMajor" name="userMajor" value="비전공"
															checked="checked"> <label for="nonMajor">비전공</label>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<!-- 마이페이지 탭 끝-->
								</div>
								<div id="modifyInfo">
									<input type="button" value="수정하기" onclick='handleModify()'>
								</div>
							</form>

							<script>
								function sample4_execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
													// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var roadAddr = data.roadAddress; // 도로명 주소 변수
													var extraRoadAddr = ''; // 참고 항목 변수
													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraRoadAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraRoadAddr += (extraRoadAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById("roadAddress").value = roadAddr;
												}
											}).open();
								}
								
								/* 입력유효성 체크 시작 */
								  $("#name").on("input",function(){
						                var regex = /[ㄱ-힣]{1,}/;
						                var result = regex.exec($("#name").val());
						                
						                if(result != null){
						                    $(".name_regex").html("");  
						                }else{
						                    $(".name_regex").html("한글만 입력 가능합니다.");
						                }
						        })
						        $("#eng_name").on("input",function(){
						                var regex = /[a-zA-Z]{2,}$/;
						                var result = regex.exec($("#eng_name").val());
						                
						                if(result != null){
						                    $(".eng_name.regex").html("");  
						                }else{
						                    $(".eng_name.regex").html("영어만 입력 가능합니다.");
						                }
						        })
						        $("#phone").on("input",function(){
						                var regex = /^\d{1,}/;
						                var result = regex.exec($("#phone").val());
						                
						                if(result != null){
						                    $(".phone_regex_valid").html("");  
						                }else{
						                    $(".phone_regex_valid").html("숫자만 입력 가능합니다.");
						                }
						        })
						        $("#email").on("input",function(){
						                     var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
						                     var result = regex.exec($("#email").val());
						                    
						                    if(result != null){
						                       $(".email_regex").html("");  
						                    }else{
						                        $(".email_regex").html("올바른 형식이 아닙니다.");
						                    }
						                })
						                
						       $("#password").on("input",function(){
						                     var result = $("#password").val().length;
						                    
						                    if(result > 7 ){
						                       $(".pwd_regex").html("");  
						                    }else{
						                        $(".pwd_regex").html("8자리 이상으로 설정하세요.");
						                    }
						                })
						                /* 입력유효성 체크 끝 */
							</script>
						</div>
						<!-- 수강강의 페이지 탭 -->
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<table class="table" cellspacing="0">
								<thead>
									<tr>
										<th>강의명</th>
										<th>교육기간</th>
										<th>승인상태</th>
										<th>수료증출력</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="myCourse" items="${myCourseInfo}">
										<tr>
											<td>${myCourse.syllabusVO.syllabusName}</td>
											<td>${myCourse.courseVO.courseStart}~${myCourse.courseVO.courseEnd}</td>
											<td>${myCourse.courseTake_State}</td>
											<c:choose>
												<c:when test="${myCourse.courseTake_State eq '수료'}">
													<form name="formForCertificate" action="myCertificate.jsp"
														method="post">
														<input type=text name="test3" value="${myCourse.syllabusVO.syllabusName}"
															style="display: none;" /> <input type=text name="test4"
															value="${myCourse.syllabusVO.syllabusName}"
															style="display: none;" />
														<td><a style="text-decoration: underline" href="#"
															onclick="javascript:popup(this.form);">출력하기</a></td>
													</form>
												</c:when>
												<c:otherwise>
													<td style="text-align: center;color:red;">미수료</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 수강강의 페이지 탭 끝 -->
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
function popup(frm)
{
  var url    ="/springEx/member/myCertificate.do";
  var title  = "certificate2";
  var status = "width=500px, height=600px, status=no, menubar=no, toolbar=no, resizable=no"; 
  window.open('${pageContext.request.contextPath}/member/myCertificate.do', title,status); //popup 열기
  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다. 
  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
  frm.method = "post";
  frm.submit();
  }
</script>

</html>

