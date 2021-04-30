<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>   

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
		<table class="table_">
			<thead>
				<tr align="center">
					<td><input type="checkbox" class="join_box" /></td>
					<td><b>아이디</b></td>
					<td><b>이름</b></td>
					<td><b>전화번호</b></td>
					<td><b>이메일</b></td>
					<td><b>소속회사</b></td>
					<td><b>강의명</b></td>
					<td><b>수강상태</b></td>
					<td><b>신청일</b></td>
					<td><b>수료일</b></td>
				</tr>
			</thead>

			<tbody id="ajaxTable">
					<tr align="center">
						<td><input type="checkbox" class="ab" /></td>
						<td>aa</td>
						<td>aa</td>
						<td>aa</td>
						<td>aa</td>
						<td>aa</td>
						<td>aa</td>
						<td>aa</td>
						<td>aa</td>
						<td>aa</td>
					</tr>
			</tbody>
		</table>
</body>
</html>