<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<!-- jQuery 라이브러리 참조-->
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<!-- plugin 참조-->
<script type="text/javascript"
   src="js/plugins/validation/jquery.validate.min.js"></script>
<meta charset=UTF-8">
<title>공지사항 등록</title>

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

.container {
   font-family: 'Noto Sans KR', sans-serif;
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

.table_ th {
   background-color: white;
   border: none;
   text-align: left;
   width: 10%;
   color: grey;
   font-size: 20px;
   font-weight: 400;
}

.table_ td {
   border: none;
}

#file-upload-button {
   height: 14px;
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
</style>

</head>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='writeForm']");
      $(".write_btn").on("click", function() {
         if (fn_valiChk()) {
            return false;
         }
         formObj.attr("action", "${contextPath}/notice/insertNotice.do");
         formObj.attr("method", "post");
         formObj.submit();
      });
      fn_addFile();
   })
   function fn_valiChk() {
      var regForm = $("form[name='writeForm'] .chk").length;
      for (var i = 0; i < regForm; i++) {
         if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
            alert($(".chk").eq(i).attr("title"));
            return true;
         }
      }
   }
   function fn_addFile() {
      var fileIndex = 1;
      //$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
      $("#fileAdd_btn")
            .on(
                  "click",
                  function() {
                     $("#fileIndex")
                           .append(
                                 "<div><input type='file' style='float:left;' name='file_"
                                       + (fileIndex++)
                                       + "'>"
                                       + "</button>"
                                       + "<button type='button' style='float:right;' id='fileDelBtn'>"
                                       + "삭제" + "</button></div>");
                  });
      $(document).on("click", "#fileDelBtn", function() {
         $(this).parent().remove();

      });
   }
</script>
<body>


   <div class="container">
      <form name="writeForm" method="post" enctype="multipart/form-data"
         action="${contextPath}/notice/insertNotice.do">

         <div class="pageIntro">공지사항</div>

         <div class="wrapper_noticeBox">
            <div class="notice" style="padding: 3%;">

               <div class="noticeInfo" style="text-align: left;">


                  <table class="table_" style="border: none;">
                     <tr>
                        <th>분류</th>

                        <td><div class="selectBox" style="text-align: left;">
                              <select id="notice_category" class="form-select"
                                 aria-label="Default select example" name="notice_category"
                                 oninvalid="this.setCustomValidity('분류를 선택해주세요')"
                                 oninput="this.setCustomValidity('')" required>
                                 <option value="">-- 분류 --</option>
                                 <option value="[일반]">[일반]</option>
                                 <option value="[안내]">[안내]</option>
                                 <option value="[모집]">[모집]</option>
                                 <option value="[추가모집]">[추가모집]</option>
                                 <option value="[공지]">[공지]</option>
                                 <option value="[채용예정자]">[채용예정자]</option>
                              </select>
                           </div></td>

                     </tr>
                     <tr>
                        <th>제목</th>
                        <td><input type="text" class="form-control"
                           placeholder="제목을 입력하세요." name="notice_title" id="notice_title"
                           oninvalid="this.setCustomValidity('제목을 입력해주세요')"
                           oninput="this.setCustomValidity('')" required /></td>
                     </tr>
                     <tr style="display: none;">
                        <th>작성자</th>
                        <td><input type="text" class="form-control"
                           placeholder="작성자를 입력하세요." name="notice_adminID"
                           id="notice_adminID"
                           oninvalid="this.setCustomValidity('작성자를 입력해주세요')"
                           oninput="this.setCustomValidity('')" required
                           value="${member.userId}" readonly /></td>
                     </tr>
                     <tr>
                        <th>첨부파일</th>
                        <td id="fileIndex"></td>
                  </table>

                  <div class="noticeContent">
                     <div class="noticeContentFile" style="text-align: right;">
                        <c:forEach var="fileVO" items="${fileListUser}">
                           <!--     <a href="#"
                        onclick="fn_fileDown('${fileVO.NT_FILE_NO}'); return false;">${fileVO.ORG_NT_FILE_NAME}</a>(${fileVO.FILE_NT_SIZE}kb)<br> -->

                           <a
                              href="/KT-ds-University-17th-web-application-project/filepath/${fileVO.STR_NT_FILE_NAME}"
                              download><i class="fas fa-file-alt"></i>'${fileVO.ORG_NT_FILE_NAME}'('${fileVO.NT_FILE_SIZE}'kb)</a>
                        </c:forEach>
                     </div>
                     <div class="noticeContentText"
                        style="text-align: left; line-height: 30px;">${readNotice.notice_contents}</div>
                  </div>
               </div>

               <div class="inform">

                  <textarea class="informInputBox" placeholder="내용을 입력하세요."
                     name="notice_contents" id="notice_contents"
                     oninvalid="this.setCustomValidity('내용을 입력해주세요')"
                     oninput="this.setCustomValidity('')" required></textarea>
               </div>
            </div>

         </div>
      </form>
      <div style="margin-top: 50px;">
         <button class="btn btn-outline-danger" id="fileAdd_btn" type="button">파일추가</button>
         <button class="btn btn-outline-danger" type="button"
            onclick="history.back()">취소</button>
         <button class="btn btn-outline-danger" type="submit">글쓰기</button>
      </div>
   </div>

</body>
</html>