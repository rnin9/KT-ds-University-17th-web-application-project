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
	transform: translateX(30%);
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

.footer-upper .upper-right {
	float: right;
}

.footer-upper .upper-right>li>h3 {
	float: right;
}
.footer-upper .upper-right>li>h3>a {
	float: right;
	padding: 10px;
	color: #dee1e6;
}

.footer-bottom ul {
	display: flex;
	flex-direction: row;
	justify-content: left;
	padding: 30px 0px;
	margin-bottom:0px;
	margin-left: 100px;
}

.yesborder {
	list-style: none;
	padding: 0 10px;
	border-left: ridge;
	color: #dee1e6;
	font-size: 12px;
}
.noborder {
	list-style: none;
	padding: 0 10px;
	font-size: 12px;
}

</style>

<div style="font-family: S-CoreDream-3Light; width: 90%; margin-left: 5%">
	<div>
		<img
				src="${pageContext.request.contextPath}/resources/image/header/logo/footer_logo.png"
				alt="로고"
				style="width: 100px; height: 70px; float: left; margin-left: 100px; margin-top: 30px" />
	</div>
	<div class="footer-upper">

		<ul class="upper-right">
			<li>
				<h3>
					<a href="https://twitter.com/ktds_university" target="_blank"><i class="fab fa-twitter-square"></i></a>
				</h3>
			</li>
			<li>
				<h3>
					<a href="https://www.facebook.com/ktdsuniversity/" target="_blank"
						><i class="fab fa-facebook-square"></i></a>
				</h3>
			</li>
			<li>
				<h3>
					<a
						href="https://github.com/rnin9/KT-ds-University-17th-web-application-project"
						target="_blank"><i
						class="fab fa-github-square"></i></a>
				</h3>
			</li>
			<li>
				<h3>
					<a href="https://www.ktds.com/index.jsp"><i
						class="fas fa-home"></i></a>
				</h3>
			</li>
		</ul>

	</div>
	<div class="footer-bottom">
		<div>
			<ul>
				<li class="noborder">
					<a style="color: #dee1e6; font-weight: bold" href="https://edu.ktdsuniversity.com/member/ly_privacy.action" target="_blank"
					   >개인정보 처리방침</a>
				</li>
				<li class="yesborder">대표이사 우정민</li>
				<li class="yesborder">(06707) 서울 서초구 효령로 176, 02-523-7029</li>
				<li class="yesborder">COPYRIGHT 2018 kt ds ALL RIGHTS RESERVED</li>
			</ul>
		</div>
	</div>
</div>