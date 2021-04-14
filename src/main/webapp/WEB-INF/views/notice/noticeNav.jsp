<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<div>

	<div>
		<a href="${contextPath}/notice/listNotice.do">목록</a>
		<a href="${contextPath}/notice/noticeForm.do">글 작성</a>


	</div>

</div>