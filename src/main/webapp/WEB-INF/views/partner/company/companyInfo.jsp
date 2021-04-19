<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style2.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<style>
</style>
</head>
<body>
	<div class="container">
		<h2>회사 정보</h2>
		<table class="table_">
			<tr>
				<th>회사 이름</th>
				<td>${partner.partnerName}</td>
			</tr>
			<tr>
				<th>협약 상태</th>
				<td>${partner.partnerState}</td>
			</tr>
			<tr>
				<th>회사 주소</th>
				<td>${partner.partnerAddress}</td>
			</tr>
			<tr>
				<th>회사 전화번호</th>
				<td>${partner.partnerPhoneNumber}</td>
			</tr>
			<tr>
				<th>회사 정보</th>
				<td>${partner.partnerInformation}</td>
			</tr>
			<tr>
				<th>인원 규모</th>
				<td>${partner.partnerHeadCount}</td>
			</tr>
			<tr>
				<th>회사 홈페이지</th>
				<td><a href="https://${partner.partnerURL}" target="_blank">${partner.partnerURL}</a></td>
			</tr>
		</table>
	</div>
</body>
</html>