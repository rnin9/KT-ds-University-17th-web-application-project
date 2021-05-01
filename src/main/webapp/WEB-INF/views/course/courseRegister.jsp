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
<title>과정 등록</title>


<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style2.css" />

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
   crossorigin="anonymous">


<script
   src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<link id="bsdp-css"
   href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
   rel="stylesheet">
<script
   src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
   
<style>
a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
}

.container {
   font-family: 'Noto Sans KR', sans-serif;
   margin-left: 15%;
   position: relative;
}

button {
   float: right;
   margin-right: 10px;
}

.table_ th {
   width: 20%;
}
.table_ td {
   width: 30%;
}

</style>

</head>

<script type="text/javascript">
   //교육일수랑 교육시간에 숫자만 들어가게 하는 함수
   function onlyNumber(event) {
      event = event || window.event;
      var keyID = (event.which) ? event.which : event.keyCode;
      if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
            || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
         return;
      else
         return false;
   }

   function removeChar(event) {
      event = event || window.event;
      var keyID = (event.which) ? event.which : event.keyCode;
      if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
         return;
      else
         event.target.value = event.target.value.replace(/[^0-9]/g, "");
   }
</script>
<script type="text/javascript">
   //달력picker, 키보드로도 입력가능[ex)2021/4], format: "mm/yyyy" 등 으로 변경가능 
   $(document).ready(function() {
      $('#sandbox-container input').datepicker({
         format: "yyyy-mm-dd",
            language: "ko",
            startView: 1,
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            todayHighlight : true
      });
   });
</script>
<script>
   function showPopup() { 
     window.open("${contextPath}/course/syllabusList.do", "강의계획서 리스트", "width=1000, height=600, left=100, top=50"); 
   }
</script>

<body>
   <form method="post" action="${contextPath}/course/insertCourse.do">

      <div class="container">
       
			<div class="pageIntro">과정등록</div>


         <table class="table_" style="margin-top:100px;">
            <tr>
               <th>강의명</th>
               <td>
                  <input type="text" class="form-control" placeholder="검색" id="hiddenThanksTogangsanim" onclick="showPopup();"> 
                  <input type="text" class="form-control" id="syllabusID" name="syllabusID"
                  style="display: none;"></td>
               <th></th>
               <th></th>
            </tr>
            <tr>
               <th>강의시간</th>
               <td><div class="selectBox" style="text-align: left;">
                     <select class="form-select" aria-label="Default select example"
                        name="courseTime">
                        <option selected>-- 강의시간을 선택하세요 --</option>
                        <option value="09:00~18:00">09:00~18:00</option>
                        <option value="19:00~22:00">19:00~22:00</option>
                     </select>
                  </div></td>
               <th>교육비</th>
               <td><input type="text" class="form-control" value="무료"
                  placeholder="무료" name="courseFee"></td>
            </tr>
            <tr>
               <th>수강신청일</th>
               <td id="sandbox-container"><input type="text"
                  class="form-control" placeholder="연/월을 선택해주세요."
                  name="courseApplyStart"> <input type="text"
                  class="form-control" placeholder="연/월을 선택해주세요."
                  name="courseApplyEnd"></td>

               <th>교육기간</th>
               <td id="sandbox-container"><input type="text"
                  class="form-control" placeholder="연/월을 선택해주세요." name="courseStart">
                  <input type="text" class="form-control" placeholder="연/월을 선택해주세요."
                  name="courseEnd"></td>
            </tr>
            <tr>
               <th>강의실정보</th>
               <td><input type="text" class="form-control"
                  onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
                  placeholder="강의실(숫자)을 입력하세요." name="courseRoomNumber"></td>
               <th>수강인원수</th>
               <td><input type="text" class="form-control"
                  onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
                  placeholder="수강인원수(숫자)를 입력하세요." name="coursePeopleMax"></td>
            </tr>
         </table>

         <div style="margin-top: 50px; padding-bottom: 100px;">
            <button class="btn btn-outline-danger" type="button"
               onclick="history.back()">취소</button>
            <button class="btn btn-outline-danger" type="submit">등록</button>
         </div>

      </div>
   </form>
</body>
</html>