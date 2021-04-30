<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<c:choose>
	<c:when test="${isLogOn == true  && member.userPosition == 'ADMIN'}">
		<!DOCTYPE html>
		<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>



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
<script>
	function deleteCheck(){
		
		var url = "${contextPath}/notice/deleteCheck.do";
		var cnt = $("input[name='ab']:checked").length;
		var valueArr = new Array();
		$("input[name='ab']:checked").each(function(i){
			valueArr.push($(this).val());
		});
		console.log(valueArr);
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
				/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
			},
			error : function(data) { 
	            console.log("fail");
	            
	        }
		});
	};
	</script>


<script type="text/javascript">
$(document).ready(function(){
	
	$.extend( $.fn.dataTable.defaults, {
	    ordering:  false
	} );

	$('#myTable').DataTable({
		 dom : 'lBfrtip',
	      buttons: ['excel'],

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
<title>공지사항 관리</title>
<style>
a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
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

.fas {
	margin-left: 5px;
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

<body>
	<div class="container">
		<form method="post" action="${contextPath}/notice/noticeForm.do">


			<div class="pageIntro">공지사항</div>


			<table id="myTable" class="table_">
				<thead>

					<tr align="center">
						<th><input type="checkbox" name="check-all"
							onclick='selectAll(this)' /></th>

						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="noticeFixList" items="${noticeFixList}">
						<tr>
							<td><input type="checkbox" name="ab"
								value="${noticeFixList.notice_no}"
								onclick='checkSelectAll(this)' /></td>


							<td style="color: red; font-weight: bold">${noticeFixList.notice_category}</td>


							<td style="font-weight: bold; text-align: left;" class="name"><a
								href="${contextPath}/notice/readNotice.do?notice_no=${noticeFixList.notice_no}">
									${noticeFixList.notice_title}</a> <c:if
									test="${noticeFixList.nt_file_size gt 0}">
									<i class="fas fa-file-alt"></i>
								</c:if></td>

							<td>${noticeFixList.notice_adminID}</td>
							<td>${noticeFixList.notice_date}</td>
							<td>${noticeFixList.notice_hit}</td>
						</tr>
					</c:forEach>


					<c:forEach var="noticeList" items="${noticeList}">
						<tr class="item">
							<td><input type="checkbox" name="ab"
								value="${noticeList.notice_no}" onclick='checkSelectAll(this)' /></td>
							<td>${noticeList.notice_category}</td>

							<td class="name" style="text-align: left;"><a
								href="${contextPath}/notice/readNotice.do?notice_no=${noticeList.notice_no}">
									${noticeList.notice_title}</a> <c:if
									test="${noticeList.nt_file_size gt 0}">
									<i class="fas fa-file-alt"></i>
								</c:if></td>

							<td>${noticeList.notice_adminID}</td>
							<td>${noticeList.notice_date}</td>
							<td>${noticeList.notice_hit}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>

		</form>
		<div style="margin-top: 50px;">
			<button class="btn btn-outline-danger" type="button"
				onClick="deleteCheck()">삭제</button>
			<button class="btn btn-outline-danger"
				onClick="location.href='noticeForm.do'">등록</button>
		</div>
	</div>
</body>
		</html>
	</c:when>
</c:choose>