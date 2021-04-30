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
	href="${pageContext.request.contextPath}/resources/css/style2.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<style>
.display-none { /*감추기*/
	display: none;
}

.wrap-loading {
	transform: translateY(100px);
}

#chart_div text {
	transform: none;
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	$.ajax({
		url : "${contextPath}/partner/company/infoGraph.do",
		type : 'GET',
		traditional : true,
		data : {
			partnerLicenseNum : "${partner.partnerLicenseNum}"
		},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');	// 이미지 보여주기 처리
	    }

	    ,complete:function(){
	        $('.wrap-loading').addClass('display-none'); // 이미지 감추기 처리
	    },

		success : function(result) {
			google.charts.load('current', {
				packages : [ 'corechart', 'line' ]
			});
			google.charts.setOnLoadCallback(drawBasic);
			function drawBasic() {

				var data = new google.visualization.DataTable();
				data.addColumn('string', 'X');
				data.addColumn('number', '수료');
				data.addColumn('number', '미수료');

				result.datas.forEach((row)=> {
					data.addRow([ row.takeYear, row.takeY, row.takeN ]);
				});

				var options = {
					hAxis : {
						title : '연/월',
						titleTextStyle : {
							fontSize : 15, // or the number you want
							fontName : 'Noto Sans KR',
							bold : true,
							italic : false
						}
					},
					vAxis : {
						title : '인원(명)',
						titleTextStyle : {
							fontSize : 15, // or the number you want
							fontName : 'Noto Sans KR',
							bold : true,
							italic : false
						}
					}
				};

				var chart = new google.visualization.LineChart(document
						.getElementById('chart_div'));

				chart.draw(data, options);
			}

		},
		error : function(data) {
			console.log("fail");
		}
	});
</script>


</head>
<body>
	<div class="container"
		style="display: flex; flex-wrap: wrap; width: 75%; justify-content: space-around; flex-direction: column;">
		<c:choose>
			<c:when test="${partner.partnerName =='university'}">
				<div class="pageIntro" style="margin-bottom: 30px;">kt ds
					University</div>
			</c:when>
			<c:otherwise>
				<div class="pageIntro" style="margin-bottom: 30px;">회사 정보</div>
			</c:otherwise>
		</c:choose>

		<div>
			<div class="wrap-loading">
				<div>
					<img src="${contextPath}/resources/image/viewLoading.gif" />
				</div>
			</div>
			<div id="chart_div" style="box-shadow: 0px 6px 10px #777;"></div>
		</div>
		<table class="table_" style="width: 80%; margin-top: 5%;">
			<tr>
				<th>회사 이름</th>
				<td>${partner.partnerName}</td>
			</tr>
			<tr>
				<th>업종 · 업태</th>
				<td>${partner.partnerIndustryType}</td>
			</tr>
			<tr>
				<th>협약 상태</th>
				<td>${partner.partnerState}</td>
			</tr>
			<tr>
				<th>회사 주소</th>
				<td>${partner.partnerAddress}</td>
			</tr>
			<tr>
				<th>회사 전화번호</th>
				<td>${partner.partnerPhoneNumber}</td>
			</tr>
			<tr>
				<th>인원 규모</th>
				<td>${partner.partnerHeadCount}</td>
			</tr>
			<tr>
				<th>회사 홈페이지</th>
				<td><a href="https://${partner.partnerURL}" target="_blank">${partner.partnerURL}</a></td>
			</tr>
		</table>
	</div>
</body>
</html>