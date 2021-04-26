<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<%
String userName = request.getParameter("userName");
String courseName = request.getParameter("courseName");
String courseStart = request.getParameter("courseStart");
String courseEnd = request.getParameter("courseEnd");
String syllabusTotalTime = request.getParameter("syllabusTotalTime");
String userBirthday = request.getParameter("userBirthday");
String userCompany = request.getParameter("userCompany");
%>


<html>
<head>
<meta charset=UTF-8">
<title>수료증</title>
<style>
.certificate_container {
	display: inline-block;
	vertical-align: middle;
	border: 0;
	font-size: 32px;
	border: 10px double gold;
	width: 800px;
	height: 1168px;
	margin: 30px;
	font-family: 궁서;
}

p {
	text-align: center;
}

th {
	text-align: justify;
	width:130px;
}
</style>

</head>


<body>

	<div class="certificate_container">
		<div class="certificate_content">

			<p style="font-size: 80px; margin-top: 150px; margin-bottom: 100px;">수
				료 증</p>

			<table class="table_notice"
				style="font-size: 30px; margin-left: 100px; line-height: 50px;">
				<tr>
					<th>과 정 명</th>

					<td>:  <%=courseName%></td>
				</tr>
				<tr>
					<th>기 간</th>
					<td>:  <%=courseStart%> ~ <%=courseEnd%> (<%=syllabusTotalTime%>
						시간)</td>
				</tr>
				<tr>
					<th>소  속</th>
					<td>:  <%=userCompany%></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>:  <%=userBirthday%></td>
				</tr>
				<tr>
					<th>성  명</th>
					<td>:  <%=userName%></td>
				</tr>
			</table>

			<p
				style="font-size: 30px; line-height: 50px; margin:100px 100px 0 100px;text-align: justify">
				위 사람은 상기와 같이 kt ds University 에서 실시한 교육과정을 이수하였기에 이 수료증을
				수여함
			</p>
			<br> <br> <br>
			<p style="margin-bottom: 20px;font-size: 25px;">
				<script>
					var date = new Date();
					document.write(date.getFullYear() + " 년 "
							+ (date.getMonth() + 1) + " 월 " + date.getDate()
							+ " 일<br>");
				</script>
			</p>
			<p style="font-size: 40px;">kt ds University</p>
			<script>
				window.print();
			</script>
		</div>
	</div>
</body>
</html>