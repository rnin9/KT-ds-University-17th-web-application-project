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
<title>이력서 관리</title>

<script type="text/javascript" charset="utf8"
   src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style.css" />

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
   crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
   href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css" />
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript"
   src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>

<style>

a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
}

.container {
   display: flex;
    flex-wrap: wrap;
    width: 75%;
    justify-content: space-around;
    flex-direction: column;
    padding-bottom:200px;
   margin-left: 15%;
}

button {
   float: right;
   margin-right: 10px;
}

.dataTables_wrapper {
   margin-top: 30px;
   display: inline-block;
   width: 100%;
}

/* .resumeList {
   border-collapse: collapse;
   font-size: 14px;
   line-height: 2.2;
   margin-top: 40px;
   text-align: center;
   width: 100%;
   line-height: 40px;
} */




#item {
   border-color: grey;
   border-radius: .25rem;
   border-size: 1px;
}

#btn {
   margin-left : -20px;
}

</style>

</head>


<script type="text/javascript">
   function checkSelectAll(checkbox)  {
      const selectall 
        = document.querySelector('input[name="check-all"]');
      if(checkbox.checked == false)  {
        selectall.checked = false;
      }
      
    }

    function selectAll(selectAll)  {
      const checkboxes 
         = document.getElementsByName('ab');
      
      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked
      })
    }
</script>
<script type="text/javascript">
   function filter(){
   
       var value = document.getElementById("value").value.toUpperCase();
       var item = document.getElementsByClassName("item");
       
       for(var i=0;i<item.length;i++){
          var name = item[i].getElementsByClassName("name");
          if(name[0].innerText.toUpperCase().indexOf(value) > -1){
             item[i].style.display="table-row";
         }else{
            item[i].style.display="none";
         }
       }   
   } 
</script>
<script type="text/javascript">
   function enter(){
       // 엔터키의 코드는 13입니다.
      if(event.keyCode == 13){
         filter()  // 실행할 이벤트
      }
   }
</script>
<script type="text/javascript">
$(document).ready(function(){
   $('#table_id').DataTable({
       dom : 'lBfrtip',
         buttons: [],

         language: {
            info : '',
            sInfoFiltered : '',
            infoEmpty : '',
            emptyTable : '데이터가 없습니다.',
            thousands : ',',
            lengthMenu : '_MENU_ 개씩 보기',
            loadingRecords : '데이터를 불러오는 중',
            processing : '처리 중',
            zeroRecords : '검색 결과 없음',
            paginate : {
               first : '처음',
               last : '끝',
               next : '다음',
               previous : '이전'
            },
            search: '',
            sSearchPlaceholder: '통합 검색',
         
         }
   });
});
</script>

<body>

   <div class="container">

 		<div class="pageIntro">대표이력서 관리</div>
 
         <table class="table_" id="table_id">
         <thead>
            <tr align="center">
               <td>아이디</td>
               <td>이름</td>
               <td>대표 이력서</td>
            </tr>
         
            <tbody id="ajaxTable">
               <c:forEach var="resumeAdmin" items="${resumeAdmin}">
                  <tr id="item">
                      <td>${resumeAdmin.resumeUser}</td>                
                     <td>${resumeAdmin.memberVO.userName}</td>
                     <td class="name"><a
                        href="${contextPath}/resume/resumeInfo.do?resumeID=${resumeAdmin.resumeID}&resumeUser=${resumeAdmin.resumeUser}">${resumeAdmin.resumeDate}</a></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>




   </div>
</body>
</html>