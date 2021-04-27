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
<script type="text/javascript">
     function onLoginClicked(){ 				/* 로그인 operation Sweet alert 사용 */
    	 Swal.fire({
    		  html: `<img
    				src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
    				alt="로고" style="width:200px; height:60px;"/><input type="text" id="login" class="swal2-input" placeholder="Username">
    		  <input type="password" id="password" class="swal2-input" placeholder="Password">`,
    		  confirmButtonText: 'Sign in',
    		  showCancelButton: true,
    		  showCloseButton: true,
    		  focusConfirm: false,
    		  preConfirm: () => {			// 로그인 process 이전 체크 
    		    const login = Swal.getPopup().querySelector('#login').value
    		    const password = Swal.getPopup().querySelector('#password').value
    		    if (!login || !password) {
    		      Swal.showValidationMessage(`Please enter login and password`)	// id & pw가 없는 경우
    		    }
    		     else{
    
    		   return $.ajax({				// 비동기통신, ID와 비밀번호가 있는지 확인함, 결과는 json으로 반환
		            method: "POST",
		            url: "${contextPath}/member/login.do",
		            data: {
		                userId: login,
		                userPassword: password
		            },
		            success: (resp) => {	// 모든 결과를 success로 받음
		            	if (resp.result == true) {
		                 const logOn = true;
		                 return resp.result;	// 결과 반환
		                } 
		            	else {
		                	const logOn = false;
			                Swal.showValidationMessage(`Check Your ID & Password or E-Mail Check!`) // 정보가 없는경우, Error       	
		            }},
		            error: (data) => {
		                console.log("로그인 실패");
		     	}
		        })}
    		  }
    		}).then((result) => {
    			if(result.isConfirmed){			// 확인된 경우, 로그인
    				   Swal.fire({    					   
	                      	title: "환영합니다! " + result.value.member.userName + " 님!",
	                        icon: "success"
	                    })
 
                		 setTimeout(() => window.location.reload(), 1000); // 페이지 새로고침
    		 	}
    		}) 
     }
</script>
<script type="text/javascript">
	function apply(){
		console.log(${courseVO.dday});
		if (${courseVO.dday >= 0}){		
			if (${isLogOn == true}){
				var valueArr = new Array();
				valueArr.push(${courseVO.courseID});
				valueArr.push("${member.userId}");
				$.ajax({
					url : "/springEx/course/insertCourseTable.do",
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(data){
						Swal.fire('신청이 완료되었습니다.','','success')
						/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
					},
					error : function(data) { 
			            Swal.fire('이미 신청한 강의입니다.','','warning');
			        }
				});
				$.ajax({
					url : "/springEx/course/updateCoursePeopleApplied.do",
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(data){
						console.log("success");
						/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
					},
					error : function(data) { 
			            console.log("fail");
			        }
				});
			}
			else{
				Swal.fire('로그인 후 이용해주세요.','','warning')
				.then(()=>{
					onLoginClicked();
				});
			}
		}else{
			Swal.fire('접수가 마감된 과정입니다.','','error')
		}
	};
</script>
</head>

<body>
<form method="post" action="${contextPath}/course/updateCoursePeopleAppliedInsertCourseTable.do">
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
     		 <button class="btn button_bottom" type="button"
               onClick="location.href='/springEx/course/userCourseList.do'">목록</button>
            <button class="btn button_bottom" type="button" onClick="apply();">신청</button>
      </div>
   </div>
   </form>
</body>
</html>