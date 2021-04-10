
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	height: 600px;
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

.regex {
	font-size: 12px;
	text-align: center;
	position: absolute;
	margin-top: 5px;
	margin-left: 300px;
}

#eng {
	margin-left: 580px;
}

#detailAddress {
	margin-top: 10px;
	margin-left: 138px;
	width: 413px;
}
</style>
</head>
<body>
	<div class="sub_visual">
		<span style="color: white;">내 정보</span>
	</div>

	<div class="lnb">
		<ul>
			<li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
			<li style="color: grey; font-weight: bold;">〉</li>
			<li class="on"><a
				href="${pageContext.request.contextPath}/myInfo.do">내 정보</a></li>
		</ul>
	</div>
	<!-- 페이지에 대한 intro -->
	<div class="faqIntro">${myInfo.userId}의정보</div>


	<section id="tabs" class="project-tab">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav style="margin-top: 100px;">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" data-toggle="tab" href="#nav-home">내 정보</a>
							</li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#nav-profile">수강 목록</a></li>
						</ul>
					</nav>

					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">

							<form action="#" accept-charset="UTF-8" name="basic"
								method="POST" autocomplete="off">
								<div id="main">
									<div id="container">
										<div>
											<label class="title">성명</label><span class="must">필수</span> <input
												type="text" name="resume_name" id="name" placeholder="한글명"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='한글명'"> <label
												class="title">비밀번호</label><span class="must">필수</span> <input
												type="text" name="resume_name" id="name" placeholder="한글명"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='한글명'">
										</div>
										<div id="date">
											<label class="title">생년월일</label><span class="must">필수</span>
											<input type="text" name="resume_date" id="date"
												placeholder="생년월일"> <label class="title">휴대폰</label><span
												class="must">필수</span> <input type="text"
												name="resume_phone" id="phone" placeholder="휴대폰 번호 입력"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='휴대폰 번호 입력'">
											<div class="phone regex"></div>
										</div>
										<div>
											<label class="title">이메일</label><span class="must">필수</span>
											<input type="text" name="resume_email" id="email">
											<div class="email regex"></div>
											<div class="toggle">
												<label class="title" style="margin-right: 5%;">대상</label> <input
													type="radio" id="male" name="sex"> <label
													for="male">채용예정자</label> <input type="radio" id="female"
													name="sex"> <label for="female">재직자</label>
											</div>

										</div>
										<div style="display:flex;">
											<div style="transform: translateX(-7%); width:120%;">
												<label class="title">주소</label><span class="must">필수</span>
												<input type="text" name="roadAddress" id="roadAddress"
													placeholder="도로명 주소"> <input type="button"
													onclick="sample4_execDaumPostcode()" value="주소 찾기">
												<div>
													<input type="text" name="detailAddress" id="detailAddress"
														placeholder="상세 주소">
												</div>
											</div>
											<div class="toggle" style="transform: translateY(50%);">
											<input type="radio" id="male" name="sex"> <label
													for="male">전공</label> <input type="radio" id="female"
													name="sex"> <label for="female">비전공</label>
											</div>
										</div>
									</div>
							</form>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<table class="table" cellspacing="0">
								<thead>
									<tr>
										<th>기업명</th>
										<th>지원 날짜</th>
										<th>지원 상태</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

