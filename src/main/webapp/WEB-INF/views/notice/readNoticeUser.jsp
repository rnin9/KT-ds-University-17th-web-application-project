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

.sub_visual {
   font-family: 'Noto Sans KR', sans-serif;
   width: 100%;
   background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
      url("${pageContext.request.contextPath}/resources/image/sub_visual/courseApply.jpg");
   border: 0;
   font-size: 32px;
   font-weight: 500;
   height: 190px;
   padding-top: 69px;
   background-position: 50% 64%;
   background-size: cover;
   background-repeat: no-repeat;
}

a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
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
         value="${readNoticeUser.notice_no}" /> <input type="hidden"
         id="NT_FILE_NO" name="NT_FILE_NO" value="">

      <div class="sub_visual">
         <span style="color: black;"></span>
      </div>

      <div class="container">

         <div class="lnb">
            <ul>
               <li><a href="/springEx/main.do">홈</a></li>
               <li style="color: grey; font-weight: bold;">〉</li>
               <li class="on"><a href="/springEx/notice/listNoticeUser.do">공지사항</a></li>
            </ul>
         </div>

         <div class="pageIntro">공지사항</div>



         <div class="wrapper_noticeBox">
            <div class="notice" style="padding: 3%;overflow:hidden;">

               <div class="noticeInfo" style="text-align: left;">
                  <c:choose>
                     <c:when test="${readNoticeUser.notice_category eq '[공지]'}">
                        <div class="noticeCategory" style="color: red; font-size: 20px;">${readNoticeUser.notice_category}</div>
                     </c:when>
                     <c:otherwise>
                        <div class="noticeCategory"
                           style="color: green; font-size: 20px;">${readNoticeUser.notice_category}</div>
                     </c:otherwise>
                  </c:choose>
                  <div class=noticeTitle style="font-size: 27px;">
                     <b>${readNoticeUser.notice_title}</b>
                  </div>
                  <span class="noticeDate" style="color: lightgrey;">${readNoticeUser.noticeDate}</span>
                  <span class="noticeHit" style="color: lightgrey;"> 조회
                     ${readNoticeUser.notice_hit}</span>
                  <hr>
               </div>

               <div class="noticeContent" style=" margin-bottom:3%;">
                  <div class="noticeContentText"
                     style="text-align: left; line-height: 30px; width: 70%; float: left">${readNoticeUser.notice_contents}</div>
                  <div class="noticeContentFile"
                     style="text-align: right; width: 30%; float: right">
                     <c:forEach var="fileVO" items="${fileListUser}">
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

         <div style="margin-top: 50px; padding-bottom: 150px;">
            <button type="button" class="btn btn-outline-danger"
               onClick="location.href='/springEx/notice/listNoticeUser.do'">목록</button>
         </div>
      </div>

   </form>
</body>
</html>