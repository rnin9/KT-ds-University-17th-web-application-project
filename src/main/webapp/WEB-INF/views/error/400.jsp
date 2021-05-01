<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
<head itemscope="" itemtype="http://schema.org/WebSite">
<title itemprop="name">Preview Bootstrap snippets. 404 error
	page with particles</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="Preview Bootstrap snippets. 404 error page with particles. Copy and paste the html, css and js code for save time, build your app faster and responsive">

<link rel="shortcut icon" type="image/x-icon"
	href="https://www.bootdey.com/img/favicon.ico">
<link rel="apple-touch-icon" sizes="135x140"
	href="https://www.bootdey.com/img/bootdey_135x140.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="https://www.bootdey.com/img/bootdey_76x76.png">
<link rel="canonical"
	href="https://www.bootdey.com/snippets/preview/404-error-page-with-particles"
	itemprop="url">
<meta property="og:title"
	content="Preview Bootstrap  snippets. 404 error page with particles">
<meta property="og:url"
	content="https://www.bootdey.com/snippets/preview/404-error-page-with-particles">
<meta property="og:image"
	content="https://www.bootdey.com/files/SnippetsImages/bootstrap-snippets-622.png">
<meta property="og:description"
	content="Preview Bootstrap snippets. 404 error page with particles. Copy and paste the html, css and js code for save time, build your app faster and responsive">
<link rel="alternate" type="application/rss+xml"
	title="Latest snippets resources templates and utilities for bootstrap from bootdey.com:"
	href="http://bootdey.com/rss">
<link rel="author"
	href="https://plus.google.com/u/1/106310663276114892188">
<link rel="publisher"
	href="https://plus.google.com/+Bootdey-bootstrap/posts">
<meta name="msvalidate.01" content="23285BE3183727A550D31CAE95A790AB">
<script
	src="/cache-js/cache-1598759682-97135bbb13d92c11d6b2a92f6a36685a.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="snippetContent">
		<link rel="stylesheet"
			href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
			integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
			crossorigin="anonymous"></script>
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
		<link
			href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
			rel="stylesheet">
		<div id="particles-js">
			<div class="page-404">
				<div class="outer">
					<div class="middle">
						<div class="inner">
							<div class="inner-circle">
								<i class="fa fa-home"></i><span>400</span>
							</div>
							<span class="inner-status">잘못된 요청입니다.</span> <span
								class="inner-detail" style="color: #fff;"> 요청을 인식 할 수 없습니다.
							<br>
							<br>
							<c:choose>
                     <c:when test ="${member.userPosition == 'ADMIN' || member.userPosition == 'PARTNER'}">
                     <a href="${contextPath}/partner/main.do" class="btn btn-info mtl"><i
                           class="fa fa-home"></i>&nbsp; 홈으로 이동 </a>
                     </c:when>
                     <c:otherwise>
                     <a href="${contextPath}/main.do" class="btn btn-info mtl"><i
                           class="fa fa-home"></i>&nbsp; 홈으로 이동 </a>
                     </c:otherwise>
                     </c:choose>
							</span>
						</div>
					</div>
				</div>
			</div>
			<canvas class="particles-js-canvas-el" width="2324" height="1162"
				style="width: 100%; height: 100%;"></canvas>
		</div>
		<style type="text/css">
.clearfix:before, .clearfix:after {
	display: table;
	content: ' ';
}

.clearfix:after {
	clear: both;
}

body {
	background: #f0f0f0 !important;
}

#particles-js {
	width: 100%;
	height: 100%;
	background-color: #224469;
}

.page-404 .outer {
	position: absolute;
	top: 0;
	display: table;
	width: 100%;
	height: 100%;
}

.page-404 .outer .middle {
	display: table-cell;
	vertical-align: middle;
}

.page-404 .outer .middle .inner {
	width: 300px;
	margin-right: auto;
	margin-left: auto;
}

.page-404 .outer .middle .inner .inner-circle {
	height: 300px;
	border-radius: 50%;
	background-color: #ffffff;
}

.page-404 .outer .middle .inner .inner-circle:hover i {
	color: #39bbdb !important;
	background-color: #f5f5f5;
	box-shadow: 0 0 0 15px #39bbdb;
}

.page-404 .outer .middle .inner .inner-circle:hover span {
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-circle i {
	font-size: 5em;
	line-height: 1em;
	float: right;
	width: 1.6em;
	height: 1.6em;
	margin-top: -.7em;
	margin-right: -.5em;
	padding: 20px;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: #f5f5f5 !important;
	border-radius: 50%;
	background-color: #39bbdb;
	box-shadow: 0 0 0 15px #f0f0f0;
}

.page-404 .outer .middle .inner .inner-circle span {
	font-size: 11em;
	font-weight: 700;
	line-height: 1.2em;
	display: block;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: #e0e0e0;
}

.page-404 .outer .middle .inner .inner-status {
	font-size: 20px;
	display: block;
	margin-top: 20px;
	margin-bottom: 5px;
	text-align: center;
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-detail {
	line-height: 1.4em;
	display: block;
	margin-bottom: 10px;
	text-align: center;
	color: #999999;
}
</style>
		<script type="text/javascript">
			particlesJS("particles-js", {
				"particles" : {
					"number" : {
						"value" : 80,
						"density" : {
							"enable" : true,
							"value_area" : 800
						}
					},
					"color" : {
						"value" : "#ffffff"
					},
					"shape" : {
						"type" : "circle",
						"stroke" : {
							"width" : 0,
							"color" : "#000000"
						},
						"polygon" : {
							"nb_sides" : 5
						},
						"image" : {
							"src" : "img/github.svg",
							"width" : 100,
							"height" : 100
						}
					},
					"opacity" : {
						"value" : 0.5,
						"random" : false,
						"anim" : {
							"enable" : false,
							"speed" : 1,
							"opacity_min" : 0.1,
							"sync" : false
						}
					},
					"size" : {
						"value" : 3,
						"random" : true,
						"anim" : {
							"enable" : false,
							"speed" : 40,
							"size_min" : 0.1,
							"sync" : false
						}
					},
					"line_linked" : {
						"enable" : true,
						"distance" : 150,
						"color" : "#ffffff",
						"opacity" : 0.4,
						"width" : 1
					},
					"move" : {
						"enable" : true,
						"speed" : 6,
						"direction" : "none",
						"random" : false,
						"straight" : false,
						"out_mode" : "out",
						"bounce" : false,
						"attract" : {
							"enable" : false,
							"rotateX" : 600,
							"rotateY" : 1200
						}
					}
				},
				"interactivity" : {
					"detect_on" : "canvas",
					"events" : {
						"onhover" : {
							"enable" : true,
							"mode" : "grab"
						},
						"onclick" : {
							"enable" : true,
							"mode" : "push"
						},
						"resize" : true
					},
					"modes" : {
						"grab" : {
							"distance" : 140,
							"line_linked" : {
								"opacity" : 1
							}
						},
						"bubble" : {
							"distance" : 400,
							"size" : 40,
							"duration" : 2,
							"opacity" : 8,
							"speed" : 3
						},
						"repulse" : {
							"distance" : 200,
							"duration" : 0.4
						},
						"push" : {
							"particles_nb" : 4
						},
						"remove" : {
							"particles_nb" : 2
						}
					}
				},
				"retina_detect" : true
			});
		</script>
	</div>
</body>
</html>