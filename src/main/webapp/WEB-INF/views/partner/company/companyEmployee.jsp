<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.partnerInfo>dl>dt {
	float: left;
}

.empInfo {
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	font-size: 25px;
	text-align: left;
	width: 50%;
}
</style>

<script>
	$(document).ready(function() {
		$('#date input').datepicker({
			format : "yymmdd",
			language : "ko",
			startView : 2,
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true
		});
	});
</script>

<script>
//10,20,30개씩 selectBox 클릭 이벤트
function changeSelectBox(currentPage, cntPerPage, pageSize){
    var selectValue = $("#cntSelectBox").children("option:selected").val();
    movePage(currentPage, selectValue, pageSize);
    
}
 
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
	if(sessionStorage.getItem('search') === true ){
		var url = "${pageContext.request.contextPath}/partner/company/companyEmployee.do?partnerLicenseNum=${partner.partnerLicenseNum}";
	    url = url + "&userName=${userName}&syllabusName=${syllName}&courseStartDate=${startDate}&completionDate=${completionDate}"
		url = url + "&currentPage="+currentPage;
	    url = url + "&cntPerPage="+cntPerPage;
	    url = url + "&pageSize="+pageSize;
		}
	else {
		 var url = "${pageContext.request.contextPath}/partner/company/companyEmployee.do?partnerLicenseNum=${partner.partnerLicenseNum}";
		    url = url + "&currentPage="+currentPage;
		    url = url + "&cntPerPage="+cntPerPage;
		    url = url + "&pageSize="+pageSize;
	}
    location.href=url;
}

function handleSearch(){
	sessionStorage.setItem('search', true);
}
 
</script>



</head>
<body>

	<div class="container">
		<h2>직원관리페이지</h2>
		<div class="well-searchbox" style="display: flex;">
			<form class="form-horizontal" role="form" action="${contextPath}/partner/company/searchEmployee.do"
			style="width: 80%;">
				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">강좌명</label>
						<div class="col-md-8">
							<input type="text" id="syllabusName" name="syllabusName" class="form-control"
								onKeyPress="JavaScript:enter();" placeholder="일부 검색 가능">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">수강시작일</label>
						<div id="date" class="col-md-8">
							<input type="text" name="courseStartDate" id="courseStartDate"
								class="form-control" onKeyPress="JavaScript:enter();"
								placeholder="수강시작일 기준을 설정하세요">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">수료일</label>
						<div id="date" class="col-md-8">
							<input type="text" name="completionDate" id="completionDate"
								class="form-control" onKeyPress="JavaScript:enter();"
								placeholder="수료일 기준을 지정하세요">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="serarchSubject">
						<label class="searchTitle">이름</label>
						<div class="col-md-8">
							<input type="text" id="userName" name="userName" class="form-control"
								onKeyPress="JavaScript:enter();" placeholder="일부 검색 가능">
						</div>
						<input type="text" style="display: none;" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-5"
						style="display: inline-block; text-aglin: center;">
						
						<input type="text" name="currentPage" value="${pagination.currentPage}" style="display:none;">
						<input type="text" name="cntPerPage" value="${pagination.cntPerPage}" style="display:none;">
						<input type="text" name="pageSize" value="${pagination.pageSize}" style="display:none;">
						<input type="text" name="partnerLicenseNum" value="${partner.partnerLicenseNum}" style="display:none;">
						
						<button type="submit" class="btn button_search"
							style="margin-top: 10px; onclick="handleSearch()">검색</button>
					</div>
				</div>
			</form>
			<div class="empInfo">
				<div style="border-left: 5px solid red; padding-left: 10px;">
					<span> 총 수강생 수 : ${userNum} 명</span>
				</div>
				<div style="border-left: 5px solid green; padding-left: 10px;">
					<span>수강 회원 수 : ${courseUserNum} 명</span>
				</div>
			</div>
		</div>

		<div class="bottom">
			<div class="bottom-left">
				<select id="cntSelectBox" name="cntSelectBox"
					onchange="changeSelectBox(${pagination.currentPage},${pagination.cntPerPage},${pagination.pageSize});"
					class="form-control" style="width: 100px;">
					<option value="10"
						<c:if test="${pagination.cntPerPage == '10'}">selected</c:if>>10개씩</option>
					<option value="20"
						<c:if test="${pagination.cntPerPage == '20'}">selected</c:if>>20개씩</option>
					<option value="30"
						<c:if test="${pagination.cntPerPage == '30'}">selected</c:if>>30개씩</option>
				</select>
			</div>
		</div>
		<table class="table_">

			<thead>
				<tr align="center">
					<td><b>아이디</b></td>
					<td><b>이름</b></td>
					<td><b>전화번호</b></td>
					<td><b>이메일</b></td>
					<td><b>과정명</b></td>
					<td><b>이수일</b></td>
				</tr>
			</thead>
			<tbody id="ajaxTable">
				<c:forEach var="eList" items="${companyEmployeeList}">
					<tr class="item">
						<td>${eList.memberVO.userId}</td>
						<td>${eList.memberVO.userName}</td>
						<td>${eList.memberVO.userPhoneNumber}</td>
						<td>${eList.memberVO.userEmail}</td>
						<td>${eList.syllabusVO.syllabusName}</td>
						<c:choose>
							<c:when test="${eList.courseTake_CompleteDate == null}">
								<td style="color: red;">미이수</td>
							</c:when>
							<c:otherwise>
								<td>${eList.courseTake_CompleteDate}</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!--paginate -->
	<div class="paginate">
		<div class="paging">
			<a class="direction prev" href="javascript:void(0);"
				onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
				&lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
				onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
				&lt; </a>

			<c:forEach begin="${pagination.firstPage}"
				end="${pagination.lastPage}" var="idx">
				<a
					style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
					href="javascript:void(0);"
					onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
						value="${idx}" /></a>
			</c:forEach>
			<a class="direction next" href="javascript:void(0);"
				onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
				&gt; </a> <a class="direction next" href="javascript:void(0);"
				onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
				&gt;&gt; </a>
		</div>
	</div>
	<!-- /paginate -->

</body>
</html>