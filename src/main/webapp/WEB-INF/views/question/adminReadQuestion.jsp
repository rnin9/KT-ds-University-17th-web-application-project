<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:choose>
<c:when test="${isLogOn == true  && member.userPosition == 'ADMIN'}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
 

<!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">	
	<style>
	button{
	float:right;
	margin-right : 10px;
	}
	form {
 	padding-top : 30px;
 	padding-left : 100px;
 	padding-right : 100px;
 	padding-bottom : 100px;
 	}
 	#question{
 	padding-top : 30px;
 	padding-left : 100px;
 	padding-right : 100px;
 	padding-bottom : 100px;
 	}
 	text {
 	line-height : 1.6;
 	}
	</style>
	


	<script type="text/javascript">

var questionNum = '<c:out value="${readQuestion.questionNum}"/>';

function deleteQuestion(){
	Swal.fire({
	  title: '글을 삭제하시겠습니까?',
	  text: "삭제하시면 다시 복구시킬 수 없습니다.",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '삭제',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		  location.href= "${contextPath}"+ '/question/deleteQuestion.do?questionNum='+questionNum;
	  }
	})
}


</script>

</head>
<body>

	
	<div class="container">
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="${contextPath}/question/listQuestion.do">1
						: 1 문의</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on">문의 열람</li>

			</ul>
		</div>
		
		<br>
                
                <div class="shadow p-3 mb-5 bg-body rounded">
        <br> <p class="h2">문의 내용</p> 
        <div id="question">
        	<button type="button" class="btn btn-outline-danger" onclick="deleteQuestion();">삭제</button>
			<button type="button" class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/adminDeleteQuestion.do?questionNum=${readQuestion.questionNum}'">비공개</button>
			<button type="button" class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/adminShowQuestion.do?questionNum=${readQuestion.questionNum}'">공개</button>
			<button type="button" class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/listQuestion.do'">목록</button>
						<br>
						<br>
        
		<div class="mb-3 row">
            <label for="userId" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="userId" name="userId" value="${readQuestion.userId}">
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="questionRegDate" class="col-sm-2 col-form-label">등록일</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="questionRegDate" name="questionRegDate" value="${readQuestion.questionRegDate}" readonly>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="question_del_YN" class="col-sm-2 col-form-label">유저 공개 여부</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="question_del_YN" name="question_del_YN" value="<c:if test="${readQuestion.question_del_YN == 'Y'}">비공개</c:if><c:if test="${readQuestion.question_del_YN == 'N'}">공개</c:if>" readonly>
            </div>
        </div>
        
        <div class="mb-3 row" id = "Title">
            <label for="questionTitle" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
                <input type="text"readonly class="form-control-plaintext" id="questionTitle" name="questionTitle" placeholder="제목을 입력해주세요" value="${readQuestion.questionTitle}" readonly />
            </div>
        </div>
        
        <div class="mb-3 row">
        <label for="questionType" class="col-sm-2 col-form-label">질문 분류</label>
        <div class="col-sm-10">
        <select class="form-select" id="select" id="questionType" name="questionType"  aria-label="Default select example" disabled>
            <option value="">질문 분류</option>
            <option value="재직자 향상 과정" <c:if test="${readQuestion.questionType eq '재직자 향상 과정'}"> selected</c:if>>재직자 향상 과정</option>
            <option value="채용 예정자 과정" <c:if test="${readQuestion.questionType eq '채용 예정자 과정'}"> selected</c:if>>채용 예정자 과정</option>
            <option value="협약 관련" <c:if test="${readQuestion.questionType eq '협약 관련'}"> selected</c:if>>협약 관련</option>
            <option value="기타"<c:if test="${readQuestion.questionType eq '기타'}"> selected</c:if>>기타</option>
        </select>
        </div>
        </div>
        
        <div class="mb-3 row" id="questionContent">
            <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label">질문 내용</label>
        <div class="col-sm-10">   
            <textarea class="form-control-plaintext" id="questionContent" name="questionContent" required placeholder="질문 내용을 입력해주세요" readonly><c:out value="${readQuestion.questionContent}" /></textarea>
       <script>
    var txtArea = $(".form-control-plaintext");
    if (txtArea) {
        txtArea.each(function(){
            $(this).height(this.scrollHeight);
        });
    }
</script>
          


        </div>
        </div>
        
		</div>
		
		</div> 				
					

					
				
					<input type="hidden" id="questionNum" name="questionNum" value="${readQuestion.questionNum}" readonly/>
					<input type="hidden" id="userId" name="userId" value="${readQuestion.userId}" readonly/>
			
		
		<div class="shadow p-3 mb-5 bg-body rounded">
  
			<br><p class="h2">관리자 답변</p><br>
			
        				
			<form role="form" name="addComment" id="addComment" method="post" action="${contextPath}/question/addComment.do">
						<input type="hidden" name="questionNum" id="questionNum" value="${readQuestion.questionNum}" readonly/>
						<div class="mb-3 row" id = "questionCommentRegDate">
            			<label for="questionCommentRegDate" class="col-sm-2 col-form-label">답변 완료일</label>
            			<div class="col-sm-10">
                		<input type="text" class="form-control-plaintext" disabled id="questionCommentRegDate" name="questionCommentRegDate" value="<c:choose><c:when test="${readQuestion.questionCommentRegDate == null}">답변 미등록</c:when><c:when test="${readQuestion.questionCommentRegDate != null}"><c:out value="${readQuestion.questionCommentRegDate}"/></c:when></c:choose>" readonly/>
            			</div>
        				</div>
						<div class="mb-3 row" id ="questionCommentTitle">
            			<label for="questionCommentTitle" class="col-sm-2 col-form-label">답변 제목</label>
            			<div class="col-sm-10">
                		<input type="text" class="form-control" id="questionCommentTitle" name="questionCommentTitle" placeholder="답변 제목을 입력해주세요" value="${readQuestion.questionCommentTitle}" required/>
            			</div>
        				</div>
						
						<div class="mb-3 row" id="questionCommentContent">
            			<label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label">답변 내용</label>
            			<div class="col-sm-10">
            			<textarea class="form-control" id="questionCommentContent" name="questionCommentContent" rows="9" required placeholder="답변 내용을 입력해주세요" required><c:out value="${readQuestion.questionCommentContent}" /></textarea>
        				</div>
						</div>
						
					<!---->
        				<button type="button" class="btn btn-outline-danger" onclick="deleteQuestion();">삭제</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/adminDeleteQuestion.do?questionNum=${readQuestion.questionNum}'">비공개</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/adminShowQuestion.do?questionNum=${readQuestion.questionNum}'">공개</button>
						<button type="button" class="btn btn-outline-danger" onclick="location.href='${contextPath}/question/listQuestion.do'">목록</button>
        				<button type="submit" class="btn btn-outline-danger">답변 입력</button>
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