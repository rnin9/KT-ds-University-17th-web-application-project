<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<meta charset="UTF-8">
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<script>
	$.ajax({
		url : "${contextPath}/survey/infoGraph.do",
		type : 'GET',
		traditional : true,
		data : {
			courseID : "${surveyVO.courseID}"
		},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');	// 이미지 보여주기 처리
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none'); // 이미지 감추기 처리
	    },
		success : function(result) {
			google.charts.load('current', {
				packages : [ 'corechart', 'line' ]
			});
			google.charts.setOnLoadCallback(drawBasic);
			google.charts.setOnLoadCallback(drawBasic2);
			google.charts.setOnLoadCallback(drawBasic3);
			google.charts.setOnLoadCallback(drawBasic4);
			google.charts.setOnLoadCallback(drawBasic5);
			google.charts.setOnLoadCallback(drawBasic6);
			google.charts.setOnLoadCallback(drawBasic7);
			google.charts.setOnLoadCallback(drawBasic8);
			google.charts.setOnLoadCallback(drawBasic9);
			google.charts.setOnLoadCallback(drawBasic10);
			google.charts.setOnLoadCallback(drawBasic11);
			google.charts.setOnLoadCallback(drawBasic12);
			google.charts.setOnLoadCallback(drawBasic13);
			google.charts.setOnLoadCallback(drawBasic14);
			google.charts.setOnLoadCallback(drawBasic15);
			google.charts.setOnLoadCallback(drawBasic16);
			google.charts.setOnLoadCallback(drawBasic17);
			
			function drawBasic() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas.forEach((row)=> {
					data.addRow([ row.answer1, row.count1 ]);
				});

				var options = {
				          title: '${surveyVO.q1}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				      
				          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div'));

				chart.draw(data, options);
			}
			function drawBasic2() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas2.forEach((row)=> {
					data.addRow([ row.answer2, row.count2 ]);
				});

				var options = {
				          title: '${surveyVO.q2}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				         
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div2'));

				chart.draw(data, options);
			}
			function drawBasic3() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas3.forEach((row)=> {
					data.addRow([ row.answer3, row.count3 ]);
				});

				var options = {
				          title: '${surveyVO.q3}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				       
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div3'));

				chart.draw(data, options);
			}
			function drawBasic4() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas4.forEach((row)=> {
					data.addRow([ row.answer4, row.count4 ]);
				});

				var options = {
				          title: '${surveyVO.q4}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				       
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div4'));

				chart.draw(data, options);
			}
			function drawBasic5() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas5.forEach((row)=> {
					data.addRow([ row.answer5, row.count5 ]);
				});

				var options = {
				          title: '${surveyVO.q5}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				       
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div5'));

				chart.draw(data, options);
			}
			function drawBasic6() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas6.forEach((row)=> {
					data.addRow([ row.answer6, row.count6 ]);
				});

				var options = {
				          title: '${surveyVO.q6}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				      
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div6'));

				chart.draw(data, options);
			}
			function drawBasic7() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas7.forEach((row)=> {
					data.addRow([ row.answer7, row.count7 ]);
				});

				var options = {
				          title: '${surveyVO.q7}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				         
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div7'));

				chart.draw(data, options);
			}
			function drawBasic8() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas8.forEach((row)=> {
					data.addRow([ row.answer8, row.count8 ]);
				});

				var options = {
				          title: '${surveyVO.q8}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				      
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div8'));

				chart.draw(data, options);
			}
			function drawBasic9() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas9.forEach((row)=> {
					data.addRow([ row.answer9, row.count9 ]);
				});

				var options = {
				          title: '${surveyVO.q9}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				        
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div9'));

				chart.draw(data, options);
			}
			function drawBasic10() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas10.forEach((row)=> {
					data.addRow([ row.answer10, row.count10 ]);
				});

				var options = {
				          title: '${surveyVO.q10}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				        
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div10'));

				chart.draw(data, options);
			}
			function drawBasic11() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas11.forEach((row)=> {
					data.addRow([ row.answer11, row.count11 ]);
				});

				var options = {
				          title: '${surveyVO.q11}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				        
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div11'));

				chart.draw(data, options);
			}
			function drawBasic12() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas12.forEach((row)=> {
					data.addRow([ row.answer12, row.count12 ]);
				});

				var options = {
				          title: '${surveyVO.q12}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				       
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div12'));

				chart.draw(data, options);
			}
			function drawBasic13() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas13.forEach((row)=> {
					data.addRow([ row.answer13, row.count13 ]);
				});

				var options = {
				          title: '${surveyVO.q13}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				       
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div13'));

				chart.draw(data, options);
			}
			function drawBasic14() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas14.forEach((row)=> {
					data.addRow([ row.answer14, row.count14 ]);
				});

				var options = {
				          title: '${surveyVO.q14}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				    
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div14'));

				chart.draw(data, options);
			}
			function drawBasic15() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas15.forEach((row)=> {
					data.addRow([ row.answer15, row.count15 ]);
				});

				var options = {
				          title: '${surveyVO.q15}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				       
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div15'));

				chart.draw(data, options);
			}
			function drawBasic16() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas16.forEach((row)=> {
					data.addRow([ row.answer16, row.count16 ]);
				});

				var options = {
				          title: '${surveyVO.q15}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				        
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div16'));

				chart.draw(data, options);
			}
			
			function drawBasic17() {

				 var data = google.visualization.arrayToDataTable([
					 ['Task', 'Hours per Day'],
			          ['Work',     0]
			        ]);

				result.datas17.forEach((row)=> {
					data.addRow([ row.answer17, row.count17 ]);
				});

				var options = {
				          title: '${surveyVO.q15}',
				          pieHole: 0.4,
				          sliceVisibilityThreshold: .2,
				       
					          chartArea:{left:40,top:60,width:'100%',height:'100%'},
				          titleTextStyle : {
								fontSize : 12, // or the number you want
								fontName : 'Noto Sans KR',
								bold : true,
								italic : false
							},
				        };

				var chart = new google.visualization.PieChart(document
						.getElementById('chart_div17'));

				chart.draw(data, options);
			}
			

		},
		error : function(data) {
			console.log("fail");
		}
	});
</script>
<script>
$(function() { 
	
	$("#firstNav").click(function(){
		$("#sidebar-left").css("height","9200px");
	});
	
	
	$("#secondNav").click(function(){
		$("#sidebar-left").css("height","3540px");
	});
	
	
});
</script>



<style>
.container {
	width: 40%;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: lavender;
	border-radius: 8px;
	padding-bottom: 12px;
}

.selectRadio {
	transition: background-color 200ms cubic-bezier(0.0, 0.0, 0.2, 1);
	background-color: #fff;
	border: 1px solid #dadce0;
	border-radius: 8px;
	margin-bottom: 12px;
	padding: 24px;
	page-break-inside: avoid;
	word-wrap: break-word;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.bg-primary {
	background-color: white !important;
}

#container1 { /* 이름 밑에 속성들을 감싸서 적용 */
	margin: 39px;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
	border: 1.01px solid #dee2e6;
	background-color: white;
	position: relative;
	border-radius: 8px;
	padding: 18px;
	hover: initial;
	opacity: 0.9;
}

.containainer2 {
	width: 40%;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: lavender;
	border-radius: 8px;
	padding-bottom: 12px;
}

#container3 { /* 이름 밑에 속성들을 감싸서 적용 */
	margin: 39px;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
	border: 1.01px solid #dee2e6;
	background-color: white;
	position: relative;
	border-radius: 8px;
	padding: 18px;
	hover: initial;
	opacity: 0.9;
}

.detailTable {
	margin-top: 50px;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.bg-primary {
	background-color: white !important;
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

.chart {
	width: 300px;
	height: 300px;
	transform: translate(70px, 10px);
}

.btnCon:target .tabCon {
	display: block;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

input {
	display: none;
}

label {
	display: inline-block;
	padding: 15px 25px;
	font-weight: 600;
	color: #bbb;
	border: 1px solid transparent;
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

input:checked+label {
	color: #555;
	border-top: 2px solid red;
}

#cho:checked ~ #cho, #dain:checked ~ #dain, #mspak96:checked ~ #mspak96,
	#sexylee:checked ~ #sexylee, #yeohu:checked ~ #yeohu, #rhkd:checked ~
	#rhkd, #kirstybang:checked ~ #kirstybang, #eunjinfizz:checked ~
	#eunjinfizz, #kang:checked ~ #kang, #dain:checked ~ #dain {
	display: block;
}

</style>

<title>회원 정보 목록창</title>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<nav style="margin-top: 10px;">
				<ul class="nav nav-tabs" id="myTab" role="tablist">

					<li class="nav-item"><a id="firstNav" href="#nav-home"
						data-toggle="tab" class="nav-link active">요약</a></li>

					<li class="nav-item"><a id="secondNav" href="#nav-profile"
						data-toggle="tab" class="nav-link">개별 보기</a></li>
				</ul>
			</nav>
			<div class="pageIntro">설문조사</div>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<div class="container">

						<br>
						<h3 style="text-align: center; margin-top: 10px;">${surveyVO.syllabusVO.syllabusName}</h3>


						<div id="container1">
							<h5>1.${surveyVO.q1}</h5>
							<h6>총 응답자:${detailVO.count1}</h6>
							<div id="chart_div" class="chart"></div>
						</div>



						<div id="container1">
							<h5>2.${surveyVO.q2}</h5>
							<h6>총 응답자:${detailVO.count2}</h6>
							<div id="chart_div2" class="chart"></div>
						</div>



						<div id="container1">
							<h5>3.${surveyVO.q3}</h5>
							<h6>총 응답자:${detailVO.count3}</h6>
							<div id="chart_div3" class="chart"></div>
						</div>


						<div id="container1">
							<h5>4.${surveyVO.q4}</h5>
							<h6>총 응답자:${detailVO.count4}</h6>
							<div id="chart_div4" class="chart"></div>
						</div>



						<div id="container1">
							<h5>5.${surveyVO.q5}</h5>
							<h6>총 응답자:${detailVO.count5}</h6>
							<div id="chart_div5" class="chart"></div>
						</div>



						<div id="container1">
							<h5>6.${surveyVO.q6}</h5>
							<h6>총 응답자:${detailVO.count6}</h6>
							<div id="chart_div6" class="chart"></div>
						</div>


						<div id="container1">
							<h5>7.${surveyVO.q7}</h5>
							<h6>총 응답자:${detailVO.count7}</h6>
							<div id="chart_div7" class="chart"></div>
						</div>



						<div id="container1">
							<h5>8.${surveyVO.q8}</h5>
							<h6>총 응답자:${detailVO.count8}</h6>
							<div id="chart_div8" class="chart"></div>
						</div>



						<div id="container1">
							<h5>9.${surveyVO.q9}</h5>
							<h6>총 응답자:${detailVO.count9}</h6>
							<div id="chart_div9" class="chart"></div>
						</div>



						<div id="container1">
							<h5>10.${surveyVO.q10}</h5>
							<h6>총 응답자:${detailVO.count10}</h6>
							<div id="chart_div10" class="chart"></div>
						</div>



						<div id="container1">
							<h5>11.${surveyVO.q11}</h5>
							<h6>총 응답자:${detailVO.count11}</h6>
							<div id="chart_div11" class="chart"></div>
						</div>



						<div id="container1">
							<h5>12.${surveyVO.q12}</h5>
							<h6>총 응답자:${detailVO.count12}</h6>
							<div id="chart_div12" class="chart"></div>
						</div>



						<div id="container1">
							<h5>13.${surveyVO.q13}</h5>
							<h6>총 응답자:${detailVO.count13}</h6>
							<div id="chart_div13" class="chart"></div>
						</div>



						<div id="container1">
							<h5>14.${surveyVO.q14}</h5>
							<h6>총 응답자:${detailVO.count14}</h6>
							<div id="chart_div14" class="chart"></div>
						</div>



						<div id="container1">
							<h5>15.${surveyVO.q15}</h5>
							<h6>총 응답자:${detailVO.count15}</h6>
							<div id="chart_div15" class="chart"></div>
						</div>


						<div id="container1">
							<h5>16.본 교육과 나의 업무 연관 정도</h5>
							<h6>총 응답자:${detailVO.count16}</h6>
							<div id="chart_div16" class="chart"></div>
						</div>


						<div id="container1">
							<h5>17.컨소시엄 교육과정을 알게 된 경로</h5>
							<h6>총 응답자:${detailVO.count17}</h6>
							<div id="chart_div17" class="chart"></div>
						</div>

						<div id="container1">
							<h5>18.본 과정의 좋았던 점</h5>
							<h6>총 응답자:${detailVO.count17}</h6>
							<table border="0" class="detailTable">
								<tr>
									<c:forEach var="detailList" items="${detailList}">
										<tr>
											<th>${detailList.userId}</th>
										</tr>
										<tr>
											<td>${detailList.answer18}</td>
										</tr>
									</c:forEach>
								</tr>
							</table>
						</div>

						<div id="container1">
							<h5>19.본 과정의 개선할 점</h5>
							<h6>총 응답자:${detailVO.count17}</h6>
							<table border="0" class="detailTable">
								<tr>
									<c:forEach var="detailList" items="${detailList}">
										<tr>
											<th>${detailList.userId}</th>
										</tr>
										<tr>
											<td>${detailList.answer19}</td>
										</tr>
									</c:forEach>
								</tr>
							</table>
						</div>


						<div id="container1">
							<h5>20.기타 하고 싶은 말</h5>
							<h6>총 응답자:${detailVO.count17}</h6>
							<table border="0" class="detailTable">
								<tr>
									<c:forEach var="detailList" items="${detailList}">
										<tr>
											<th>${detailList.userId}</th>
										</tr>
										<tr>
											<td>${detailList.answer20}</td>
										</tr>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<!-- 두번째영역 -->
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab" style="overflow: hidden;">

					<div class="container">
						<br>
						<h3 style="text-align: center; margin-top: 10px;">${surveyVO.syllabusVO.syllabusName}</h3>

						<c:forEach var="detailList" items="${detailList}">
							<input id="${detailList.userId}" type="radio" name="tabs"
								value="${detailList.userId}">
							<label for="${detailList.userId}">${detailList.userId}</label>
						</c:forEach>

						<c:forEach var="detailList" items="${detailList}">
							<section id="${detailList.userId}">
								<div id="container1">
									<h3>ID:${detailList.userId}</h3>
								</div>
								<div id="container1">
									<h5>1.${surveyVO.q1}</h5>
									<h6>${detailList.answer1}</h6>
								</div>
								<div id="container1">
									<h5>2.${surveyVO.q2}</h5>
									<h6>${detailList.answer2}</h6>
								</div>
								<div id="container1">
									<h5>3.${surveyVO.q3}</h5>
									<h6>${detailList.answer3}</h6>
								</div>
								<div id="container1">
									<h5>4.${surveyVO.q4}</h5>
									<h6>${detailList.answer4}</h6>
								</div>
								<div id="container1">
									<h5>5.${surveyVO.q5}</h5>
									<h6>${detailList.answer5}</h6>
								</div>
								<div id="container1">
									<h5>6.${surveyVO.q6}</h5>
									<h6>${detailList.answer6}</h6>
								</div>
								<div id="container1">
									<h5>7.${surveyVO.q7}</h5>
									<h6>${detailList.answer7}</h6>
								</div>
								<div id="container1">
									<h5>8.${surveyVO.q8}</h5>
									<h6>${detailList.answer8}</h6>
								</div>
								<div id="container1">
									<h5>9.${surveyVO.q9}</h5>
									<h6>${detailList.answer9}</h6>
								</div>
								<div id="container1">
									<h5>10.${surveyVO.q10}</h5>
									<h6>${detailList.answer10}</h6>
								</div>
								<div id="container1">
									<h5>11.${surveyVO.q11}</h5>
									<h6>${detailList.answer11}</h6>
								</div>
								<div id="container1">
									<h5>12.${surveyVO.q12}</h5>
									<h6>${detailList.answer12}</h6>
								</div>
								<div id="container1">
									<h5>13.${surveyVO.q13}</h5>
									<h6>${detailList.answer13}</h6>
								</div>
								<div id="container1">
									<h5>14.${surveyVO.q14}</h5>
									<h6>${detailList.answer14}</h6>
								</div>
								<div id="container1">
									<h5>15.${surveyVO.q15}</h5>
									<h6>${detailList.answer15}</h6>
								</div>
								<div id="container1">
									<h5>16.본 교육과 나의 업무 연관 정도</h5>
									<h6>${detailList.answer16}</h6>
								</div>
								<div id="container1">
									<h5>17.컨소시엄 교육과정을 알게 된 경로</h5>
									<h6>${detailList.answer17}</h6>
								</div>
								<div id="container1">
									<h5>18.본 과정의 좋았던 점</h5>
									<h6>${detailList.answer18}</h6>
								</div>
								<div id="container1">
									<h5>19.본 과정의 개선할 점</h5>
									<h6>${detailList.answer19}</h6>
								</div>
								<div id="container1">
									<h5>20.기타 하고 싶은 말</h5>
									<h6>${detailList.answer20}</h6>
								</div>
							</section>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


</body>
</html>
