<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<%
String resumeID = request.getParameter("resumeID");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 작성</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<scripts
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/resume.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}

h3 {
	text-align: left;
	margin-bottom: 30px;
}

.main { /* 이름 밑에 속성들을 감싸서 적용 */
	position: relative;
	text-align: left;
	border-bottom: 1px solid #eeeeee;
	padding-bottom: 30px;
	margin-bottom: 30px;
}

div.formtag { /* div 속 폼태그 전체 적용 */
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
	line-height: 15px;
}

h5 { /* main 밑 속성값들의 이름 */
	display: inline-block;
	margin: 35px 0px 0px 40px;
}

#test_cnt {
	display: inline-block;
}

#title_area {
	display: inline-block;
	position: relative;
	margin-left: 5px
}

.headbutton {
	display: inline-block;
	background-color: tomato;
	border: 1px solid tomato;
	border-radius: 5px;
	width: 223px;
	height: 60px;
	text-align: center;
	color: white;
	line-height: 60px;
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 15px;
	font-weight: bolder;
	margin-left: -5px;
}

.none {
	display: inline-block;
	background-color: white;
	color: black;
	line-height: 46px;
	margin-top: 43px;
}

textarea {
	resize: none;
	border: 1px solid #c8c8c0;
	padding: 10px 20px;
	margin-top: 30px;
	margin-left: 50px;
	min-height: 150px;
	line-height: 25px;
	width: 850px;
}

.div_line {
	border-bottom: 3px solid #EEEEEE;
	width: 90%;
	margin-left: 35px;
	margin-top: 30px;
}

.buttonGroups {
	width: 100%;
	margin-top: -20px;
}

.buttonGroups button {
	width: 90px;
	height: 35px;
	font-size: 1em;
	margin-bottom: 50px;
}

#btn1 {
	float: left;
}

#btn2 {
	float: right;
}
</style>

<script>
	function resize(obj) {
		obj.style.height = "5px";
		obj.style.height = (2 + obj.scrollHeight) + "px";
	}
</script> <script>
	$(document).ready(function() {

		$('.test').on('keyup', function(e) {
			var id = e.target.getAttribute('id');

			$(`.` + id).html("(" + $(this).val().length + " / 500)");

			if ($(this).val().length > 500) {
				$(this).val($(this).val().substring(0, 500));
				$(`.` + id).html("(500 / 500)");
			}

		});
	});
</script> <script>

		$(document).on('click','.move',function(e) {
		
					var data = {};

					data.userID ='<c:out value="${member.userId}"/>';
					data.resumeID =<%=resumeID%>;

					data.resumeContext1 = $("#test1").val();
					data.resumeContext2 = $("#test2").val();
					data.resumeContext3 = $("#test3").val();
					data.resumeContext4 = $("#test4").val();
					data.resumeContext5 = $("#test5").val();

					$.ajax({
						type : "POST",
						url : "${contextPath}/resume/page5Update.do",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify(data),
						success : function() {
						},
						error : function() {

						}
					});
				});
	</script> <script>
	$(document).on('click','#btn2',function(e){
		 Swal.fire({
  	        title:'저장',
  	        text:'이력서를 저장하시겠습니까?',
				icon:'warning',
  	        confirmButtonText: `저장`,
  	        showCancelButton: true,
  	        cancelButtonText: `취소`,
  	        }).then((res) =>{
  	        	if(res.isConfirmed){
  	        		Swal.fire({ icon: 'success', 
  	        			title: '이력서가 저장되었습니다.', 
  	        			showConfirmButton: false,
  	        			 timer: 1000
  	        			});
  	        		 setTimeout(function(){
  	        			window.location.href ="${contextPath}/resume/resumeList.do?resumeUser=${member.userId}";
  	        		    }, 1000);
  	        	}
  	        	else{
  	        		return;
  	        	}
  	        })
		
	});
</script>
</head>


<body>
	<div class="sub_visual"></div>

	<div class="container">

		

		<div id="title_area">
			<button id="first" class="btn headbutton move none"
				onClick="location.href='${contextPath}/resume/resumeBackPage1.do?userID=${member.userId}&resumeID=<%=resumeID%>'">기본정보</button>
			<button id="second" class="btn headbutton move none"
				onClick="location.href='${contextPath}/resume/resumeBackPage2.do?userID=${member.userId}&resumeID=<%=resumeID%>'">상세정보</button>
			<button id="third" class="btn headbutton move none"
				onClick="location.href='${contextPath}/resume/moveToPage3.do?userID=${member.userId}&resumeID=<%=resumeID%>'">경력사항
				/ 교육수료사항</button>
			<button id="forth" class="btn headbutton move none"
				onClick="location.href='${contextPath}/resume/moveToPage4.do?userID=${member.userId}&resumeID=<%=resumeID%>'">프로젝트
				관련사항</button>
			<div id="last" class="headbutton move">자기소개서</div>
		</div>
		<div class="pageIntro">
			<h3>자기소개서</h3>
		</div>


		<div class="main">
			<div>

				<h5>성장 과정</h5>
				<div id="test_cnt" class="test1">(0 / 500)</div>
			</div>
			<textarea id="test1" class="test" name="test" onkeyup="resize(this)"
				cols="70">${resumeVO.resumeContext1}</textarea>
			<div class="div_line"></div>
			<div>
				<h5>학교생활</h5>
				<div id="test_cnt" class="test2">(0 / 500)</div>
			</div>
			<textarea id="test2" class="test" name="test" onkeyup="resize(this)"
				cols="70">${resumeVO.resumeContext2}</textarea>
			<div class="div_line"></div>
			<div>
				<h5>성격(장/단점) 및 특기</h5>
				<div id="test_cnt" class="test3">(0 / 500)</div>
			</div>
			<textarea id="test3" class="test" name="test" onkeyup="resize(this)"
				cols="70">${resumeVO.resumeContext3}</textarea>
			<div class="div_line"></div>
			<div>
				<h5>희망업무 및 장래포부</h5>
				<div id="test_cnt" class="test4">(0 / 500)</div>
			</div>
			<textarea id="test4" class="test" name="test" onkeyup="resize(this)"
				cols="70">${resumeVO.resumeContext4}</textarea>
			<div class="div_line"></div>
			<div>
				<h5>기타사항</h5>
				<div id="test_cnt" class="test5">(0 / 500)</div>
			</div>
			<textarea id="test5" class="test" name="test" onkeyup="resize(this)"
				cols="70">${resumeVO.resumeContext5}</textarea>
		</div>


		<div class="buttonGroups">
			<button id="btn1" class="btn save move" type="button"
				onClick="location.href='${contextPath}/resume/moveToPage4.do?userID=${member.userId}&resumeID=<%=resumeID%>'">이전</button>
			<button id="btn2" class="btn save move" type="button">저장</button>
		</div>

	</div>
</body>

</html>
