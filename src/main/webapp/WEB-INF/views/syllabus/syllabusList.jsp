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
<title>강의계획서 관리</title>

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

</head>
<!-- 
<script>
$(document).ready( function () {
    $('#table_id').DataTable();
} );
</script>
 -->



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
		
		
			var url = "${contextPath}/syllabus/deleteCheck.do";
			var cnt = $("input[name='ab']:checked").length;
			var valueArr = new Array();
			$("input[name='ab']:checked").each(function(i){
				valueArr.push($(this).val());
			});
			
			if (cnt==0){
				Swal.fire("선택된 강의계획서가 없습니다.","","warning");
			}else{
				deleteYN = Swal.fire({
	                title: '삭제하겠습니까?',
	                text: '',
	                icon: 'warning',
	                showCancelButton: true,
	                confirmButtonColor: '#3085d6',
	                cancelButtonColor: '#d33',
	                confirmButtonText: '삭제',
	                cancelButtonText: '취소'
	            }).then((result) => {
	                if (result.value) {
				
					$.ajax({
						url : url,
						type : 'POST',
						traditional : true,
						data : {
							valueArr : valueArr
						},
						success : function(data){
							console.log("success");
							Swal.fire("삭제되었습니다.","","success").then(()=>{
								location.reload();
							})
								
			                
							/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
						},
						error : function(data) {
							Swal.fire("선택한 강의계획서를 사용하는 강의가 있습니다.","","error");
							console.log("fail");
				        }
					})
				}

                
	            })
			}
	};
</script>
<script>
	function register(){
		location.href='${contextPath}/syllabus/syllabusForm.do'
		/*if (${isLogOn == true}){
			location.href='${contextPath}/syllabus/syllabusForm.do'
		}
		else{
			alert("로그인 후 시도해주세요.");
		}*/
	}
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$.extend( $.fn.dataTable.defaults, {
	    ordering:  false
	} );

	$('#table_id').DataTable({
		 dom : 'lBfrtip',
	      buttons: ['excel'],
	      
	      columns : [
		   		{ "width": "2%" },
		   		{ "width": "6%" },
		    	{ "width": "20%" },
		    	null,
		    	{ "width": "10%" },
		    	{ "width": "10%" },
		    	{ "width": "20%" }
		    
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
<body>
	<div class="container">

		<div class="pageIntro">강의계획서</div>

		<table id="table_id" class="table_" style="border-bottom: 1px solid #96988f;">
			<thead>
				<tr align="center">
					<td><input type="checkbox" name="check-all"
						onclick='selectAll(this)' /></td>
					<td><b>번호</b></td>
					<td><b>분류</b></td>
					<td><b>강의명</b></td>
					<td><b>교육일수</b></td>
					<td><b>교육시간</b></td>
            		  <td><b>설문</b></td>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="syllabus" items="${syllabusList}">
					<tr class="item">
						<td><input type="checkbox" name="ab"
							value="${syllabus.syllabusID}" onclick='checkSelectAll(this)' /></td>
						<td>${syllabus.syllabusID}</td>
						<td>[${syllabus.syllabusCategory1}>
							${syllabus.syllabusCategory2}]</td>
						<td class="name"><a
							href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">${syllabus.syllabusName}</a></td>
						<td>${syllabus.syllabusTotalDays}</td>
						<td>${syllabus.syllabusTotalTime}</td>
                  <c:if test="${syllabus.courseVO.questionYN eq 'N'}">
								<td><a
									href="${contextPath}/survey/writeSurveyForm.do?courseID=${syllabus.courseVO.courseID}&syllabusID=${syllabus.syllabusID}">설문생성</a></td>
							</c:if>
							<c:if test="${syllabus.courseVO.questionYN eq 'Y'}">
								<td style="text-align: center; color: red;"><a style="color:red;"
									href="${contextPath}/survey/surveyInfo.do?courseID=${syllabus.courseVO.courseID}">설문생성완료</a></td>
							</c:if>
							<c:if test="${syllabus.courseVO.questionYN eq NULL}">
								<td style="text-align: center; color: red;">COURSE미등록</td>
							</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="margin-top: 50px;">
			<button class="btn btn-outline-danger" type="button"
				onClick="deleteCheck()">선택강의 삭제</button>
			<button class="btn btn-outline-danger" type="button"
				onClick="register()">강의계획서 등록</button>
		</div>

		<!--  </form> -->

	</div>

</body>
</html>