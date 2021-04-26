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
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>


<style>
</style>


<body>

	<div class="container">
		<!-- 홈>강의관리>수강관리 -->
		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="/springEx/courseTake/courseApplyList.do">강의관리</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="/springEx/courseTake/courseApplyList.do">수강관리</a></li>
			</ul>
		</div>




		<!-- 검색박스 -->
		<!-- <div class="well-searchbox">
			<form class="form-horizontal" role="form">

				<div class="form-group">
					<div class="searchSubject">
						<label class="searchTitle">강의명</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="강의명">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="searchSubject">
						<label class="searchTitle">수강연월</label>
						<div class="col-md-8">
							<div id="sandbox-container">
								<div class="input-group date" style="width: 88%;">
									<input type="text" class="form-control" placeholder="연/월 입력">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="searchSubject">
						<label class="searchTitle">소속회사</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="소속회사">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="searchSubject">
						<label class="searchTitle">이름</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="이름">
						</div>
					</div>

					<div class="col-sm-offset-4 col-sm-5"
						style="display: inline-block; text-aglin: center;">
						<button type="submit" class="btn button_search"
							style="margin-top: 10px;">검색</button>
					</div>
				</div>
			</form>
		</div> -->

		<div class="pageIntro">수강관리</div>


		<!-- 테이블(표, 리스트) -->
		<table class="table_" id="myTable"">
			<thead>
				<tr align="center">
					<td><input type="checkbox" name="check-all"
						onclick='selectAll(this)' /></td>
					<td><b>아이디</b></td>
					<td><b>이름</b></td>
					<td><b>전화번호</b></td>
					<td><b>이메일</b></td>
					<td><b>소속회사</b></td>
					<td><b>강의명</b></td>
					<td><b>신청일</b></td>
					<td><b>수강상태</b></td>
					<!-- <td><b>수료증</b></td> -->
				</tr>
			</thead>

			<tbody id="ajaxTable">
				<c:forEach var="courseTake" items="${courseApplyList}">
					<tr align="center">
						<td><input type="checkbox" name="ab"
							value="${courseTake.userID} ${courseTake.courseID}"
							onclick='checkSelectAll(this)' /></td>
						<td>${courseTake.userID}</td>
						<td>${courseTake.memberVO.userName}</td>
						<td>${courseTake.memberVO.userPhoneNumber}</td>
						<td>${courseTake.memberVO.userEmail}</td>
						<td>${courseTake.memberVO.userCompany}</td>
						<td>${courseTake.syllabusVO.syllabusName}</td>
						<td>${courseTake.courseTake_ApplyDate}</td>
						<c:choose>
							<c:when test="${courseTake.courseTake_State eq '수료'}">
								<td style="display: flex; text-align: center; margin-left: 10%;">${courseTake.courseTake_State}
									<form name="formForCertificate" action="certificate.jsp"
										method="post">
										<input type=text name="userName"
											value="${courseTake.memberVO.userName}"
											style="display: none;" /> <input type=text name="courseName"
											value="${courseTake.syllabusVO.syllabusName}"
											style="display: none;" /> 
											<input type=text name="userCompany"
											value="${courseTake.memberVO.userCompany}"
											style="display: none;" /> <input type=text
											name="courseStart" value="${courseTake.courseVO.courseStart}"
											style="display: none;" /> <input type=text name="courseEnd"
											value="${courseTake.courseVO.courseEnd}" /> <input type=text
											name="syllabusTotalTime"
											value="${courseTake.syllabusVO.syllabusTotalTime}"
											style="display: none;" /> <input type=text
											name="userBirthday" value="${courseTake.memberVO.birth}" />
										<input type="image"
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
		<div style="margin-top: 40px; padding-bottom: 150px;">
			<button class="btn button_bottom" type="button"
				onClick="deleteCheck();">삭제</button>
			<button class="btn button_bottom" type="button"
				onClick="completionCheck();">수료완료</button>
			<button class="btn button_bottom" type="button"
				onClick="consentCancelCheck();">승인대기</button>
			<button class="btn button_bottom" type="button"
				onClick="consentCheck();">신청승인</button>
		</div>


	</div>

</body>

<script type="text/javascript">
$(document).ready(function(){
	$('#myTable').DataTable({

	
		language: {
			info : '총 _TOTAL_ 개의 결과 중 _START_번 부터 _END_번',
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
	//달력picker, 키보드로도 입력가능[ex)2021/4], format: "mm/yyyy" 등 으로 변경가능 
	$(document).ready(function() {
		$('#sandbox-container input').datepicker({
			format : "yyyy/mm",
			startView : 1,
			minViewMode : 1,
			language : "ko",
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true
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
		var url = "/springEx/courseTake/updateConsentCheck.do";
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
  var status = "width=500px, height=600px, status=no, menubar=no, toolbar=no, resizable=no"; 
  window.open('${pageContext.request.contextPath}/courseTake/certificate.do', title,status); //popup 열기
  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다. 
  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
  frm.method = "post";
  frm.submit();
  }
</script>
</html>