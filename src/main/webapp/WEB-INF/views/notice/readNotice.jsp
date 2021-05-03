<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta charset=UTF-8">
<title>공지사항 정보</title>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style2.css" />

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
   crossorigin="anonymous">


<style>
.bg-primary {
   background-color: white !important;
}

a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
}

.container {
   font-family: 'Noto Sans KR', sans-serif;
   display: flex;
   flex-wrap: wrap;
   width: 80%;
   justify-content: space-around;
   flex-direction: column;
   margin-left: 15%;
}

button {
   float: right;
   margin-right: 10px;
}

.wrapper_noticeBox {
   margin-top: 30px;
   border: 1px solid lightgrey;
   border-radius: 10px;
   width: 100%;
   height: auto;
   width: 100%;
   height: auto;
   min-height: 500px;
}
</style>


</head>



<script type="text/javascript">
   $(document)
         .ready(
               function() {
                  var formObj = $("form[name='readForm']");

                  // 수정 
                  $("#button_bottom_U")
                        .on(
                              "click",
                              function() {
                                 formObj
                                       .attr("action",
                                             "${contextPath}/notice/updateView.do");
                                 formObj.attr("method", "get");
                                 formObj.submit();
                              })

                  // 삭제
                  $("#button_bottom_D")
                        .on(
                              "click",
                              function() {

                                 var deleteYN = Swal.fire({title:'삭제하시겠습니까?',
                                         icon:'warning',
                                         confirmButtonText: `삭제`,
                                         showCancelButton: true,
                                         cancelButtonText: '취소',
                                         confirmButtonColor: '#3085d6',
                                   	     cancelButtonColor: '#d33'});
                                 if (deleteYN == true) {

                                    formObj
                                          .attr("action",
                                                "${contextPath}/notice/deleteNotice.do");
                                    formObj.attr("method", "post");
                                    formObj.submit();
                                 }
                              })

                  // 취소
                  $("#button_bottom_C")
                        .on(
                              "click",
                              function() {

                                 location.href = "${contextPath}/notice/listNotice.do";
                              })
               })
</script>

<script type="text/javascript">
   // 첨부파일 다운로드
   function fn_fileDown(nt_file_no) {
      var formObj = $("form[name='readForm']");
      $("#NT_FILE_NO").attr("value", nt_file_no);
      console.log('yeeeeeee' + nt_file_no);
      formObj.attr("action", "${contextPath}/notice/fileDown.do");
      formObj.submit();
   }
   
   chk = (num, name) => {
      console.log(num + 'meeeeeeeeeee' + name);
   }
</script>


<body>
   <form name="readForm" role="form" method="post">
      <input type="hidden" id="notice_no" name="notice_no"
         value="${readNotice.notice_no}" /> <input type="hidden"
         id="NT_FILE_NO" name="NT_FILE_NO" value="">

      <div class="container">

         <div class="pageIntro">공지사항</div>

         <div class="wrapper_noticeBox">
            <div class="notice" style="padding: 3%;overflow:hidden;">

               <div class="noticeInfo" style="text-align: left;">
                  <c:choose>
                     <c:when test="${readNotice.notice_category eq '[공지]'}">
                        <div class="noticeCategory" style="color: red; font-size: 20px;">${readNotice.notice_category}</div>
                     </c:when>
                     <c:otherwise>
                        <div class="noticeCategory"
                           style="color: green; font-size: 20px;">${readNotice.notice_category}</div>
                     </c:otherwise>
                  </c:choose>
                  <div class=noticeTitle style="font-size: 27px;">
                     <b>${readNotice.notice_title}</b>
                  </div>
                  <span class="noticeDate" style="color: lightgrey;">${readNotice.notice_date}</span>
                  <span class="noticeHit" style="color: lightgrey;"> 조회
                     ${readNotice.notice_hit}</span>
                  <hr>
               </div>

               <div class="noticeContent" style="width:100%">
                  <div class="noticeContentText"
                     style="text-align: left; line-height: 30px; width:70%; float:left">${readNotice.notice_contents}</div>
                  <div class="noticeContentFile" style="text-align: right; width:30%; float:right">
                     <c:forEach var="fileVO" items="${fileList}">
                        <a href="#"
                           onclick="fn_fileDown('${fileVO.NT_FILE_NO}'); return false;"><i
                           class="fas fa-file-alt"></i>${fileVO.ORG_NT_FILE_NAME}</a>(${fileVO.NT_FILE_SIZE}kb)<br>

                        <!--  <a
                           href="/KT-ds-University-17th-web-application-project/filepath/${fileVO.STR_NT_FILE_NAME}"
                           download><i class="fas fa-file-alt"></i>'${fileVO.ORG_NT_FILE_NAME}'('${fileVO.NT_FILE_SIZE}'kb)</a>-->
                     </c:forEach>
                  </div>

               </div>
            </div>
         </div>

         <div style="margin-top: 50px;">
            <button type="button" class="btn btn-outline-danger"
               id="button_bottom_C">취소</button>
            <button type="button" class="btn btn-outline-danger"
               id="button_bottom_D">삭제</button>
            <button type="submit" class="btn btn-outline-danger"
               id="button_bottom_U">수정</button>
         </div>
      </div>
   </form>
</body>
</html>