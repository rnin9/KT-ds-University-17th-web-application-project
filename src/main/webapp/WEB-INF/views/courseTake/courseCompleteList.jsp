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
<title>수강관리</title>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style.css" />

<style>
.card {
   width: 300px;
   height: 200px;
   margin: 2% 2% 2% 2%;
}

.btn {
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
   transition: color .15s ease-in-out, background-color .15s ease-in-out,
      border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}


</style>

</head>
<script>
function deleteCheck(){
   console.log(${courseList});
   console.log(123);
};
</script>

<body>

   <div class="container">
      <!-- 홈>강의관리>수강관리 -->
      <div class="lnb">
         <ul>
            <li><a href="/springEx/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a
               href="/springEx/course/userCourseList.do">과정신청</a></li>
         </ul>
      </div>
   <div style="width: 80%; display: flex; flex-direction: row;"> 
    <c:forEach var="courseVO" items="${courseUserList}">
         <div class="card" style="display:inline-block">
            <div class="card-body">
               <h5 class="card-title"
                  style="text-align: left; border: 0.5px solid grey; width: 50%; margin: 1% 1% 1% 1%;">${courseVO.syllabusVO.syllabusCategory1}</h5>
               <p class="card-text">[맞춤형 클래스] MongoDB 이해와 활용</p>
               <p>2021.04.26~2021.04.30</p>
               <a href="#" class="btn" style="" onClick="deleteCheck()">상세보기</a>
            </div>
         </div>
      </c:forEach>
     </div>
    </div>
</body>

</html>