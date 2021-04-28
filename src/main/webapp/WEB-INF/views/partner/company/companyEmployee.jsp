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

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">


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
<!--   $('#myTable tfoot th').each( function () {
              var title = $(this).text();
              $(this).html( '<input type="text" placeholder="'+title+'" />' );
          } );
       
       var table = $('#myTable').DataTable({
          
         initComplete: function () {
               // Apply the search
               this.api().columns().every( function () {
                   var that = this;
    
                   $( 'input', this.footer() ).on( 'keyup change clear', function () {
                       if ( that.search() !== this.value ) {
                           that
                               .search( this.value )
                               .draw();
                       }
                   } );
               } );
           },  -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').DataTable({

			dom : 'lBfrtip',
			buttons : [ 'excel' ],
			language : {
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
				search : '',
				sSearchPlaceholder : '통합 검색',

			}

		});
	});
</script>

</head>
<body>
	<div class="container"
		style="float: left; width: 75%; padding-bottom: 200px; margin-left: 5%;">
		<h2>직원관리페이지</h2>
		<table id="myTable">
			<thead>
				<tr>
					<td><b>이름</b></td>
					<td><b>생년월일</b></td>
					<td><b>과정명</b></td>
					<td><b>이수시간</b></td>
					<td><b>시작날짜</b></td>
					<td><b>종료날짜</b></td>
					<td><b>수료일</b></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eList" items="${companyEmployeeList}">
					<tr class="item">
						<td>${eList.memberVO.userName}</td>
						<td>${eList.memberVO.toCharBirth}</td>
						<td>${eList.syllabusVO.syllabusName}</td>
						<td>${eList.syllabusVO.syllabusTotalTime}</td>
						<td>${eList.courseVO.courseStart}</td>
						<td>${eList.courseVO.courseEnd}</td>
						<c:choose>
							<c:when test="${eList.courseTake_CompleteDate == null}">
								<td style="color: red;">미수료</td>
							</c:when>
							<c:otherwise>
								<td>${eList.courseTake_CompleteDate}</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
			<!-- <tfoot>
				<tr>
					<th>이름</th>
					<th>휴대폰</th>
					<th>이메일</th>
					<th>과정 명</th>
					<th>시작</th>
					<th>종료</th>
					<th>수료일</th>
				</tr>
			</tfoot> -->
		</table>
	</div>





</body>
</html>