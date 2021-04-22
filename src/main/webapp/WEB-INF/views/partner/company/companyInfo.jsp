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
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<style>
.partnerInfo>dl>dt {
	float: left;
}
</style>
</head>
<body>
	<div class="container">
		<div class="partnerInfo">
			<dl>
				<dt>회사 이름</dt>
				<dd>${partner.partnerName}</dd>
				<dt>협약 상태</dt>
				<dd>${partner.partnerState}</dd>
				<dt>회사 주소</dt>
				<dd>${partner.partnerAddress}</dd>
				<dt>회사 전화번호</dt>
				<dd>${partner.partnerPhoneNumber}</dd>
				<dt>회사 정보</dt>
				<dd>${partner.partnerInformation}</dd>
				<dt>인원 규모</dt>
				<dd>${partner.partnerHeadCount}</dd>
				<dt>회사 홈페이지</dt>
				<dd><a href="https://${partner.partnerURL}" target="_blank">${partner.partnerURL}</a></dd>
			</dl>
		</div>
	</div>

</body>
</html>