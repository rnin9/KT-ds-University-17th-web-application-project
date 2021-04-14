
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@page import="java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>공지사항 목록창</title>
</head>

<body>
	<div>
		<%@include file="noticeNav.jsp"%>
	</div>
	<!--paginate -->
									<div class="paginate">
										<div class="paging">
											<a class="direction prev" href="javascript:void(0);"
												onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
												&lt;&lt; </a> <a class="direction prev"
												href="javascript:void(0);"
												onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
												&lt; </a>

											<c:forEach begin="${pagination.firstPage}"
												end="${pagination.lastPage}" var="idx">
												<a
													style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
													href="javascript:void(0);"
													onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
														value="${idx}" /></a>
											</c:forEach>
											<a class="direction next" href="javascript:void(0);"
												onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
												&gt; </a> <a class="direction next" href="javascript:void(0);"
												onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
												&gt;&gt; </a>
										</div>
									</div>
									<!-- /paginate -->

									<div class="bottom">
										<div class="bottom-left">
											<select id="cntSelectBox" name="cntSelectBox"
												onchange="changeSelectBox(${pagination.currentPage},${pagination.cntPerPage},${pagination.pageSize});" class="form-control" style="width: 100px;">
												<option value="10"
													<c:if test="${pagination.cntPerPage == '10'}">selected</c:if>>10개씩</option>
												<option value="20"
													<c:if test="${pagination.cntPerPage == '20'}">selected</c:if>>20개씩</option>
												<option value="30"
													<c:if test="${pagination.cntPerPage == '30'}">selected</c:if>>30개씩</option>
											</select>
										</div>
									</div>
	
	
	<table class="table table-hover">
		<form class='search'>
			<select class="form-select form-select-sm"
				aria-label=".form-select-sm example">
				<option value='' selected>-- 선택 --</option>
				<option value='notice'>일반공지</option>
				<option value='prospective'>채용예정자</option>
				<option value='in office'>재직자</option>
				<div>
					<input type="text" class="form-control" placeholder="제목으로 검색"
						style="text-align: center; width: 300px; display: inline-block;">
					<!-- Indicates a successful or positive action -->
					<button type="button" class="btn btn-primary"
						style="width: 80px; display: inline-block;">검색</button>
				</div>
			</select>
		</form>

		<tr>
			<th><input type="checkbox" name="checkAll" onclick="CheckAll();" /></th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>

		</tr>
		<c:forEach var="noticeList" items="${noticeList}">
			<tr>
				<th><label><input type="checkbox"></label></th>
				<td>${noticeList.notice_category}</td>
				<td><a
					href="${contextPath}/notice/readNotice.do?notice_no=${noticeList.notice_no}">
						<c:out value="${noticeList.notice_title}" />
				</a></td>
				<!--  <td>${notice.notice_title}</td> -->
				<td>${noticeList.notice_adminID}</td>
				<td>${noticeList.notice_date}</td>
				<td>${noticeList.notice_hit}</td>

			</tr>
		</c:forEach>

		<tr>
			<td colspan="7" style="text-align: right;"><a
				href="${contextPath}/notice/noticeForm.do">글쓰기</a></td>
		</tr>

		<tr>
			<td colspan="7">
				<center>
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
					<a href="#">5</a> <a href="#">다음▶</a>
				</center>
			</td>
		</tr>
	</table>



	<!-- 부가적인 테마 -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	
	
<script>
function changeSelectBox(currentPage, cntPerPage, pageSize){
    var selectValue = $("#cntSelectBox").children("option:selected").val();
    movePage(currentPage, selectValue, pageSize);
    
}
 
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    var url = "${pageContext.request.contextPath}/notice/listNotice.do";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>
</body>
</html>
