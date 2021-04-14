<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>공지사항</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/notice/insertNotice.do");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
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
			<form name="writeForm" method="post"
				action="${contextPath}/notice/insertNotice.do">
				<table>
					<tbody>
						<tr>
							<td><label for="notice_category">분류</label><input
								type="text" id="notice_category" name="notice_category" class="chk" title="분류를 입력하세요."/></td>
						</tr>
						<tr>
							<td><label for="notice_title">제목</label><input type="text"
								id="notice_title" name="notice_title" class="chk" title="제목을 입력하세요."/></td>
						</tr>
						<tr>
							<td><label for="notice_contents">내용</label>
							<textarea id="notice_contents" name="notice_contents" class="chk" title="내용을 입력하세요."></textarea>
							</td>
						</tr>
						<tr>
							<td><label for="notice_adminID">작성자</label><input
								type="text" id="notice_adminID" name="notice_adminID" class="chk" title="작성자를 입력하세요." /></td>
						<tr>
							<td>
								<button class="write_btn" type="submit">작성</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>