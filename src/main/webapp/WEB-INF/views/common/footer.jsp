<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style type="text/css">
@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.footer-upper {
	display: flex;
	flex-direction: row;
	justify-content: center;
	padding-top: 30px;
}

.footer-upper>ul>li {
	width: 300px;
	list-style: none;
}

.footer-upper .upper-left>li>h5 {
	color: red;
	padding: 10px;
}

.footer-upper .upper-right>li>h3 {
	float: right;
	padding: 10px;
}

.footer-bottom ul {
	display: flex;
	flex-direction: row;
	justify-content: center;
	padding: 45px 25px;
}

.footer-bottom ul li {
	list-style: none;
	padding: 0 10px;
	border-left: ridge;
	color: #dee1e6;
	font-size: 12px;
}
</style>

<div style="font-family: S-CoreDream-3Light;">
	<div class="footer-upper">
		<ul class="upper-left">
			<li><h5>
					<a href="https://recruit.kt.com/privacy/privacy" target="_blank"
						style="color: red; text-decoration: none;">개인정보 처리방침</a>
				</h5></li>
		</ul>
		<ul class="upper-right">
			<li>
				<h3>
					<a href="https://twitter.com/?lang=ko/" target="_blank"
						style="color: #dee1e6;"><i class="fab fa-twitter-square"></i></a>
				</h3>
			</li>
			<li>
				<h3>
					<a href="https://www.facebook.com/" target="_blank"
						style="color: #dee1e6;"><i class="fab fa-facebook-square"></i></a>
				</h3>
			</li>
			<li>
				<h3>
					<a
						href="https://github.com/rnin9/KT-ds-University-17th-web-application-project"
						target="_blank" style="color: #dee1e6;"><i
						class="fab fa-github-square"></i></a>
				</h3>
			</li>
			<li>
				<h3>
					<a href="https://www.ktds.com/index.jsp" style="color: #dee1e6;"><i
						class="fas fa-home"></i></a>
				</h3>
			</li>
		</ul>

	</div>
	<div class="footer-bottom">
		<div>
			<div>
				<img
					src="${pageContext.request.contextPath}/resources/image/header/logo/footer_logo.png"
					alt="로고"
					style="width: 140px; height: 100px; float: left; margin-left: 40px;" />
			</div>
			<ul>
				<li>(주)케이티 대표이사 구현모</li>
				<li>사업자등록번호 102-81-42945</li>
				<li>13606 경기도 성남시 분당구 불정로 90 (정자동 206번지)</li>
				<li>ⓒ Copyright 2017 by KT corp. All Right Reserved.</li>
			</ul>
		</div>
	</div>
</div>