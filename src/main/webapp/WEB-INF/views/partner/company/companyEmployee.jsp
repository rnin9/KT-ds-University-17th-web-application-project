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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<!-- <link id="bsdp-css"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
-->
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

<script type="text/javascript">
	$(document).ready(function() {
		 $('#myTable tfoot th').each( function () {
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
	        },
	        language : {
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
				search : '',
				sSearchPlaceholder : '통합 검색',

			}

		});
	});
</script>



</head>
<body>
	<div class="container" style="float:left; transform:translateY(10%);">
		<h2>직원관리페이지</h2>
		<table id="myTable">
			<thead>
				<tr>
					<td><b>아이디</b></td>
					<td><b>이름</b></td>
					<td><b>전화번호</b></td>
					<td><b>이메일</b></td>
					<td><b>과정명</b></td>
					<td><b>이수일</b></td>
				</tr>
			</thead>
			<tbody>
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
			<tfoot>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>휴대폰</th>
                <th>이메일</th>
                <th>과정 명</th>
                <th>Salary</th>
            </tr>
        </tfoot>
		</table>
	</div>





</body>
</html>