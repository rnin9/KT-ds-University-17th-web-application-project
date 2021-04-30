<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta charset=UTF-8">
<title>게시판 수정</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style2.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
.container {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-wrap: wrap;
	width: 80%;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 15%;
}

button {
	float: right;
	margin-right: 10px;
}

.bg-primary {
	background-color: white !important;
}
</style>

</head>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");

		$(document).on("click", "#fileDel", function() {
			$(this).parent().remove();
		})

		fn_addFile();

		$("#cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "${contextPath}/notice/listNotice.do"
		})

		$("#update_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "${contextPath}/notice/updateNotice.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})

	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	function fn_addFile() {
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$("#fileAdd_btn")
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
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name) {

		fileNoArry.push(value);
		fileNameArry.push(name);
		$("#fileNoDel").attr("value", fileNoArry);
		$("#fileNameDel").attr("value", fileNameArry);
	}
</script>



<body>
	<form name="updateForm" role="form" method="post"
		enctype="multipart/form-data"
		action="${contextPath}/notice/updateNotice.do">
		<div class="container">

			<div class="pageIntro">공지사항</div>

			<input type="hidden" name="notice_no"
				value="${updateNotice.notice_no}"> <input type="hidden"
				id="fileNoDel" name="fileNoDel[]" value=""> <input
				type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
			<table class="table_">
				<tr>
					<th>강의분류</th>

					<td><div class="selectBox" style="text-align: left;">
							<select class="form-select" aria-label="Default select example"
								style="margin-right: 50px;" name="notice_category"
								oninvalid="this.setCustomValidity('분류를 선택해주세요')"
								oninput="this.setCustomValidity('')" required>
								<option value="[일반]"
									<c:if test="${updateNotice.notice_category eq '[일반]'}">selected</c:if>>[일반]</option>
								<option value="[안내]"
									<c:if test="${updateNotice.notice_category eq '[안내]'}">selected</c:if>>[안내]</option>
								<option value="[모집]"
									<c:if test="${updateNotice.notice_category eq '[모집]'}">selected</c:if>>[모집]</option>
								<option value="[추가모집]"
									<c:if test="${updateNotice.notice_category eq '[추가모집]'}">selected</c:if>>[추가모집]</option>
								<option value="[공지]"
									<c:if test="${updateNotice.notice_category eq '[공지]'}">selected</c:if>>[공지]</option>
								<option value="[채용예정자]"
									<c:if test="${updateNotice.notice_category eq '[채용예정자]'}">selected</c:if>>[채용예정자]</option>
							</select>
						</div></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" class="form-control"
						placeholder="제목을 입력하세요" name="notice_title"
						oninvalid="this.setCustomValidity('제목을 입력해주세요')"
						oninput="this.setCustomValidity('')" required
						value="${updateNotice.notice_title}"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" class="form-control"
						placeholder="작성자를 입력하세요" name="notice_adminID"
						oninvalid="this.setCustomValidity('작성자를 입력해주세요')"
						oninput="this.setCustomValidity('')" required
						value="${updateNotice.notice_adminID}" readonly></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td id="fileIndex"><c:forEach var="file" items="${file}"
							varStatus="var">

							<div>
								<input type="hidden" id="NT_FILE_NO"
									name="NT_FILE_NO_${var.index}" value="${file.NT_FILE_NO}">
								<input type="hidden" id="NT_FILE_NAME" name="NT_FILE_NAME"
									value="NT_FILE_NO_${var.index}"> <a href="#"
									id="fileName" onclick="return false;">${file.ORG_NT_FILE_NAME}</a>(${file.NT_FILE_SIZE}kb)
								<button id="fileDel"
									onclick="fn_del('${file.NT_FILE_NO}','NT_FILE_NO_${var.index}');"
									type="button">삭제</button>
								<br>
							</div>
						</c:forEach>
			</table>
			<div class="containerLower" style="margin-top: 30px;">
				<div class="inform">
					<div class="informTitle">
						<i class="fas fa-chevron-right" style="margin-right: 8px"></i>내용
					</div>
					<textarea class="informInputBox" placeholder="내용을 입력하세요."
						oninvalid="this.setCustomValidity('내용을 입력해주세요')"
						oninput="this.setCustomValidity('')" required
						name="notice_contents">${updateNotice.notice_contents}</textarea>
				</div>
			</div>

			<div style="margin-top: 50px;">
				<button class="btn btn-outline-danger" type="button"
					onclick="history.back()">취소</button>
				<button class="btn btn-outline-danger" id="update_btn" type="submit">수정</button>
				<button type="button" class="btn btn-outline-danger"
					id="fileAdd_btn">파일추가</button>
			</div>
		</div>
	</form>
</body>
</html>