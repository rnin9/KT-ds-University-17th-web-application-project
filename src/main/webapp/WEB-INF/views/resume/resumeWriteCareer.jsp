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

<scripts
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style.css" />
<link id="bsdp-css"
   href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
   rel="stylesheet">
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
   margin-bottom: 50px;
}

.main { /* 이름 밑에 속성들을 감싸서 적용 */
   height: auto;
   position: relative;
   text-align: left;
   border-bottom: 1px solid #eeeeee;
   padding-bottom: 40px;
   margin-bottom: 40px;
}

div.formtag { /* div 속 폼태그 전체 적용 */
   border-radius: 5px;
   background-color: #f2f2f2;
   padding: 40px;
   line-height: 15px;
}

.title { /* main 밑 속성값들의 이름 */
   margin: 40px 0px 0px 40px;
   display: inline-block;
   width: 100px;
   position: relative;
}

#title_area {
   display: inline-block;
   position: relative;
   margin-left: 5px
}

.headbutton {
   display: inline-block;
   background-color: #dc3545;
   border: 1px solid #dc3545;
   border-radius: 5px;
   width: 221px;
   height: 60px;
   text-align: center;
   color: white;
   line-height: 60px;
   margin-top: 50px;
   margin-bottom: 50px;
   font-size: 15px;
   font-weight: bolder;
   margin-left: -1px;
   float: left;
}

.none {
   background-color: white;
   color: black;
   line-height: 46px;
   margin-top: 50px;
}

div input[type="text"] { /* input type text 태그 지정*/
   width: 210px;
   padding: 10px 20px;
   display: inline-block;
   border: 1px solid #c8c8c0;
   box-sizing: border-box;
   margin-right: 10px;
   line-height: 15px;
}

.short::placeholder {
   font-size: 13px;
}

div select {
   width: 120px;
   padding: 10px 20px;
   display: inline-block;
   border: 1px solid #c8c8c0;
   box-sizing: border-box;
   margin-right: 10px;
   line-height: 15px;
}

#careertype {
   position: absolute;
   margin-left: -73px;
}

.fieldset {
   display: none;
   height: auto;
   position: relative;
   margin-top: 30px;
   margin-bottom: 50px;
}

.date {
   display: inline-block;
}

.short {
   width: 120px !important;
}

.ldate {
   margin-left: 10px;
}

#edu_time {
   width: 100px;
}

#edu_othertype {
   margin-left: -50px;
}

#car_add {
   float: right;
   position: absolute;
   right: 28px;
}

#edu_add {
   float: right;
   position: absolute;
   right: 28px;
}

#del_button {
   position: absolute;
   right: 90px;
}

.buttonGroups {
   width: 100%;
   margin-top: -10px;
}

.buttonGroups button {
   width: 90px;
   height: 35px;
   font-size: 15px;
   font-weight: bolder;
   margin-bottom: 50px;
}

#btn1 {
   float: left;
   margin-left: 0px;
}

#btn2 {
   float: right;
}

.div_line {
   border-bottom: 3px solid #EEEEEE;
   position: relative;
   width: 82%;
   margin-left: 30px;
   margin-top: -160px;
   margin-bottom: 10px;
}

.line1 {
   border-bottom: 3px solid #EEEEEE;
   position: relative;
   width: 82%;
   margin-left: 30px;
   margin-top: 30px;
   margin-bottom: 10px;
}

.container {
   width: 100%;
}
</style>

<!-- 날짜 관리 스크립트--> <script>
   $(document).ready(function() {
      $('.date input[type="text"]').datepicker({
         format : "yyyymmdd",
         language : "ko",
         startView : 2,
         keyboardNavigation : false,
         forceParse : false,
         autoclose : true
      });
   });
</script> <script>
   function add_div(e, result) {
      var obj = document.createElement('button');
      var div = document.createElement('div');
      var line = document.createElement('div');

      line.setAttribute('class', 'div_line');
      obj.innerHTML = "삭제";

      obj.setAttribute('id', 'del_button')

      div.innerHTML = document.getElementById(e).innerHTML;
      $(div).find('.clear').val('');

      if ($(".chkbox").prop('checked')) {
         $(div).find(".ldate").attr("disabled", false);
      }

      if (e == 'career_list') { //경력사항

         document.getElementById('carfield').appendChild(obj);
         div.appendChild(line);
         div.setAttribute("style", "height:180px;")
         document.getElementById('carfield').appendChild(div);
         document.getElementById('carfield').style.display = "block";

         div.setAttribute('id', result); //제일 밖에 id
         div.setAttribute('name', "career_list");
         div.setAttribute('value', result);
         div.setAttribute('class', 'list_field careerList');

         obj.setAttribute('class', 'btn btn-outline-danger ' + result);
         obj.setAttribute('name', 'career_remove');
         obj.setAttribute('onclick', 'remove_div(' + result + ')');

         $('.date input[type="text"]').each(function() {
            $(this).datepicker({
               format : "yyyymmdd",
               language : "ko",
               startView : 2,
               keyboardNavigation : false,
               forceParse : false,
               autoclose : true
            });
         });

      } else if (e == 'education_list') { //교육수료사항
         document.getElementById('edufield').appendChild(obj);
         div.appendChild(line);
         div.setAttribute("style", "height:180px;")
         document.getElementById('edufield').appendChild(div);

         document.getElementById('edufield').style.display = "block";
         div.setAttribute('id', result); //제일 밖에 id
         div.setAttribute('name', "education_list");
         div.setAttribute('value', result);
         div.setAttribute('class', 'list_field educationList');
         obj.setAttribute('class', 'btn btn-outline-danger ' + result);
         obj.setAttribute('name', 'education_remove');
         obj.setAttribute('onclick', 'remove_div(' + result + ')');

         $('.date input[type="text"]').each(function() {
            $(this).datepicker({
               format : "yyyymmdd",
               language : "ko",
               startView : 2,
               keyboardNavigation : false,
               forceParse : false,
               autoclose : true
            });
         });
      }

   }

   function remove_div(obj) { //obj = id값 500... or   300..... 
      $(`#` + obj).remove();//한칸 삭제
      $(`.` + obj).remove();//삭제버튼 삭제

   }
</script> <!-- 경력사항, 교육수료사항을 insert 후에  받아온 SEQ닶으로 재설정--> <script>
   var ID = '<c:out value="${member.userId}"/>';
   var resumeID = <%=resumeID%>;
   data = {}
   data.ID = ID;
   data.resumeID = resumeID;
   $(document).on('click', '.addbutton', function(e) {
      if (this.id == "car_add") {
         $.ajax({
            type : "POST",
            url : "${contextPath}/resume/page3InsertCareer.do",
            contentType : "application/json; charset=UTF-8",
            data : JSON.stringify(data),
            success : function(result) {
               add_div("career_list", result);
            },
            error : function() {

            }
         });
      } else if (this.id == "edu_add") {
         $.ajax({
            type : "POST",
            url : "${contextPath}/resume/page3InsertEducation.do",
            contentType : "application/json; charset=UTF-8",
            data : JSON.stringify(data),
            success : function(result) {
               add_div("education_list", result);
            },
            error : function() {

            }
         });

      }
   });
</script> <!-- delete --> <script>
   $(document).on('click', '#del_button', function(e) {
      var array = this.className.split(" ");
      var seqNum = array[2];
      $.ajax({
         type : "POST",
         url : "${contextPath}/resume/page3DeleteCareer.do",
         data : JSON.stringify(seqNum),
         contentType : "application/json; charset=UTF-8",
         success : function() {
            
         },
         error : function() {
         }
      });
   });
</script> <script>
   $(document).on('change', '.chkbox', function() {
      if ($(this).prop('checked')) {
         $(this).closest("div.date").find(".ldate").prop("disabled", true);
      } else {
         $(this).closest("div.date").find(".ldate").attr("disabled", false);
      }
   });
</script> <script>
   $(document).on(
         'click',
         '.move',
         function(e) {

            var careerCenter = [];
            var careerStartdate = [];
            var careerEnddate = [];
            var careerType = [];
            var careerPosition = [];
            var careerSEQ = [];

            var educationCenter = [];
            var educationStartdate = [];
            var educationEnddate = [];
            var educationHour = [];
            var educationOther = [];
            var educationSEQ = [];

            //career
            $("input[name='career_name']")
                  .each(
                        function(i) {
                           careerCenter.push($(
                                 "input[name='career_name']").eq(i)
                                 .val());
                           careerStartdate.push($(
                                 "input[name='career_start_date']")
                                 .eq(i).val());
                           careerEnddate.push($(
                                 "input[name='career_end_date']")
                                 .eq(i).val());
                           careerType.push($(
                                 "#careerType option:selected")
                                 .eq(i).val()); //바꿔야됨
                           careerPosition.push($(
                                 "input[name='career_rank']").eq(i)
                                 .val());
                           careerSEQ.push($(".careerList").eq(i).attr(
                                 "value"));
                        });

            //education
            $("input[name='academy_name']").each(
                  function(i) {
                     educationCenter
                           .push($("input[name='academy_name']").eq(i)
                                 .val());
                     educationStartdate.push($(
                           "input[name='academy_start_date']").eq(i)
                           .val());
                     educationEnddate.push($(
                           "input[name='academy_end_date']").eq(i)
                           .val());
                     educationHour.push($("input[name='academy_time']")
                           .eq(i).val());
                     educationOther
                           .push($("input[name='edu_othertype']")
                                 .eq(i).val());
                     educationSEQ.push($(".educationList").eq(i).attr(
                           "value"));
                  });

            var data = {};

            data.userID = '<c:out value="${member.userId}"/>';

            data.resumeID =
<%=resumeID%>;

            data.careerCenter = careerCenter;
            data.careerStartdate = careerStartdate;
            data.careerEnddate = careerEnddate;
            data.careerType = careerType;
            data.careerPosition = careerPosition;
            data.careerSEQ = careerSEQ;

            data.educationCenter = educationCenter;
            data.educationStartdate = educationStartdate;
            data.educationEnddate = educationEnddate;
            data.educationHour = educationHour;
            data.educationOther = educationOther;
            data.educationSEQ = educationSEQ;

            $.ajax({
               type : "POST",
               url : "${contextPath}/resume/page3Update.do",
               dataType : "json",
               contentType : "application/json; charset=UTF-8",
               data : JSON.stringify(data),
               success : function() {
               },
               error : function() {

               }
            });
         });
</script>
</head>


<body>

   <div class="sub_visual">
   <span style="color: white;">이력서 작성</span>
   </div>

   <div class="container">

      <div class="lnb">
         <ul>
            <li><a href="${contextPath}/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a
               href="${contextPath}/resume/resumeList.do?resumeUser=${member.userId}">이력서
                  관리</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a
               href="${contextPath}/resume/resumeWrite.do?userID=${member.userId}">이력서
                  작성</a></li>
         </ul>
      </div>

      <div id="title_area">
            <button id="first" class="btn btn-outline-danger headbutton move none" 
               onClick="location.href='${contextPath}/resume/resumeBackPage1.do?userID=${member.userId}&resumeID=<%=resumeID%>'">기본정보</button>
            <button id="second" class="btn btn-outline-danger headbutton move none" 
               onClick="location.href='${contextPath}/resume/resumeBackPage2.do?userID=${member.userId}&resumeID=<%=resumeID%>'">상세정보</button>
            <div id="third" class="headbutton move" >경력사항 / 교육수료사항</div>
            <button id="forth" class="btn btn-outline-danger headbutton move none" 
               onClick="location.href='${contextPath}/resume/moveToPage4.do?userID=${member.userId}&resumeID=<%=resumeID%>'">프로젝트 관련사항</button>
            <button id="last" class="btn btn-outline-danger headbutton move none" 
               onClick="location.href='${contextPath}/resume/moveToPage5.do?userID=${member.userId}&resumeID=<%=resumeID%>'">자기소개서</button>
         </div>
         <div class="pageIntro">
         <h3>경력사항 / 교육수료 사항</h3>
      </div>

      <div class="main">
            <h5>경력사항</h5>
         <div id="career_list" class="list_field careerList"
            name="career_list" value="${careerList1.careerSEQ}">
            <button id="car_add" class="btn btn-outline-danger addbutton" type="button">추가</button>
            <div>
               <label class="title">회사명</label> <input type="text"
                  name="career_name" id="name" placeholder="회사명 입력" class="clear"
                  onfocus="this.placeholder=''" onblur="this.placeholder='회사명 입력'"
                  value="${careerList1.careerCenter}">
               <div class="date">
                  <label class="title">경력기간</label> <input type="text"
                     name="career_start_date" class="short clear" placeholder="시작 날짜"
                     value="${careerList1.careerStartdate}"> ~ <input
                     type="text" name="career_end_date" class="short ldate"
                     placeholder="끝 날짜" class="clear"
                     value="${careerList1.careerEnddate}"> <span
                     id="careertype"><input type="checkbox" class="chkbox"
                     class="clear"> 재직중 </span>
               </div>

            </div>

            <div>
               <label class="title">직위</label> <input type="text"
                  name="career_rank" id="career_rank" class="short claear"
                  placeholder="직위명 입력" onfocus="this.placeholder=''"
                  onblur="this.placeholder='직위명 입력'"
                  value="${careerList1.careerPosition}"> <label
                  class="title">고용형태</label> <select name="career_type"
                  id="careerType">
                  <option id="full" value="정규"
                     <c:if test="${careerList1.careerType eq '정규'}">selected</c:if>>정규</option>
                  <option id="parttime" value="계약"
                     <c:if test="${careerList1.careerType eq '계약'}">selected</c:if>>계약</option>
               </select>
            </div>
         </div>

         <c:forEach var="career" items="${careerList}">

            <div id="${career.careerSEQ}" name="career_list"
               value="${career.careerSEQ}" class="list_field careerList">
               <button id="car_add" class="btn btn-outline-danger addbutton" type="button">추가</button>
               <button id="del_button" class="btn btn-outline-danger ${career.careerSEQ}"
                  name="career_remove" onclick="remove_div(`${career.careerSEQ}`)">삭제</button>
               <div class="line1"></div>

               <label class="title">회사명</label> <input type="text"
                  name="career_name" placeholder="회사명 입력"
                  onfocus="this.placeholder=''" onblur="this.placeholder='회사명 입력'"
                  value="${career.careerCenter}">

               <div class="date">
                  <label class="title">경력기간</label> <input type="text"
                     name="career_start_date" class="short clear" placeholder="시작 날짜"
                     value="${career.careerStartdate}"> ~ <input type="text"
                     name="career_end_date" class="short ldate clear"
                     placeholder="끝 날짜" value="${career.careerEnddate}"> <span
                     id="careertype"><input type="checkbox" class="chkbox"
                     class="clear"> 재직중 </span>
               </div>
               <div>
                  <label class="title">직위</label> <input type="text"
                     name="career_rank" id="career_rank" class="short claear"
                     placeholder="직위명 입력" onfocus="this.placeholder=''"
                     onblur="this.placeholder='직위명 입력'"
                     value="${career.careerPosition}"> <label class="title">고용형태</label>
                  <select name="career_type" id="careerType">
                     <option id="full" value="정규"
                        <c:if test="${career.careerType eq '정규'}">selected</c:if>>정규</option>
                     <option id="parttime" value="계약"
                        <c:if test="${career.careerType eq '계약'}">selected</c:if>>계약</option>
                  </select>
               </div>
            </div>
         </c:forEach>
         <div id="carfield" class="fieldset"></div>
      </div>


      <div class="main">
            <h5>교육수료 사항</h5>
         <div id="education_list" class="list_field educationList"
            name="education_list" value="${educationList1.careerSEQ}">
            <button id="edu_add" class="btn btn-outline-danger addbutton" type="button">추가</button>

            <div>
               <label class="title">교육기관</label> <input type="text"
                  name="academy_name" id="name" placeholder="기관명 입력" class="clear"
                  onfocus="this.placeholder=''" onblur="this.placeholder='기관명 입력'"
                  value="${educationList1.careerCenter}">
               <div class="date">
                  <label class="title">교육기간</label> <input type="text"
                     name="academy_start_date" class="short clear" placeholder="시작 날짜"
                     value="${educationList1.careerStartdate}"> ~ <input
                     type="text" name="academy_end_date" class="short ldate clear"
                     placeholder="끝 날짜" value="${educationList1.careerEnddate}">
               </div>
            </div>

            <div>
               <label class="title">교육시간</label> <input type="text"
                  name="academy_time" id="edu_time" placeholder="교육시간 입력"
                  onfocus="this.placeholder=''" onblur="this.placeholder='교육시간 입력'"
                  class="clear" value="${educationList1.careerHour}"> <label
                  class="title">비고</label> <input type="text" name="edu_othertype"
                  id="edu_othertype" placeholder="비고" onfocus="this.placeholder=''"
                  onblur="this.placeholder='비고'" class="clear"
                  value="${educationList1.careerOther}">
            </div>
         </div>


         <c:forEach var="education" items="${educationList}">
            <div id="${education.careerSEQ}" class="list_field educationList"
               name="education_list" value="${education.careerSEQ}">
               <button id="edu_add" class="btn btn-outline-danger" type="button"
                  onClick="add_div('education_list')">추가</button>
               <button id="del_button" class="btn btn-outline-danger ${education.careerSEQ}"
                  name="career_remove"
                  onclick="remove_div(`${education.careerSEQ}`)">삭제</button>
               <div class="line1"></div>
               <div>
                  <label class="title">교육기관</label> <input type="text"
                     name="academy_name" id="name" placeholder="기관명 입력" class="clear"
                     onfocus="this.placeholder=''" onblur="this.placeholder='기관명 입력'"
                     value="${education.careerCenter}">
                  <div class="date">
                     <label class="title">교육기간</label> <input type="text"
                        name="academy_start_date" class="short clear"
                        placeholder="시작 날짜" value="${education.careerStartdate}">
                     ~ <input type="text" name="academy_end_date"
                        class="short ldate clear" placeholder="끝 날짜"
                        value="${education.careerEnddate}">
                  </div>
               </div>
               <div>
                  <label class="title">교육시간</label> <input type="text"
                     name="academy_time" id="edu_time" placeholder="교육시간 입력"
                     onfocus="this.placeholder=''" onblur="this.placeholder='교육시간 입력'"
                     class="clear" value="${education.careerHour}"> <label
                     class="title">비고</label> <input type="text" name="edu_othertype"
                     id="edu_othertype" placeholder="비고" onfocus="this.placeholder=''"
                     onblur="this.placeholder='비고'" class="clear"
                     value="${education.careerOther}">
               </div>
            </div>
         </c:forEach>
         <div id="edufield" class="fieldset"></div>
      </div>

      <div class="buttonGroups">
         <button id="btn1" class="btn btn-outline-danger move" type="button"
            onClick="location.href='${contextPath}/resume/resumeBackPage2.do?userID=${member.userId}&resumeID=<%=resumeID%>'">이전</button>
         <button id="btn2" class="btn btn-outline-danger move" type="button"
            onClick="location.href='${contextPath}/resume/moveToPage4.do?userID=${member.userId}&resumeID=<%=resumeID%>'">다음</button>
      </div>
   </div>

</body>

</html>