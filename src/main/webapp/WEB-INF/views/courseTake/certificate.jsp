<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<%
String userName = request.getParameter("test1");
String courseName = request.getParameter("test2");
%>


<html>
<head>
<meta charset=UTF-8">
<title>수료증</title>
<style>
.certificate_container {
	width: 500px;
	display: inline-block;
	vertical-align: middle;
	background:
		url("${pageContext.request.contextPath}/resources/image/etc/ktdsUniv-background-logo.png");
	border: 0;
	font-size: 32px;
	margin-top: 50px;
	background-size: cover;
	background-repeat: no-repeat;
}

.certificate_content {
	text-align: center;
	font-size: 20px;
	line-height: 40px;
	margin-top: 150px;
}
</style>

</head>


<body>

	<div class="certificate_container">
		<div class="certificate_content">
			<b><%=userName%></b>님은 kt ds University에서 진행된<br> <b><%=courseName%></b> 강의를
			<br>수료하였음을 인증합니다.<br> <br> <br>
			<script>
				var date = new Date();
				document.write(date.getFullYear() + "." + (date.getMonth() + 1)
						+ "." + date.getDate() + "<br>");
			</script>
			<script>window.print();</script>
		</div>
	</div>
</body>
</html>