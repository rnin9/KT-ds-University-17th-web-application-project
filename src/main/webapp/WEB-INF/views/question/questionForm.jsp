<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:choose>
<c:when test="${isLogOn == true }">
<html>
	

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    
	
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

    <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <title>질문 입력창</title>
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
 	#questionContent {
 	padding-top : 10px;
 	padiing-bottom : 20px;
 	text-align : left;
 	}
 	#Title{
 	padding-bottom : 10px;
 	}
 	button{
 	padding-top : 10px;
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
				<li class="on"><a href="/springEx/question/listQuestion.do">1
						: 1 문의</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on">문의 등록</li>

			</ul>
		</div>
    <form role="form" method="post" action="${contextPath}/question/insertQuestion.do">
        <div class="mb-3 row">
            <label for="userId" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="userId" name="userId" value="${member.userId}">
            </div>
        </div>
        <div class="mb-3 row" id = "Title">
            <label for="questionTitle" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="questionTitle" name="questionTitle" placeholder="제목을 입력해주세요" required />
            </div>
        </div>
        
        <select class="form-select" id="select" id="questionType" name="questionType" aria-label="Default select example" required>
            <option value="">질문 분류</option>
            <option value="재직자 향상 과정">재직자 향상 과정</option>
            <option value="채용 예정자 과정">채용 예정자 과정</option>
            <option value="협약 관련">협약 관련</option>
            <option value="기타">기타</option>
        </select>
        
        <div class="mb-3" id="questionContent">
            <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label">질문 내용</label>
            <textarea class="form-control" id="questionContent" name="questionContent" rows="7" required placeholder="질문 내용을 입력해주세요"></textarea>
        </div>
        <button type="submit" class="btn btn-outline-danger">질문 등록</button>
        <button type="button" class="btn btn-outline-danger" onclick="history.back()">취소</button>
    </form>


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
