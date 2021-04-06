<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
<<<<<<< HEAD
    <meta charset="UTF-8">
    <title>FAQ</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
            integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
            crossorigin="anonymous"></script>

    <style>
        .container {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .lnb {
            display: block;
            border-bottom: 1px solid #eeeeee;
            padding: 20px 0 0;
        }

        .lnb > ul {
            list-style: none;
            padding: 0;
            text-align: left;
        }

        .lnb > ul > li {
            display: inline-block;
            margin-left: 9px;
            padding-left: 15px;
            margin-left: 9px;
        }

        a:link, a:visited, a:hover {
            color: black;
            text-decoration: none;
        }

        .faqIntro {
            margin-top: 50px;
            text-align: center;
            font-size: 34px;
            font-weight: 450;
        }

        #accordionFlushExample {
            vertical-align: middle;
            margin-top: 60px;
        }

        .accordion-button {
            padding: 1.25rem;
        }

        .faqQuestion {
            margin-left: 5%;
            text-align: left;
        }

        .faqAnswer {
            margin-left: 5%;
            text-align: left;
        }

        .accordion-body {
            margin-left: 0;
            text-align: left;
            display: flex;
            background-color: rgba(231, 241, 255, 0.2);
            padding-top: 22px;
            padding-bottom: 22px;
            line-height: 34px;
        }

        .letterQ {
            margin-left: 20px;
            color: rgba(255, 0, 0, 0.6);
            font-size: 20px;
        }

        .letterA {
            color: rgba(0, 0, 255, 0.6);
            font-size: 20px;
            margin-left: 20px;
        }

        .file {
            width: 20px;
            height: 20px;
            margin-bottom: 5px;
        }
    </style>
=======
<meta charset="UTF-8">
<title>FAQ</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>

<style>
.bg-primary {
	background-color: white !important;
}

.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
/* 	background-image:
		url("${pageContext.request.contextPath}/resources/image/sub_visual/faq.jpg");
	background-color: black;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover; */
	width: 100%; 
	background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url("${pageContext.request.contextPath}/resources/image/sub_visual/faq.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	width: 80%;
}

.lnb {
	display: block;
	border-bottom: 1px solid #eeeeee;
	padding: 20px 0 0;
}

.lnb>ul {
	list-style: none;
	padding: 0;
	text-align: left;
}

.lnb>ul>li {
	display: inline-block;
	margin-left: 9px;
	padding-left: 15px;
	margin-left: 9px;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.faqIntro {
	margin-top: 50px;
	text-align: center;
	font-size: 34px;
	font-weight: 450;
}

#accordionFlushExample {
	vertical-align: middle;
	margin-top: 60px;
}

.accordion-button {
	padding: 1.25rem;
}

.faqQuestion {
	margin-left: 5%;
	text-align: left;
}

.faqAnswer {
	margin-left: 5%;
	text-align: left;
}

.accordion-body {
	margin-left: 0;
	text-align: left;
	display: flex;
	background-color: rgba(231, 241, 255, 0.2);
	padding-top: 22px;
	padding-bottom: 22px;
	line-height: 34px;
}

.letterQ {
	margin-left: 20px;
	color: rgba(255, 0, 0, 0.6);
	font-size: 20px;
}

.letterA {
	color: rgba(0, 0, 255, 0.6);
	font-size: 20px;
	margin-left: 20px;
}

.file {
	width: 20px;
	height: 20px;
	margin-bottom: 5px;
}
</style>
>>>>>>> 916daa06ad6ea8a921cb58b5239ce1b8b019d034

</head>

<body>
<<<<<<< HEAD
<div class="container">
    <div class="lnb">
        <ul>
            <li><a href="/springEx/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a
                    href="/springEx/faq.do">FAQ</a></li>
        </ul>
    </div>

    <div class="faqIntro">자주하는 질문에 대한 답변입니다.</div>

    <div class="accordion accordion-flush" id="accordionFlushExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
                        aria-expanded="false" aria-controls="flush-collapseOne">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">컨소시엄 협약은 어떻게 체결하나요?</div>
                </button>
            </h2>
            <div id="flush-collapseOne" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingOne"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        국가인적자원개발 컨소시엄 협약체결은 첨부된 컨소시엄 협약서(총 3P)를 작성하셔서 제출하여 주시면 됩니다.<br>(1년에
                        1회 협약체결을 원칙으로 하며 2년간 유효합니다.) <br>(단, 2017년도 이후부터는 타 교육기관과의
                        중복협약이 가능합니다.) <br> - 문의처 : 권철우 과장(070-4268-6187 /
                        82036600@kt.com)<br>
                        <br>
                        <image class="file"
                               src="${pageContext.request.contextPath}/resources/image/icon/icon_file.png"></image>
                        <a class="download"
                           href="${pageContext.request.contextPath}/resources/attach/컨소시엄협약서_2018.02.zip" download>컨소시엄협약서_2018.02.zip</a>
                    </div>
                </div>
            </div>
        </div>


        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTwo">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
                        aria-expanded="false" aria-controls="flush-collapseTwo">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">수료증을 받으려면 어떻게 해야하나요?</div>
                </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingTwo"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        일정시간이상 출석(80%)하시어 교육을 수료하셨다면, 홈페이지에서 수료증 다운로드 및 출력이 가능합니다. <br>
                        - 홈페이지 개인회원 로그인 => 마이페이지 => 수강완료 과정 => 수료증 다운로드
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingThree">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
                        aria-expanded="false" aria-controls="flush-collapseThree">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">교육비는 어떻게 되나요?</div>
                </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingThree"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">교육비는 전액(100%) 정부지원으로 교육생 소속사(사업주)의
                        자부담금이 없는 무료교육입니다.
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFour">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
                        aria-expanded="false" aria-controls="flush-collapseFour">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">훈련비용 지원한도액은 어떻게 확인 하나요?</div>
                </button>
            </h2>
            <div id="flush-collapseFour" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingFour"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        국가인적자원개발 컨소시엄 협약서 작성시, 위탁훈련비 지원동의서 페이지에 [훈련비용 지원한도액]란이 있습니다. <br>
                        노동부나 산업인력공단측에 문의하셔서 확인이 가능합니다. <br> 최저한도액은 5,000,000원으로 기업의
                        규모에 따라 금액이 증가합니다. <br> kt ds 교육센터에서 노동부사이트를 통해 직접 확인이 가능하므로
                        공란으로 비워두고 제출하셔도 무방합니다.
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFive">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseFive"
                        aria-expanded="false" aria-controls="flush-collapseFive">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">컨소시엄 협약서 작성할 때 고용안정 직업능력개발사업 보험료
                        납부금액은 어떻게 쓰나요?
                    </div>
                </button>
            </h2>
            <div id="flush-collapseFive" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingFive"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        국가인적자원개발컨소시엄 협약서 작성시, 일반현황페이지에 [고용안정 직업능력개발사업 보험료 납부금액]란이 있습니다.<br>
                        작년(현재 2013년도이면 2012년도)한 해 동안 납부하셨던 고용안정 보험료를 적어주시면 됩니다.<br>
                        kt ds 교육센터에서 노동부사이트를 통해 직접 확인이 가능하므로 공란으로 비워두고 제출하셔도 무방합니다.
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingSix">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseSix"
                        aria-expanded="false" aria-controls="flush-collapseSix">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">비밀번호를 잊어버렸는데 어떻게 하나요?</div>
                </button>
            </h2>
            <div id="flush-collapseSix" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingSix"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        컨소시엄 관리자에게 메일 또는 전화(문자)로 연락주시기 바랍니다.<br> 초기 PASSWORD는
                        123456789!로 설정되며 로그인 후 PASSWORD를 변경하셔야 합니다.
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingSeven">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven"
                        aria-expanded="false" aria-controls="flush-collapseSeven">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">고용보험이 적용되어야 교육수강을 할 수 있나요?</div>
                </button>
            </h2>
            <div id="flush-collapseSeven" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingSeven"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        컨소시엄 무료교육은 중소기업에 재직중이며 고용보험이 적용되고 있는 상태여야 수강이 가능합니다.<br> 위
                        사항에 해당되지 않으시는 분은 문의(문의처 : 권철우 과장 070-4268-6187) 주시기 바랍니다.<br>
                        <br> [고용보험 적용여부 확인]<br> - 고용보험관리공단 사이트 :
                        http:www.ei.go.kr
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingEight">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseEight"
                        aria-expanded="false" aria-controls="flush-collapseEight">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">연간 교육일정이 궁금합니다.</div>
                </button>
            </h2>
            <div id="flush-collapseEight" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingEight"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">게시판의 공지사항에서 교육일정 확인이 가능합니다.</div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingNine">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseNine"
                        aria-expanded="false" aria-controls="flush-collapseNine">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">수료 기준이 어떻게 되나요?</div>
                </button>
            </h2>
            <div id="flush-collapseNine" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingNine"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        - 교육과정의 총 출석률이 80 이상일 때 수료가 가능합니다.<br> (총 5일 과정 중 4일 출석 시
                        수료가능. 단 1일 결석후 지각, 조퇴가 있으면 미수료 됨)
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTen">
                <button class="accordion-button collapsed" type="button"
                        data-bs-toggle="collapse" data-bs-target="#flush-collapseTen"
                        aria-expanded="false" aria-controls="flush-collapseTen">
                    <div class="letterQ">Q</div>
                    <div class="faqQuestion">교육신청 및 입과절차는 어떻게 되나요?</div>
                </button>
            </h2>
            <div id="flush-collapseTen" class="accordion-collapse collapse"
                 aria-labelledby="flush-headingTen"
                 data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <div class="letterA">A</div>
                    <div class="faqAnswer">
                        아래 사항을 꼼꼼히 확인하시기 바랍니다. (협약을 체결한 기업은 ②번부터 적용 됩니다.) <br>※ kt
                        ds 컨소시엄 교육 : kt ds와 컨소시엄 협약을 체결한 중소기업 임직원들을 위한 무료교육 (비협약, 대기업:유료)
                        <br> <br>1. 교육 절차 : 必 <br>①협약체결 <br>②kt ds
                        교육홈페이지에 신청(https://edu.ktdsuniversity.com/) <br>③승인대기 <br>④kt
                        ds에서 요청하는 내용송부(주민번호 등) <br>⑤승인 <br>⑥수강 <br>⑦교육진행 <br>⑧수료
                        <br> <br> 2. 세부 내용 <br>① 협약체결 방법 첨부파일 작성(직인필) <br>-
                        원본 : 우편발송 <br>- 스캔본 : 교육시작 전까지 메일로 송부(82036600@kt.com) <br>
                        <br> ② kt ds 교육홈페이지에 신청(https://edu.ktdsuniversity.com/) <br>-
                        교육시작 전주 화요일까지 신청(③승인대기) <br>- 아래사항 제출시 목요일에 (⑤승인 상태로 변경) <br>
                        <br>④****교육시작 전 주 수요일까지 메일로 제출**** <br>1) 성명 : <br>2)
                        주민등록번호(13자리) : <br>3) 회사명 : <br>4) 연락처(핸드폰) : <br>5)
                        과정명 : <br>6) 교육일자 : <br> <br>⑥ kt ds에서 문자 발송 금요일
                        과정명, 교육일자, 시간 <br>- 홈페이지에서 사전 이해도 조사 실시 <br>⑦ 교육수강 종료전
                        사후이해도 조사 실시 <br>⑧ 수료 홈페이지에서 수료증 출력 <br> <br>[단일클래스를
                        통한 맞춤형 교육 시행] <br>1. 협력사에서 요청하는 교육강좌 개설 (담당자와 별도 협의) <br>2.
                        본 정규 과정 이외의 단일클래스 과정 개설 가능 (장소 : kt ds 방배사옥 강의장 또는 협력사 강의장(회의장)
                        가능) <br>주소 : 서울특별시 서초구 효령로 176 KT방배빌딩 B동 2층 담당자 : 권철우 과장
                        010-8753-2147
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="height: 150px;"></div>
</div>
=======
	<div class="sub_visual">
		<span style="color: white;">FAQ</span>
	</div>


	<div class="container">

		<!-- 최상단바 -->
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="/springEx/faq.do">FAQ</a></li>
			</ul>
		</div>

		<!-- 페이지에 대한 intro -->
		<div class="faqIntro">자주하는 질문에 대한 답변입니다.</div>

		<!-- FAQ 아코디언, 10개의 질문과 답변 -->
		<div class="accordion accordion-flush" id="accordionFlushExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingOne">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
						aria-expanded="false" aria-controls="flush-collapseOne">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">컨소시엄 협약은 어떻게 체결하나요?</div>
					</button>
				</h2>
				<div id="flush-collapseOne" class="accordion-collapse collapse"
					aria-labelledby="flush-headingOne"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							국가인적자원개발 컨소시엄 협약체결은 첨부된 컨소시엄 협약서(총 3P)를 작성하셔서 제출하여 주시면 됩니다.<br>(1년에
							1회 협약체결을 원칙으로 하며 2년간 유효합니다.) <br>(단, 2017년도 이후부터는 타 교육기관과의
							중복협약이 가능합니다.) <br> - 문의처 : 권철우 과장(070-4268-6187 /
							82036600@kt.com)<br> <br>
							<image class="file"
								src="${pageContext.request.contextPath}/resources/image/icon/icon_file.png"></image>
							<!-- 첨부파일 -->
							<a class="download"
								href="${pageContext.request.contextPath}/resources/attach/컨소시엄협약서_2018.02.zip"
								download>컨소시엄협약서_2018.02.zip</a>
						</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
						aria-expanded="false" aria-controls="flush-collapseTwo">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">수료증을 받으려면 어떻게 해야하나요?</div>
					</button>
				</h2>
				<div id="flush-collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTwo"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							일정시간이상 출석(80%)하시어 교육을 수료하셨다면, 홈페이지에서 수료증 다운로드 및 출력이 가능합니다. <br>
							- 홈페이지 개인회원 로그인 => 마이페이지 => 수강완료 과정 => 수료증 다운로드
						</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
						aria-expanded="false" aria-controls="flush-collapseThree">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">교육비는 어떻게 되나요?</div>
					</button>
				</h2>
				<div id="flush-collapseThree" class="accordion-collapse collapse"
					aria-labelledby="flush-headingThree"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">교육비는 전액(100%) 정부지원으로 교육생 소속사(사업주)의
							자부담금이 없는 무료교육입니다.</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFour">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseFour"
						aria-expanded="false" aria-controls="flush-collapseFour">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">훈련비용 지원한도액은 어떻게 확인 하나요?</div>
					</button>
				</h2>
				<div id="flush-collapseFour" class="accordion-collapse collapse"
					aria-labelledby="flush-headingFour"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							국가인적자원개발 컨소시엄 협약서 작성시, 위탁훈련비 지원동의서 페이지에 [훈련비용 지원한도액]란이 있습니다. <br>
							노동부나 산업인력공단측에 문의하셔서 확인이 가능합니다. <br> 최저한도액은 5,000,000원으로 기업의
							규모에 따라 금액이 증가합니다. <br> kt ds 교육센터에서 노동부사이트를 통해 직접 확인이 가능하므로
							공란으로 비워두고 제출하셔도 무방합니다.
						</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingFive">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseFive"
						aria-expanded="false" aria-controls="flush-collapseFive">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">컨소시엄 협약서 작성할 때 고용안정 직업능력개발사업 보험료
							납부금액은 어떻게 쓰나요?</div>
					</button>
				</h2>
				<div id="flush-collapseFive" class="accordion-collapse collapse"
					aria-labelledby="flush-headingFive"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							국가인적자원개발컨소시엄 협약서 작성시, 일반현황페이지에 [고용안정 직업능력개발사업 보험료 납부금액]란이 있습니다.<br>
							작년(현재 2013년도이면 2012년도)한 해 동안 납부하셨던 고용안정 보험료를 적어주시면 됩니다.<br>
							kt ds 교육센터에서 노동부사이트를 통해 직접 확인이 가능하므로 공란으로 비워두고 제출하셔도 무방합니다.
						</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSix">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseSix"
						aria-expanded="false" aria-controls="flush-collapseSix">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">비밀번호를 잊어버렸는데 어떻게 하나요?</div>
					</button>
				</h2>
				<div id="flush-collapseSix" class="accordion-collapse collapse"
					aria-labelledby="flush-headingSix"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							컨소시엄 관리자에게 메일 또는 전화(문자)로 연락주시기 바랍니다.<br> 초기 PASSWORD는
							123456789!로 설정되며 로그인 후 PASSWORD를 변경하셔야 합니다.
						</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingSeven">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven"
						aria-expanded="false" aria-controls="flush-collapseSeven">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">고용보험이 적용되어야 교육수강을 할 수 있나요?</div>
					</button>
				</h2>
				<div id="flush-collapseSeven" class="accordion-collapse collapse"
					aria-labelledby="flush-headingSeven"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							컨소시엄 무료교육은 중소기업에 재직중이며 고용보험이 적용되고 있는 상태여야 수강이 가능합니다.<br> 위
							사항에 해당되지 않으시는 분은 문의(문의처 : 권철우 과장 070-4268-6187) 주시기 바랍니다.<br>
							<br> [고용보험 적용여부 확인]<br> - 고용보험관리공단 사이트 :
							http:www.ei.go.kr
						</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingEight">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseEight"
						aria-expanded="false" aria-controls="flush-collapseEight">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">연간 교육일정이 궁금합니다.</div>
					</button>
				</h2>
				<div id="flush-collapseEight" class="accordion-collapse collapse"
					aria-labelledby="flush-headingEight"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">게시판의 공지사항에서 교육일정 확인이 가능합니다.</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingNine">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseNine"
						aria-expanded="false" aria-controls="flush-collapseNine">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">수료 기준이 어떻게 되나요?</div>
					</button>
				</h2>
				<div id="flush-collapseNine" class="accordion-collapse collapse"
					aria-labelledby="flush-headingNine"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							- 교육과정의 총 출석률이 80 이상일 때 수료가 가능합니다.<br> (총 5일 과정 중 4일 출석 시
							수료가능. 단 1일 결석후 지각, 조퇴가 있으면 미수료 됨)
						</div>
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="flush-headingTen">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#flush-collapseTen"
						aria-expanded="false" aria-controls="flush-collapseTen">
						<div class="letterQ">Q</div>
						<div class="faqQuestion">교육신청 및 입과절차는 어떻게 되나요?</div>
					</button>
				</h2>
				<div id="flush-collapseTen" class="accordion-collapse collapse"
					aria-labelledby="flush-headingTen"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">
						<div class="letterA">A</div>
						<div class="faqAnswer">
							아래 사항을 꼼꼼히 확인하시기 바랍니다. (협약을 체결한 기업은 ②번부터 적용 됩니다.) <br>※ kt
							ds 컨소시엄 교육 : kt ds와 컨소시엄 협약을 체결한 중소기업 임직원들을 위한 무료교육 (비협약, 대기업:유료)
							<br> <br>1. 교육 절차 : 必 <br>①협약체결 <br>②kt ds
							교육홈페이지에 신청(https://edu.ktdsuniversity.com/) <br>③승인대기 <br>④kt
							ds에서 요청하는 내용송부(주민번호 등) <br>⑤승인 <br>⑥수강 <br>⑦교육진행 <br>⑧수료
							<br> <br> 2. 세부 내용 <br>① 협약체결 방법 첨부파일 작성(직인필) <br>-
							원본 : 우편발송 <br>- 스캔본 : 교육시작 전까지 메일로 송부(82036600@kt.com) <br>
							<br> ② kt ds 교육홈페이지에 신청(https://edu.ktdsuniversity.com/) <br>-
							교육시작 전주 화요일까지 신청(③승인대기) <br>- 아래사항 제출시 목요일에 (⑤승인 상태로 변경) <br>
							<br>④****교육시작 전 주 수요일까지 메일로 제출**** <br>1) 성명 : <br>2)
							주민등록번호(13자리) : <br>3) 회사명 : <br>4) 연락처(핸드폰) : <br>5)
							과정명 : <br>6) 교육일자 : <br> <br>⑥ kt ds에서 문자 발송 금요일
							과정명, 교육일자, 시간 <br>- 홈페이지에서 사전 이해도 조사 실시 <br>⑦ 교육수강 종료전
							사후이해도 조사 실시 <br>⑧ 수료 홈페이지에서 수료증 출력 <br> <br>[단일클래스를
							통한 맞춤형 교육 시행] <br>1. 협력사에서 요청하는 교육강좌 개설 (담당자와 별도 협의) <br>2.
							본 정규 과정 이외의 단일클래스 과정 개설 가능 (장소 : kt ds 방배사옥 강의장 또는 협력사 강의장(회의장)
							가능) <br>주소 : 서울특별시 서초구 효령로 176 KT방배빌딩 B동 2층 담당자 : 권철우 과장
							010-8753-2147
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 빈 공간 -->
		<div style="height: 150px;"></div>
	</div>
>>>>>>> 916daa06ad6ea8a921cb58b5239ce1b8b019d034
</body>
</html>