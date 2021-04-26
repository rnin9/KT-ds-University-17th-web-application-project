<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset=UTF-8">
<title>강의계획서 정보</title>

<!-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" /> -->

<style>
a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
}

.bg-primary {
   background-color: white !important;
}

.container {
   width: 80%;
   font-family: 'Noto Sans KR', sans-serif;
}
 
.btn {
   color: white;
   display: inline-block;
   font-weight: 400;
   text-align: center;
   vertical-align: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
   background-color: tomato;
   border-color: rgba(247, 94, 94, 0 .8);
   padding: .375rem .75rem;
   font-size: 1rem;
   line-height: 1.5;
   border-radius: .25rem;
   transition: color .15s ease-in-out, background-color .15s ease-in-out,
      border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.button_bottom {
   background-color: tomato;
   float: right;
   margin-left: 10px;
}

.table_syllabus {
   margin-top: 30px;
   border-collapse: collapse;
   text-align: center;
   /* color: #555; */
   width: 100%;
   line-height: 40px;
   
}

.table_syllabus th {
   border-top: 1px solid #e4e4e4;
   border-bottom: 1px solid #e4e4e4;
   background-color: #f8f8f8;
   text-align: center;
   font-size: 15px;
   width:30%;
}

.table_syllabus td {
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
</style>

</head>
<script>

function deleteCourse(){
	/*location.href='${contextPath}/course/deleteCourse.do?courseID=${courseVO.courseID}'*/

	var courseID = ${courseVO.courseID};
	url="/springEx/course/deleteCourse.do";
	$.ajax({
		url : url,
		type : 'POST',
		data : {
			courseID : courseID
		},
		success : function(data){
			console.log("success");
			location.href='${contextPath}/course/courseList.do';
			/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
		},
		error : function(data) {
			Swal.fire("과정을 신청한 사용자가 있습니다.","","error");
			console.log("fail");
	    }
	})
	/*if (${isLogOn == true}){
		location.href='${contextPath}/course/deleteCourse.do?courseID=${courseVO.courseID}'
	}
	else{
		alert("로그인 후 시도해주세요.");
	}*/
}
</script>
<script>
function modifyCourse(){
	location.href='${contextPath}/course/courseModifyForm.do?courseID=${courseVO.courseID}'
	/*if (${isLogOn == true}){
		location.href='${contextPath}/course/courseModifyForm.do?courseID=${courseVO.courseID}'
	}
	else{
		alert("로그인 후 시도해주세요.");
	}*/
}
</script>
<body>
   <div class="container">
      <div class="lnb">
         <ul>
            <li><a href="/springEx/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a href="/springEx/course/courseList.do">과정 관리</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a href="/springEx/course/selectCourse.do?courseID=${courseVO.courseID}">과정 정보</a></li>
         </ul>
      </div>

      <table class="table_syllabus">
         <tr>
            <th>과정명</th>
            <td>[${courseVO.syllabusVO.syllabusCategory1} > ${courseVO.syllabusVO.syllabusCategory2}] ${courseVO.syllabusVO.syllabusName}</td>
            <th>강의실</th>
            <td>${courseVO.courseRoomNumber}호</td>
         </tr>
         <tr>
            <th>교육기간</th>
            <td>${courseVO.courseStart}~${courseVO.courseEnd}</td>
            <th>신청기간</th>
            <td>${courseVO.courseApplyStart}~${courseVO.courseApplyEnd}</td>
         </tr>
         <tr>
            <th>교육시간</th>
            <td>${courseVO.courseTime}</td>
            <th>교육비</th>
            <td>${courseVO.courseFee}</td>
         </tr>
      </table>

      <div class="containerLower" style=" margin-top:30px;">
         <div class="inform">
            <div class="informTitle">
               <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습개요
            </div>
            <div class="informBox">
               ${courseVO.syllabusVO.syllabusOutline}
            </div>
         </div>
         <div class="inform">
            <div class="informTitle">
               <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습목표
            </div>
            <div class="informBox">
               ${courseVO.syllabusVO.syllabusPurpose}
            </div>
         </div>
         <div class="inform">
            <div class="informTitle">
               <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습대상
            </div>
            <div class="informBox">
               ${courseVO.syllabusVO.syllabusTarget}
            </div>
         </div>
         <div class="inform" style="border-bottom: 1px solid #e0e0e0;">
            <div class="informTitle">
               <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습내용
            </div>
            <div class="informBox">
               ${courseVO.syllabusVO.syllabusContent}
            </div>
         </div>
      </div>
      <div style="margin-top: 50px; padding-bottom: 150px;">
         <button class="btn button_bottom" type="button" onClick="deleteCourse()">삭제</button>
         <button class="btn button_bottom" type="button" onClick="modifyCourse()">수정</button>
      </div>

   </div>
</body>
</html>