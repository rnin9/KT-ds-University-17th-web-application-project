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
<title>강의계획서 관리</title>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
   crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

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

a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
}

.bg-primary {
   background-color: white !important;
}

.container {
   width: 74.64%;
   font-family: 'Noto Sans KR', sans-serif;
}


.resumeList {
   border-collapse: collapse;
   font-size: 14px;
   line-height: 2.2;
   margin-top: 40px;
   text-align: center;
   /* color: #555; */
   width: 100%;
   line-height: 40px;
}




#item {
	border-color: grey;
	border-radius: .25rem;
	border-size: 1px;
}

#btn {
	margin-left : -20px;
}

</style>
<script src="https://unpkg.com/sweetalert/dist/sweeta;ert.min.js">></script>
    
  <script type="text/javascript">
               var result = '${msg}';
               var name = '${resumeName}'
               
               if (result == 'modSuccess') {
            	   window.onload=function() {
                	   swal("수정 완료",(name + " 이력서 수정 완료"),"success")
                	   
            	   }
               }else if (result == 'removeSuccess'){
            	   window.onload=function() {
            		   swal("삭제 완료",(name + " 이력서 삭제 완료"),"success");
            	   }
               }else if (result == 'addSuccess'){
            	   window.onload=function() {
            		   swal("등록 완료",(name + " 이력서 등록 완료"),"success");
            	   }
               }
  </script>
</head>



<body>
	<div class="sub_visual">
		<span style="color: white;">이력서</span>
	</div>

   <div class="container">
      <form method="post" action="${contextPath}/resume/resumeWrite.do">

         <div class="lnb">
            <ul>
               <li><a href="${contextPath}/main.do">홈</a></li>
               <li style="color: grey; font-weight: bold;">〉</li>
               <li class="on"><a href="${contextPath}/resume/resumeList.do?resumeUser=${member.userId}">이력서
                     관리</a></li>
            </ul>
         </div>
 
 
         <table class="resumeList">

            <tbody id="ajaxTable">
               <c:forEach var="resumeAdmin" items="${resumeAdmin}">
                  <tr id="item">
                  	 <td>${resumeAdmin.resumeCheck}</td>     
                     <td class="name"><a
                        href="${contextPath}/resume/resumeInfo.do?resumeID=${resumeAdmin.resumeID}&resumeUser=${resumeAdmin.resumeUser}">${resumeAdmin.resumeDate}</a></td>
                     <td><button id="btn" class="btn button_bottom" type="button">수정</button></td>
                     <td><button id="btn" class="btn button_bottom" type="button"
                     onClick="location.href='${contextPath}/resume/deleteResume.do?resumeID=${resumeAdmin.resumeID}'">삭제</button></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>

         <div style="margin-top: 50px; padding-bottom: 150px;">
            <button class="btn button_bottom" type="button">이력서 작성</button>
            
         </div>

      </form>
   </div>
</body>
</html>