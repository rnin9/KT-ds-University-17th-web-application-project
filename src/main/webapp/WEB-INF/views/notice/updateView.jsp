<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "${contextPath}/notice/listNotice.do";
		})
		
		$(".update_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "${contextPath}/notice/updateNotice.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
		
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i = 0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />
		<div>
			<%@include file="noticeNav.jsp"%>
		</div>
		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="${contextPath}/notice/updateNotice.do">
				<input type="hidden" name="notice_no"
					value="${updateNotice.notice_no}" readonly='readonly' />
				<table>
					<tbody>
						<tr>
							<td><label for="notice_category">분류</label><input
								type="text" id="notice_category" name="notice_category" 
								value="${updateNotice.notice_category}" class="chk" title="분류를 입력하세요."/></td>
						</tr>
						<tr>
							<td><label for="notice_title">제목</label><input type="text"
								id="notice_title" name="notice_title" 
								value="${updateNotice.notice_title}" class="chk" title="제목을 입력하세요."/></td>
						</tr>
						<tr>
							<td><label for="notice_contents">내용</label> <textarea
									id="notice_contents" name="notice_contents" class="chk" title="내용을 입력하세요.">${updateNotice.notice_contents}</textarea></td>
						</tr>
					</tbody>
				</table>
				<div>
					<button class="update_btn" type="submit" class="update_btn">저장</button>
					<button type="submit" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>