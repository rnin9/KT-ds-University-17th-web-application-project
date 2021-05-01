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


<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

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

</head>


<style>
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

.dataTables_wrapper {
	margin-top: 30px;
	display: inline-block;
	width: 100%;
}

table.dataTable thead th, table.dataTable thead td {
	padding: 10px 18px;
	border-bottom: 1px solid #96988f;
	background-color: #f8f8f8;
}

table.dataTable td {
	border-top: 1px solid lightgrey;
}
</style>

<body>

	<div class="container">
		<!-- 홈>강의관리>수강관리 -->

		<div class="pageIntro">수강관리</div>

		<!-- 테이블(표, 리스트) -->
		<table id="myTable" class="table_" style="border-bottom: 1px solid #96988f;">
			<thead>
				<tr align="center">
					<td style="width: 10px;"><input type="checkbox"
						name="check-all" onclick='selectAll(this)' /></td>
					<td><b>아이디</b></td>
					<td><b>이름</b></td>
					<td style="width: 6%;"><b>전화번호</b></td>
					<td><b>이메일</b></td>
					<td><b>소속회사</b></td>
					<td><b>강의명</b></td>
					<td style="width: 70px;"><b>신청일</b></td>
					<td style="width: 50px;"><b>수강상태</b></td>
					<!-- <td><b>수료증</b></td> -->
				</tr>
			</thead>

			<tbody id="ajaxTable">
				<c:forEach var="courseTake" items="${courseApplyList}">
					<tr align="center">
						<td><input type="checkbox" name="ab"
							value="${courseTake.userID} ${courseTake.courseID} ${courseTake.courseTake_State}"
							onclick='checkSelectAll(this)' /></td>
						<td>${courseTake.userID}</td>
						<td>${courseTake.memberVO.userName}</td>
						<td>${courseTake.memberVO.userPhoneNumber}</td>
						<td>${courseTake.memberVO.userEmail}</td>
						<td>${courseTake.partnerVO.partnerName}</td>
						<td><a
							href="/springEx/course/selectCourse.do?courseID=${courseTake.courseVO.courseID}">${courseTake.syllabusVO.syllabusName}</a></td>
						<td>${courseTake.applyDate}</td>
						<c:choose>
							<c:when test="${courseTake.courseTake_State eq '수료'}">
								<td style="display: flex; text-align: center; margin-left: 10%;">${courseTake.courseTake_State}
									<form name="formForCertificate"
										action="${contextPath}/courseTake/certificate.do"
										method="post">
										<input type=text name="userName"
											value="${courseTake.memberVO.userName}"
											style="display: none;" /> <input type=text name="courseName"
											value="${courseTake.syllabusVO.syllabusName}"
											style="display: none;" /> <input type=text
											name="userCompany"
											value="${courseTake.partnerVO.partnerName}"
											style="display: none;" /> <input type=text
											name="courseStart" value="${courseTake.courseVO.courseStart}"
											style="display: none;" /> <input type=text name="courseEnd"
											value="${courseTake.courseVO.courseEnd}"
											style="display: none;" /> <input type=text
											name="syllabusTotalTime"
											value="${courseTake.syllabusVO.syllabusTotalTime}"
											style="display: none;" /> <input type=text
											name="userBirthday" value="${courseTake.memberVO.birth}"
											style="display: none;" /> <input type="image"
											src="${pageContext.request.contextPath}/resources/image/icon/icon_print.png"
											style="width: 17px; margin-top: 12px; margin-left: 5px;"
											onclick="javascript:popup(this.form);">
									</form>
							</c:when>
							<c:otherwise>
								<td style="text-align: center;">${courseTake.courseTake_State}</td>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br> <br>

		<!-- 버튼 -->
		<div style="margin-top: 40px">
			<button class="btn btn-outline-danger" type="button"
				onClick="deleteCheck();">삭제</button>
			<button class="btn btn-outline-danger" type="button"
				onClick="completionCheck();">수료완료</button>
			<button class="btn btn-outline-danger" type="button"
				onClick="consentCancelCheck();">승인대기</button>
			<button class="btn btn-outline-danger" type="button"
				onClick="consentCheck();">신청승인</button>
		</div>



	</div>

</body>

<script type="text/javascript">
$(document).ready(function(){
   $('#myTable').DataTable({
      
      dom : 'lBfrtip',
      buttons: ['excel'],

 		columns : [
	   		{ "width": "2%" },
	   		{ "width": "10%" },
	    	{ "width": "7%" },
	    	{ "width": "7%" },
	    	{ "width": "10%" },
	    	{ "width": "13%" },
	    	null,
	    	{ "width": "10%" },
	    	{ "width": "10%" }
	  	],
   
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

<!-- 승인대기->승인 -->
<script>
   function consentCheck(){
	  var url = "${contextPath}/courseTake/updateConsentCheck.do";
      var cnt = $("input[name='ab']:checked").length;
      var valueArr = new Array();
      $("input[name='ab']:checked").each(function(i){
         valueArr.push($(this).val());
      });
      
      if(cnt==0){
         Swal.fire("선택된 항목이 없습니다.","","warning");
      }
      else{
	     $.ajax({
	     	url : url,
	        type : 'POST',
	        traditional : true,
	        data : {
	            valueArr : valueArr
	        },
	        success : function(data){
	        	console.log("success");
	        	console.log(data.ox1);
	        	
	            if(data.ox1 == 'x'){
	          	     Swal.fire('승인대기상태만 체크해주세요','','warning')
	          	}else{
	          	    Swal.fire('승인처리되었습니다.','','success').then(()=>{
	          	    	window.location.reload();
	   			     })
	          	}
	            
	            /*$("#container").load("${contextPath}/courseTake/courseApplyList.do");*/
	        },
	        error : function(data) { 
	            console.log("fail");
	        }
      
	    })
      } 
   };
</script>

<!--  잘못 승인을 눌렀을 때를 위한 승인->승인대기  -->
<script>
   function consentCancelCheck(){
      var url = "/springEx/courseTake/updateConsentCancelCheck.do";
      var cnt = $("input[name='ab']:checked").length;
      var valueArr = new Array();
      $("input[name='ab']:checked").each(function(i){
         valueArr.push($(this).val());
      });
      
      
      if(cnt==0){
         Swal.fire("선택된 항목이 없습니다.","","warning");
      }
      else{
         $.ajax({
            url : url,
            type : 'POST',
            traditional : true,
            data : {
               valueArr : valueArr
            },
            success : function(data){
               console.log("success");
               console.log(data.ox2);
               
               if(data.ox2 == 'x'){
         	     	Swal.fire('승인상태만 체크해주세요','','warning')
         	    }else{
         	    	Swal.fire('승인대기처리되었습니다.','','success').then(()=>{
         	    		window.location.reload();
  			     	})
         	    }
               /*$("#container").load("${contextPath}/courseTake/courseApplyList.do");*/
            },
            error : function(data) { 
                  console.log("fail");
              }
         })
      }
   };
      
      
</script>

<!-- 수료대기->수료 -->
<script>
   function completionCheck(){
      var url = "/springEx/courseTake/updateCompletionCheck.do";
      var cnt = $("input[name='ab']:checked").length;
      var valueArr = new Array();
      $("input[name='ab']:checked").each(function(i){
         valueArr.push($(this).val());
      });
      
      
      if(cnt==0){
         Swal.fire("선택된 항목이 없습니다.","","warning");
      }
     else{
         $.ajax({
            url : url,
            type : 'POST',
            traditional : true,
            data : {
               valueArr : valueArr
            },
            success : function(data){
               console.log("success");
               console.log(data.ox3);
               
               if(data.ox3 == 'x'){
         	     	Swal.fire('수료대기상태만 체크해주세요','','warning')
         	    }else{
         	    	Swal.fire('수료처리되었습니다.','','success').then(()=>{
         	    		window.location.reload();
  			     	})
         	    }
               /*$("#container").load("${contextPath}/courseTake/courseApplyList.do");*/
            },
            error : function(data) { 
                  console.log("fail");
              }
         })
     }
   };
      
      
</script>

<!-- 삭제 -->
<script>
   function deleteCheck(){
      var url = "/springEx/courseTake/deleteCourseTake.do";
      var cnt = $("input[name='ab']:checked").length;
      var valueArr = new Array();
      $("input[name='ab']:checked").each(function(i){
         valueArr.push($(this).val());
      });
      
      
      if(cnt==0){
         Swal.fire("선택된 항목이 없습니다.","","warning");
      }
      else{
         $.ajax({
            url : url,
            type : 'POST',
            traditional : true,
            data : {
               valueArr : valueArr
            },
            success : function(data){
               console.log("success");
               window.location.reload();
               /*$("#container").load("${contextPath}/courseTake/courseApplyList.do");*/
            },
            error : function(data) { 
                  console.log("fail");
              }
         })
      }
   };
      
</script>
<script type="text/javascript">
       //페이지이동
       function movePage(currentPage, cntPerPage, pageSize){
             var url = "${pageContext.request.contextPath}/courseTake/courseApplyList.do";
             url = url + "?currentPage="+currentPage;
             url = url + "&cntPerPage="+cntPerPage;
             url = url + "&pageSize="+pageSize;
             
             location.href=url;
         }
      
</script>

<script type="text/javascript">
function popup(frm)
{
  var url    ="/springEx/courseTake/certificate.do";
  var title  = "certificate";
  var status = "width=1000px, height=1000px, status=no, menubar=no, toolbar=no, resizable=no"; 
  window.open('${pageContext.request.contextPath}/courseTake/certificate.do', title,status); //popup 열기
  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다. 
  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
  frm.method = "post";
  frm.submit();
  }
</script>

</html>