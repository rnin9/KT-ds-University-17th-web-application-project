<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:choose>
<c:when test="${isLogOn == true  && member.userId == modQuestion.userId}">
<html>
	<head>
	 	<title>질문 게시판</title>
	 	<meta charset="utf-8">
    
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

    <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
     
	 	<style type="text/css">
        textarea {
            resize: none;
        }
        .sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/question.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 55%;
	background-size: cover;
	background-repeat: no-repeat;
	}
	.bg-primary {
   background-color: white !important;
 	}
 	form {
 	padding-top : 30px;
 	padding-left : 150px;
 	padding-right : 150px;
 	padding-bottom : 100px;
 	}
 	.mb-3 row {
 	padding-bottom : 15px;
 	}
 	
 	#Title{
 	padding-bottom : 10px;
 	}
 	button{
 	padding-top : 5px;
 	float:right;
	margin-right : 10px;
 	}
    </style>
	</head>
	<body>
	
		<div class="sub_visual">
		<span style="color: white;">1 : 1 문의</span>
	</div>
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="${contextPath}/question/userListQuestion.do?userId=${member.userId}">1 : 1 문의</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="${contextPath}/question/readQuestion.do?questionNum=${modQuestion.questionNum}">문의 열람</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on">문의 수정</li>
			</ul>
		</div>
		<br>
		<div class="shadow p-3 mb-5 bg-body rounded">
		<br> <p class="h2">문의 내용</p>
		<input type="hidden" id="questionNum" name="questionNum" value="${modQuestion.questionNum}" readonly/>
		<form role="form" method="post" action="${contextPath}/question/doModQuestion.do">
		<input type="hidden" id="questionNum" name="questionNum" value="${modQuestion.questionNum}" readonly/>
		<div class="mb-3 row">
            <label for="userId" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="userId" name="userId" value="${member.userId}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="questionRegDate" class="col-sm-2 col-form-label">등록일</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="questionRegDate" name="questionRegDate" value="${modQuestion.questionRegDate}"/>
            </div>
        </div>
        <div class="mb-3 row" id = "Title">
            <label for="questionTitle" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="questionTitle" name="questionTitle" placeholder="제목을 입력해주세요" value="${modQuestion.questionTitle}" required/>
            </div>
        </div>
        <div class="mb-3 row">
        <label for="questionType" class="col-sm-2 col-form-label">질문 분류</label>
        <div class="col-sm-10">
        <select class="form-select" id="select" id="questionType" name="questionType" aria-label="Default select example" required>
            <option value="">질문 분류</option>
            <option value="재직자 향상 과정" <c:if test="${modQuestion.questionType eq '재직자 향상 과정'}"> selected</c:if>>재직자 향상 과정</option>
            <option value="채용 예정자 과정" <c:if test="${modQuestion.questionType eq '채용 예정자 과정'}"> selected</c:if>>채용 예정자 과정</option>
            <option value="협약 관련" <c:if test="${modQuestion.questionType eq '협약 관련'}"> selected</c:if>>협약 관련</option>
            <option value="기타"<c:if test="${modQuestion.questionType eq '기타'}"> selected</c:if>>기타</option>
        </select>
        </div>
        </div>
        
        <div class="mb-3 row" id="questionContent">
            <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label">질문 내용</label>
            <div class="col-sm-10">
            <textarea class="form-control" id="questionContent" name="questionContent" rows="7" placeholder="질문 내용을 입력해주세요" required><c:out value="${modQuestion.questionContent}" /></textarea>
        </div>
        </div>
        <br>
        <br>
        <button type="submit" class="btn btn-outline-danger">수정 내용 등록</button>
        <button type="button" class="btn btn-outline-danger" onclick="history.back()">취소</button>
        
        
        </form>
        </div>
        </div>	
	</body>
</html>
</c:when>

<c:otherwise>
<html>

<head>

   <!-- HTML meta refresh URL redirection -->

   <meta http-equiv="refresh" content="2;url=${contextPath}/main.do">

</head>

 <body>

   <p>비정상적인 접근입니다. 메인으로 이동합니다.</p>

</body>

</html>
</c:otherwise>
</c:choose>







