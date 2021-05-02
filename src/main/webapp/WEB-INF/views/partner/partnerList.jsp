<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta charset="UTF-8">
<title>회사 관리</title>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">


<!--  <link rel="stylesheet" type="text/css"
   href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">-->

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<script type="text/javascript"
	
	src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css" />


<style>
.container {
	display: flex;
	flex-wrap: wrap;
	width: 80%;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 15%;
}
.line {
	height: 5px;
	border: none;
	background-color: rgba(190, 190, 190, 0.8);
}
form {
	margin: auto;
}
.well-searchbox label {
	color: #555;
	width: 20%;
	margin: 10px;
	text-align: right;
}
.serarchSubject {
	display: flex;
	flex-direction: row;
	width: 250px;
	float: right;
}
.subject {
	display: flex;
	flex-direction: row;
}
.col {
	font-size: 13px;
}
.dataTables_wrapper {
	margin-top: 30px;
	display: inline-block;
	width: 100%;
}
.button_approve {
	display: inline-block;
	margin-bottom: 0;
	font-weight: 400;
	text-align: center;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	white-space: nowrap;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
	color: #fff;
	background-color: #28a745;
	border-color: #28a745;
}
.form-control {
	width: 180px;
}
.pageNav {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	margin-top: 5%;
}
.informationNow {
	text-align: center;
}
.informationAll {
	text-align: center;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	margin-top: 5%;
	margin-bottom: -115px;
}
.card {
	height: 10%;
}
.cardContent1 {
	font-size: 26px;
	font-weight: 400;
	color: rgba(255, 255, 255, 0.7);
}
.cardContent2 {
	font-weight: bolder;
	font-size: 40px;
	color: rgba(255, 255, 255, 0.7);
}
.partnerStateNum {
	border-left: 10px solid red;
	height: 30%;
	width: auto;
	text-align: center;
	vertical-align: middle;
	text-shadow: 2px 2px 2px gray;
	font-size: 30px;
}
.status_cooperation {
	height: 30px;
	width: 77px;
	border-radius: 5px;
	background-color: #ee4035;
	line-height: 30px;
	color: rgba(255, 255, 255, 0.7);
}
.status_convention {
	height: 30px;
	width: 77px;
	border-radius: 5px;
	background-color: #0392cf;
	line-height: 30px;
	color: rgba(255, 255, 255, 0.7);
}
.status_ing {
	line-height: 30px;
	height: 30px;
	width: 77px;
	border-radius: 5px;
	background-color: #7bc043;
	color: rgba(255, 255, 255, 0.7);
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 3px;
	margin-top: 3px;
}
.status_not {
	height: 30px;
	width: 77px;
	border-radius: 5px;
	background-color: gray;
	line-height: 30px;
	color: rgba(255, 255, 255, 0.7);
}
button {
	float: right;
	margin-right: 10px;
}
.card {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}
.card:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}
.table_id {
	width: 80%;
}
.dataTables_wrapper {
	display: inline-block;
	width: 100%;
	margin-top: 30px;
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
<script type="text/javascript">
               var result = '${msg}';
               var name = '${partnerName}'
               
               if (result == 'modSuccess') {
            	   window.onload=function() {
                	   swal("수정 완료",(name + " 기업 수정 완료"),"success")
                	   
            	   }
               }else if (result == 'removeSuccess'){
            	   window.onload=function() {
            		   swal("삭제 완료",(name + " 기업 삭제 완료"),"success");
            	   }
               }else if (result == 'addSuccess'){
            	   window.onload=function() {
            		   swal("등록 완료",(name + " 기업 등록 완료"),"success");
            	   }
               }
        </script>

<!-- 회사명 검색 -->
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

<!-- 체크박스 모두 선색 -->
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

<!-- 체크박스로 삭제 -->
<script>
	function deleteCheck(){
		var url = "${contextPath}/partner/partnerCheck.do";
		var cnt = $("input[name='ab']:checked").length;
		var valueArr = new Array();
		$("input[name='ab']:checked").each(function(i){
			valueArr.push($(this).val());
		});
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
				valueArr : valueArr
			},
			success : function(data){
				console.log("success");
				/*window.location.reload();*/
				$("#container").load("${contextPath}/partner/partnerList.do");
			},
			error : function(data) { 
	            console.log("fail");
	        }
		});
	};
		
		
</script>
<script type="text/javascript">
$(document).ready(function(){
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

</head>
<body>
	<div class="container">

		<div class="pageIntro">협력사 관리</div>

		<div class="informationAll">
			<div class="card text-white" style="width: 17%;">
				<div class="card-body" style="background-color: #ee4035;">
					<div class="cardContent1">협력사</div>
					<div class="cardContent2">${numCooperation}</div>
				</div>
			</div>
			<div class="card text-white" style="width: 17%;">
				<div class="card-body" style="background-color: #0392cf;">
					<div class="cardContent1">협약사</div>
					<div class="cardContent2">${numConvention}</div>
				</div>
			</div>
			<!--  
        <div class="card text-white" style="width:17%; ">
        <div class="card-body" style="background-color: #7bc043; ">
            <div class="cardContent1" >협약 진행중</div>
             <div class="cardContent2"> ${numIng}</div>
        </div>
        </div>-->
			<div class="card text-white" style="width: 17%;">
				<div class="card-body" style="background-color: #7bc043;">
					<div class="cardContent1">협약서사본</div>
					<div class="cardContent2">${numIng}</div>
				</div>
			</div>

		</div>

		<div class="rightButtonGroup">

			<div>
				<div style="float: left;">협약 상태 구분:</div>
				<div style="float: left; color: red;">협력사</div>
				<div style="float: left;">,</div>
				<div style="float: left; color: blue;">협약사</div>
				<div style="float: left;">,</div>
				<div style="float: left; color: #7bc043;">협약서 사본</div>
				<div style="float: left;">,</div>
				<div style="float: left; color: #ffc107;">협약서 없음</div>
			</div>
		</div>


		<table class="table_" id="myTable">
			<thead>
				<tr>
					<th><input type="checkbox" name="check-all"
						onclick='selectAll(this)' /></th>
					<th><b>사업자 등록번호</b></th>
					<th><b>기업명</b></th>
					<th><b>담당자</b></th>
					<th><b>이메일</b></th>
					<th><b>전화번호</b></th>
					<th><b>등록/수정일</b></th>
					<td style="display:none"></td>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="partner" items="${partnerList}">
					<tr class="item" align="center">
						<td><input type="checkbox" name="ab"
							onclick='checkSelectAll(this)'
							value="${partner.partnerLicenseNum}" /></td>

						<td>${partner.partnerLicenseNum}</td>

						<td><c:choose>
								<c:when test="${partner.partnerState eq '협력사'}">
									<!-- 협력사면 빨간색바탕으로 출력 -->
									<div style="color: red; font-weight: bold;">
										<a
											onClick="location.href='${contextPath}/partner/detailInfoPartner.do?partnerLicenseNum=${partner.partnerLicenseNum}'"
											style="cursor: pointer;">${partner.partnerName}</a>
									</div>
								</c:when>
								<c:when test="${partner.partnerState eq '협약사'}">
									<!-- 협력사면 빨간색바탕으로 출력 -->
									<div style="color: blue; font-weight: bold;">
										<a
											onClick="location.href='${contextPath}/partner/detailInfoPartner.do?partnerLicenseNum=${partner.partnerLicenseNum}'"
											style="cursor: pointer;">${partner.partnerName}</a>
									</div>
								</c:when>
								<c:when test="${partner.partnerState eq '협약서사본'}">
									<!-- 협력사면 빨간색바탕으로 출력 -->
									<div style="color: #7bc043; font-weight: bold;">
										<a
											onClick="location.href='${contextPath}/partner/detailInfoPartner.do?partnerLicenseNum=${partner.partnerLicenseNum}'"
											style="cursor: pointer;">${partner.partnerName}</a>
									</div>
								</c:when>
								<c:when test="${partner.partnerState eq '협약서없음'}">
									<!-- 협력사면 빨간색바탕으로 출력 -->
									<div style="color: #ffc107; font-weight: bold;">
										<a
											onClick="location.href='${contextPath}/partner/detailInfoPartner.do?partnerLicenseNum=${partner.partnerLicenseNum}'"
											style="cursor: pointer;">${partner.partnerName}</a>
									</div>
								</c:when>


							</c:choose></td>
						<td>${partner.partnerCharger}</td>
						<td>${partner.partnerChargerEmail}</td>
						<td>${partner.partnerPhoneNumber}</td>
						<td>${partner.partnerRegisterDate}</td>
						<td style="display:none">${partner.partnerState}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="buttonGroups"
			style="margin-top: 50px; margin-bottom: 50px;">
			<button type="button" class="btn btn-outline-danger"
				onClick="deleteCheck();">삭제</button>
			<button type="button" class="btn btn-outline-danger"
				onClick="location.href='${contextPath}/partner/partnerForm.do'">등록</button>

		</div>
	</div>

	<script>
//10,20,30개씩 selectBox 클릭 이벤트
function changeSelectBox(currentPage, cntPerPage, pageSize){
    var selectValue = $("#cntSelectBox").children("option:selected").val();
    movePage(currentPage, selectValue, pageSize);
    
}

</script>
</body>

</html>
