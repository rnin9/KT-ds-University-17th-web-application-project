<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%--========================import module start============================= --%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="htmlcss bootstrap menu, navbar, mega menu examples" />
<meta name="description"
	content="Bootstrap navbar examples for any type of project, Bootstrap 4" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Bootstrap files (jQuery first, then Popper.js, then Bootstrap JS) -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous">
	
</script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<!--CDN 링크 -->

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Droid+Sans" />
<%--폰트 --%>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />


<%--========================import module end============================= --%>


<style>
#container {
	width: 100%;
	text-align: center;
	border: 0px solid #bcbcbc;
}

#header {
	/*  margin-bottom: 5px; */
	border: 0px solid #bcbcbc;
	position: fixed;
	width: 100%;
	z-index: 997;
}

#sidebar-left {
	width: 15%;
	height: 700px;
	padding: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
	float: left;
	background-color: yellow;
	border: 0px solid #bcbcbc;
	font-size: 10px;
}

#content {
	width: 100%;
	padding-top: 64px;
	border: 0px solid #bcbcbc;
	background-color: white;

	padding-bottom: 20px;
}

#footer {
	clear: both;
	width: 100%;
	border: 0px solid #bcbcbc;
	background-color: #333; /* 
        display:flex; */
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

</style>

<%-- =================custom css start========================= --%>
<style type="text/css">

/* =====================font================ */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

@font-face {
	font-family: 'Chosunilbo_myungjo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Wemakeprice-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
/* ===============font-end=========== */

/* ============ only desktop view ============ */
@media all and (min-width: 800px) {
	.navbar .nav-item .dropdown-menu {
		opacity: 0;
		visibility: hidden;
		transition: .3s;
		margin-top: 0;
	}
	.navbar .nav-item:hover .nav-link:hover {
		color: rebeccapurple;
		border-bottom: 2px solid rebeccapurple;
	}
	.navbar .dropdown-menu .fade-down {
		top: 80%;
		transform: rotateX(-75deg);
		transform-origin: 0% 0%;
		color: rebeccapurple;
	}
	.navbar .dropdown-menu .fade-up {
		top: 180%;
		color: rebeccapurple;
	}
	.navbar .nav-item:hover .dropdown-menu {
		display: block;
		transition: .3s;
		opacity: 1;
		visibility: visible;
		top: 100%;
		transform: rotateX(0deg);
		color: rebeccapurple;
	}
}

.bg-primary {
	background-color: white !important;
	box-shadow: 0px 5px 5px -2px rgba(25, 25, 25, 0.15);
	-webkit-box-shadow: 0px 5px 5px -2px rgba(25, 25, 25, 0.15);
	-moz-box-shadow: 0px 5px 5px -2px rgba(25, 25, 25, 0.15);
}

.navbar-dark .navbar-nav .nav-item .nav-link {
	color: black;
	font-family: S-CoreDream-3Light;
	font-weight: bold;
	transition: color 0.4s; /* For modern browsers */
}

.navbar-brand img {
	width: 118px;
	height: 37px;
	padding-bottom: 1px;
}
</style>
<%-- =================custom css end========================= --%>

<title><tiles:insertAttribute name="title" /></title>

</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<%--   <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div> --%>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>