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
	margin-bottom:0px;
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
					<a href="https://www.ktds.com/etc/privacy_new.jsp" target="_blank"
						style="color: red; text-decoration: none;">개인정보 처리방침</a>
				</h5></li>
		</ul>
		<ul class="upper-right">
			<li>
				<h3>
					<a href="https://twitter.com/ktds_university" target="_blank"
						style="color: #dee1e6;"><i class="fab fa-twitter-square"></i></a>
				</h3>
			</li>
			<li>
				<h3>
					<a href="https://www.facebook.com/ktdsuniversity/" target="_blank"
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
				<li>대표이사 우정민</li>
				<li>(06707) 서울 서초구 효령로 176, 02-523-7029</li>
				<li>COPYRIGHT 2018 kt ds ALL RIGHTS RESERVED</li>
			</ul>
		</div>
	</div>
</div>