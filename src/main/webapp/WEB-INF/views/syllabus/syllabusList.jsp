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
	font-family: 'Noto Sans KR', sans-serif;
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
		
		/*if (${isLogOn == true}){*/
			var url = "/springEx/syllabus/deleteCheck.do";
			var cnt = $("input[name='ab']:checked").length;
			var valueArr = new Array();
			$("input[name='ab']:checked").each(function(i){
				valueArr.push($(this).val());
			});
			if (cnt==0){
				Swal.fire("선택된 강의계획서가 없습니다.","","warning");
			}else{
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
						Swal.fire("선택한 강의계획서를 사용하는 강의가 있습니다.","","error");
						console.log("fail");
			        }
				})
			}
		/*}
		else{
			alert("로그인 후 시도해주세요.");
		}*/
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
	$('#table_id').DataTable({
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
<body>

	<div class="container">

		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a href="/springEx/syllabus/syllabusList.do">강의계획서
						관리</a></li>
			</ul>
		</div>
		<table class="table_" id="table_id">
			<thead>
				<tr align="center">
					<td><input type="checkbox" name="check-all"
						onclick='selectAll(this)' /></td>
					<td><b>번호</b></td>
					<td><b>분류</b></td>
					<td><b>강의명</b></td>
					<td><b>교육일수</b></td>
					<td><b>교육시간</b></td>
				</tr>
			</thead>

			<tbody id="ajaxTable">
				<c:forEach var="syllabus" items="${syllabusList}">
					<tr class="item">
						<td><input type="checkbox" name="ab"
							value="${syllabus.syllabusID}" onclick='checkSelectAll(this)' /></td>
						<td>${syllabus.syllabusID}</td>
						<td>${syllabus.syllabusCategory1}>
							${syllabus.syllabusCategory2}</td>
						<td class="name"><a
							href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">${syllabus.syllabusName}</a></td>
						<td>${syllabus.syllabusTotalDays}</td>
						<td>${syllabus.syllabusTotalTime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="margin-top: 50px; padding-bottom: 150px;">
			<button class="btn btn-outline-danger" type="button"
				onClick="deleteCheck()">선택강의 삭제</button>
			<button class="btn btn-outline-danger" type="button"
				onClick="register()">강의계획서 등록</button>
		</div>

		<!--  </form> -->

	</div>

</body>
</html>

