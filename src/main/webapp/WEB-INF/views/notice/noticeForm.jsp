<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<!-- jQuery 라이브러리 참조-->
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<!-- plugin 참조-->
<script type="text/javascript"
	src="js/plugins/validation/jquery.validate.min.js"></script>
<meta charset=UTF-8">
<title>공지사항 등록</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<style>
.bg-primary {
	background-color: white !important;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.table_notice {
	margin-top: 30px;
	border-collapse: collapse;
	text-align: center;
	/* color: #555; */
	width: 100%;
	line-height: 40px;
}

.table_notice th {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
	background-color: #f8f8f8;
	text-align: center;
	font-size: 15px;
	width: 30%;
}

.table_notice td {
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
	text-align: center;
	font-size: 15px;
}

.informTitle {
	margin-top: 20px;
	text-align: left;
	font-size: 18px;
	font-weight: 600;
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #e0e0e0;
	letter-spacing: 5px;
	padding-bottom: 20px;
	background-color: #f8f8f8;
}

.informBox {
	overflow: hidden;
	height: auto;
	text-align: left;
	font-size: 16px;
	line-height: 30px;
	padding: 20px 60px 20px 60px;
	margin-bottom: 20px;
	margin-bottom: 20px;
}

.informInputBox {
	/* overflow: hidden; */
	min-height: 220px;
	text-align: left;
	font-size: 16px;
	line-height: 30px;
	padding: 20px 60px 20px 60px;
	margin-bottom: 20px;
	margin-top: 20px;
	width: 100%;
	border: 1px solid #e4e4e4;
}

.button_bottom_I {
	background-color: tomato;
	float: right;
	margin-left: 10px;
}

.button_bottom_C {
	background-color: tomato;
	float: right;
	margin-left: 10px;
}

.fileAdd_btn {
    color: white;
    background-color: tomato;
    border-color: rgba(247, 94, 94, 0 .8);
    display: inline-block;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	background-color: tomato;
	float: right;
	margin-left: 10px;
}

.form-control {
	border: hidden;
	margin-left: 20px;
	width: 88%;
}

.form-select {
	border: hidden;
	width: 280px;
	display: inline-block;
	margin-right: 40px;
	margin-left: 20px;
}
a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-wrap: wrap;
	width: 80%;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 15%;
}
</style>

</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "${contextPath}/notice/insertNotice.do");
			formObj.attr("method", "post");
			formObj.submit();
		});
		fn_addFile();
	})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	function fn_addFile() {
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn")
				.on(
						"click",
						function() {
							$("#fileIndex")
									.append(
											"<div><input type='file' style='float:left;' name='file_"
													+ (fileIndex++)
													+ "'>"
													+ "</button>"
													+ "<button type='button' style='float:right;' id='fileDelBtn'>"
													+ "삭제" + "</button></div>");
						});
		$(document).on("click", "#fileDelBtn", function() {
			$(this).parent().remove();

		});
	}
</script>
<body>
	<form name="writeForm" method="post" enctype="multipart/form-data"
		action="${contextPath}/notice/insertNotice.do">

		<div class="container">
			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/notice/listNotice.do">공지사항
							관리</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/notice/noticeForm.do">공지사항
							등록</a></li>
				</ul>
			</div>

			<table class="table_notice">
				<tr>
					<th>분류</th>

					<td><div class="selectBox" style="text-align: left;">
							<select id="notice_category" class="form-select"
								aria-label="Default select example" name="notice_category"
								oninvalid="this.setCustomValidity('분류를 선택해주세요')"
								oninput="this.setCustomValidity('')" required>
								<option value="">-- 분류 --</option>
								<option value="[일반]">[일반]</option>
								<option value="[안내]">[안내]</option>
								<option value="[모집]">[모집]</option>
								<option value="[추가모집]">[추가모집]</option>
								<option value="[공지]">[공지]</option>
								<option value="[채용예정자]">[채용예정자]</option>
							</select>
						</div></td>

				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" class="form-control"
						placeholder="제목을 입력하세요." name="notice_title" id="notice_title"
						oninvalid="this.setCustomValidity('제목을 입력해주세요')"
						oninput="this.setCustomValidity('')" required /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" class="form-control"
						placeholder="작성자를 입력하세요." name="notice_adminID"
						id="notice_adminID"
						oninvalid="this.setCustomValidity('작성자를 입력해주세요')"
						oninput="this.setCustomValidity('')" required
						value="${member.userId}" readonly /></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td id="fileIndex"></td>
			</table>

			<div class="inform" style="border-bottom: 1px solid #e0e0e0;">
				<div class="informTitle">
					<i class="fas fa-chevron-right" style="margin-right: 8px"></i>내용
				</div>
				<textarea class="informInputBox" placeholder="내용을 입력하세요."
					name="notice_contents" id="notice_contents"
					oninvalid="this.setCustomValidity('내용을 입력해주세요')"
					oninput="this.setCustomValidity('')" required></textarea>
			</div>
			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="fileAdd_btn" type="button">파일추가</button>
				<button class="btn button_bottom_C" type="button" onclick="history.back()">취소</button>
				<button class="btn button_bottom_I" type="submit">글쓰기</button>

			</div>
		</div>
	</form>
</body>
</html>
