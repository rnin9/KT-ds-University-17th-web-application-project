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
<title>강의계획서 수정</title>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
   crossorigin="anonymous">


<style>
.bg-primary {
   background-color: white !important;
}

.container {
   width: 74.64%;
   font-family: 'Noto Sans KR', sans-serif;
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
   width: 30%;
   height: 30px;
}

.table_syllabus td {
   border-top: 1px solid #e4e4e4;
   border-bottom: 1px solid #e4e4e4;
   text-align: center;
   font-size: 15px;
   height: 30px;
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

.form-control {
   border: hidden;
   width: 88%;
}

.form-select {
   border: hidden;
   width: 41%;
   display: inline-block;
   margin-right: 6%;
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
</style>

</head>

<script type="text/javascript">
   
   // 교육일수랑 교육시간에 숫자만 들어가게 하는 함수
   function onlyNumber(event){
       event = event || window.event;
       var keyID = (event.which) ? event.which : event.keyCode;
       if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
           return;
       else
           return false;
   }
 
   function removeChar(event) {
      event = event || window.event;
      var keyID = (event.which) ? event.which : event.keyCode;
      if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
         return;
      else
         event.target.value = event.target.value.replace(/[^0-9]/g, "");
   }
   
   
</script>
<body>
   <form method="post" action="${contextPath}/syllabus/modifySyllabus.do">
      <div class="container">
         <div class="lnb">
            <ul>
               <li><a href="/springEx/main.do">홈</a></li>
               <li style="color: grey; font-weight: bold;">〉</li>
               <li class="on"><a href="/springEx/syllabus/syllabusList.do">강의계획서 관리</a></li>
               <li style="color: grey; font-weight: bold;">〉</li>
               <li class="on"><a href="/springEx/syllabus/syllabusModifyForm.do?syllabusID=${syllabusVO.syllabusID}">강의계획서 수정</a></li>
            </ul>
         </div>
         <input type="hidden" name="syllabusID" value="${syllabusVO.syllabusID}">
         <table class="table_syllabus">
            <tr>
               <th>강의분류</th>

               <td><div class="selectBox" style="text-align: left;">
                     <select class="form-select" aria-label="Default select example"
                        style="margin-right: 50px;" name="syllabusCategory1">
                        <option value="유료과정" <c:if test="${syllabusVO.syllabusCategory1 eq '유료과정'}">selected</c:if>>유료과정</option>
                        <option value="재직자향상" <c:if test="${syllabusVO.syllabusCategory1 eq '재직자향상'}">selected</c:if>>재직자향상</option>
                        <option value="채용예정자과정" <c:if test="${syllabusVO.syllabusCategory1 eq '채용예정자과정'}">selected</c:if>>채용예정자과정</option>
                     </select> 
                     <select class="form-select" aria-label="Default select example" name="syllabusCategory2">
                        <option value="OS 분야" <c:if test="${syllabusVO.syllabusCategory2 eq 'OS 분야'}">selected</c:if>>OS 분야</option>
                        <option value="IoTchr(38)모바일" <c:if test="${syllabusVO.syllabusCategory2 eq 'IoT&모바일'}">selected</c:if>>IoT&모바일</option>
                        <option value="SW공학" <c:if test="${syllabusVO.syllabusCategory2 eq 'SW공학'}">selected</c:if>>SW공학</option>
                        <option value="클라우드" <c:if test="${syllabusVO.syllabusCategory2 eq '클라우드'}">selected</c:if>>클라우드</option>
                        <option value="웹 프로그래밍" <c:if test="${syllabusVO.syllabusCategory2 eq '웹 프로그래밍'}">selected</c:if>>웹 프로그래밍</option>
                        <option value="빅데이터" <c:if test="${syllabusVO.syllabusCategory2 eq '빅데이터'}">selected</c:if>>빅데이터</option>
                        <option value="non-IT" <c:if test="${syllabusVO.syllabusCategory2 eq 'non-IT'}">selected</c:if>>non-IT</option>
                        <option value="OA" <c:if test="${syllabusVO.syllabusCategory2 eq 'OA'}">selected</c:if>>OA</option>
                        <option value="분석/설계" <c:if test="${syllabusVO.syllabusCategory2 eq '분석/설계'}">selected</c:if>>분석/설계</option>
                        <option value="프로젝트관리" <c:if test="${syllabusVO.syllabusCategory2 eq '프로젝트관리'}">selected</c:if>>프로젝트관리</option>
                        <option value="오픈소스" <c:if test="${syllabusVO.syllabusCategory2 eq '오픈소스'}">selected</c:if>>오픈소스</option>
                        <option value="모바일" <c:if test="${syllabusVO.syllabusCategory2 eq '모바일'}">selected</c:if>>모바일</option>
                        <option value="보안" <c:if test="${syllabusVO.syllabusCategory2 eq '보안'}">selected</c:if>>보안</option>
                        <option value="네트워크" <c:if test="${syllabusVO.syllabusCategory2 eq '네트워크'}">selected</c:if>>네트워크</option>
                        <option value="프로그래밍" <c:if test="${syllabusVO.syllabusCategory2 eq '프로그래밍'}">selected</c:if>>프로그래밍</option>
                        <option value="데이터베이스" <c:if test="${syllabusVO.syllabusCategory2 eq '데이터베이스'}">selected</c:if>>데이터베이스</option>
                     </select>
                  </div></td>

            </tr>
            <tr>
               <th>강의명</th>
               <td><input type="text" class="form-control"
                  placeholder="강좌명을 입력하세요." name="syllabusName" value="${syllabusVO.syllabusName}"></td>
            </tr>
            <tr>
               <th>보고용강의명</th>
               <td><input type="text" class="form-control"
                  placeholder="보고용 강좌명을 입력하세요." name="syllabusReportName" value="${syllabusVO.syllabusReportName}"></td>
            </tr>
            <tr>
               <th>교육일수</th>
               <td><input type="text" class="form-control"
                  onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
                  placeholder="교육일수(숫자)를 입력하세요." name="syllabusTotalDays" value="${syllabusVO.syllabusTotalDays}"></td>
            </tr>
            <tr>
               <th>교육시간</th>
               <td><input type="text" class="form-control"
                  onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
                  placeholder="교육시간(숫자)를 입력하세요." name="syllabusTotalTime" value="${syllabusVO.syllabusTotalTime}"></td>
            </tr>
         </table>

         <div class="containerLower" style="margin-top: 30px;">
            <div class="inform">
               <div class="informTitle">
                  <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습개요
               </div>
               <textarea class="informInputBox" placeholder="학습개요를 입력하세요." name="syllabusOutline">${syllabusVO.syllabusOutline}</textarea>
            </div>
            <div class="inform">
               <div class="informTitle">
                  <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습목표
               </div>
               <textarea class="informInputBox" placeholder="학습목표를 입력하세요." name="syllabusPurpose">${syllabusVO.syllabusPurpose}</textarea>
            </div>
            <div class="inform">
               <div class="informTitle">
                  <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습대상
               </div>
               <textarea class="informInputBox" placeholder="학습대상을 입력하세요." name="syllabusTarget">${syllabusVO.syllabusTarget}</textarea>
            </div>
            <div class="inform" style="border-bottom: 1px solid #e0e0e0;">
               <div class="informTitle">
                  <i class="fas fa-chevron-right" style="margin-right: 8px"></i>학습내용
               </div>
               <textarea class="informInputBox" placeholder="학습내용을 입력하세요." name="syllabusContent">${syllabusVO.syllabusContent}</textarea>
            </div>
         </div>
         <div style="margin-top: 50px; padding-bottom: 150px;">
            <button class="btn button_bottom" type="button" onclick="history.back()">취소</button>
            <button class="btn button_bottom" type="submit">수정</button>
         </div>

      </div>
   </form>
</body>
</html>