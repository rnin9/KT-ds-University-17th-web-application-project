<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
String survey_Title1 = request.getParameter("survey_Title1");
String survey_Title2 = request.getParameter("survey_Title2");
String survey_Title = survey_Title1 + survey_Title2;
request.setAttribute("survey_Title", survey_Title);
%>

<!doctype html>
<html>
<head>
<style>
.cursor_test {
	cursor: pointer;
}
</style>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/modalstyle.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%-- <%
String surveyTitle1 = request.getParameter("survey_Title1");
String surveyTitle2 = request.getParameter("survey_Title2");
String surveyTitle = surveyTitle1 + surveyTitle2;
request.getParameter("survey_Title");
%> --%>
</head>
<body>
	<div class="container">

		<%-- 
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-area mr-1"></i> Area Chart Example(onclick시
				AreaChart생성 ajax)
			</div>
			<div class="card-body">
				<canvas id="myAreaChart" width="100%" height="40"></canvas>
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-bar mr-1"></i> Bar Chart Example(onclick시
				BarChart생성 ajax)
			</div>
			<div class="card-body">
				<canvas id="canvas" width="100%" height="40"></canvas>
			</div>
		</div> --%>

		<div class="card mb-4">
			<div class="card-header">

				<i class="fa fa-table mr-1"></i> Survey List
			</div>
				<a class="navbar-brand2" href="${contextPath}/main.do"><img
						src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
						alt="로고" /></a>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="table_course" width="100%"
						border="1" cellspacing="0">
						<thead>
							<tr>
								<th>surveyId</th>
								<th>SurveyTitle</th>
								<th>Start date</th>
								<th>detail</th>
								<th>delete</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>surveyId</th>
								<th>SurveyTitle</th>
								<th>Start date</th>
								<th>detail</th>
								<th>delete</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="survey" items="${surveyList}">
								<tr>
									<td>${survey.survey_Id}</td>
									<td>${survey.survey_Mem} ${survey.survey_Title}</td>
									<td>${survey.writeDate}</td>
									<td><a
										href="${contextPath}/survey/survey2Form.do?surveyId=${survey.survey_Id}">상세</a></td>
									<td><a
										href='${contextPath}/survey/removeSurvey.do?survey_Id=${survey.survey_Id}'>삭제</a></td>
								</tr>
						
								<%-- <tr>
								<td>1</td>
								<td class="cursor_test" onclick="location.href='${contextPath}/survey/survey2Form.do?surveyTitle=${survey.surveyTitle}'">웹 어플리케이션 전문가 양성과정</td>
								<td>2011/04/25</td>
								<td><a href="${contextPath}/survey/survey2Form.do">상세</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td>인공지능 전문가 양성과정</td>

								<td>2011/04/25</td>
								<td><a href="#">상세</a></td>
							</tr>
							<tr>
								<td>3</td>
								<td>SQL 전문가 양성과정</td>

								<td>2011/04/25</td>
								<td><a href="#">상세</a></td>
							</tr>
							<tr>
								<td>4</td>
								<td>웹 어플리케이션 전문가 양성과정</td>

								<td>2011/04/25</td>
								<td><a href="#">상세</a></td>
							</tr>
							<tr>
								<td>5</td>
								<td>파이썬 전문가 양성과정</td>

								<td>2011/04/25</td>
								<td><a href="#">상세</a></td>
							</tr>
							<tr>
								<td>6</td>
								<td>웹 어플리케이션 전문가 양성과정</td>

								<td>2011/04/25</td>
								<td><a href="#">상세</a></td>
							</tr> --%>
							</c:forEach>

						</tbody>
					</table>
					<br>
					<button type="button"
						style="font-size: 1.05em; text-align: right; font-weight: bolder"
						class="btn btn-primary" data-toggle="modal" data-target="#myModal">작성하기</button>

					<!-- Modal-포트스캔 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">

						<div class="modal-dialog">

							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">설문조사</h4>
								</div>
								<form action="${contextPath}/survey/addSurvey.do" method="POST">
									<div class="modal-body">
										<table id="modalTable">
											<tr>
												<th>surveyTitle</th>
												<th><select id="description" name="survey_Mem"
													onchange="alert_select_value(this);">
														<option value="1기" name="survey_Mem">1기</option>
														<option value="2기" name="survey_Mem">2기</option>
														<option value="3기" name="survey_Mem">3기</option>
														<option value="4기" name="survey_Mem">4기</option>
														<option value="5기" name="survey_Mem">5기</option>
														<option value="6기" name="survey_Mem">6기</option>
														<option value="7기" name="survey_Mem">7기</option>
														<option value="8기" name="survey_Mem">8기</option>
														<option value="9기" name="survey_Mem">9기</option>
														<option value="10기" name="survey_Mem">10기</option>
														<option value="11기" name="survey_Mem">11기</option>
														<option value="12기" name="survey_Mem">12기</option>
														<option value="13기" name="survey_Mem">13기</option>
														<option value="14기" name="survey_Mem">14기</option>
														<option value="15기" name="survey_Mem">15기</option>
														<option value="16기" name="survey_Mem">16기</option>
														<option value="17기" name="survey_Mem">17기</option>
														<option value="18기" name="survey_Mem">18기</option>
														<option value="19기" name="survey_Mem">19기</option>
														<option value="20기" name="survey_Mem">20기</option>
														<option value="21기" name="survey_Mem">21기</option>
														<option value="22기" name="survey_Mem">22기</option>
														<option value="23기" name="survey_Mem">23기</option>
														<option value="24기" name="survey_Mem">24기</option>
														<option value="25기" name="survey_Mem">25기</option>
														<option value="26기" name="survey_Mem">26기</option>
														<option value="27기" name="survey_Mem">27기</option>
														<option value="28기" name="survey_Mem">28기</option>
														<option value="29기" name="survey_Mem">29기</option>
														<option value="30기" name="survey_Mem">30기</option>
														<option value="31기" name="survey_Mem">31기</option>

												</select></th>
												<th><select id="description" name="survey_Title"
													onchange="alert_select_value(this);">
														<option value=" 웹 어플리케이션 전문가 양성과정" name="survey_Title">웹
															어플리케이션 전문가 양양성과정</option>
														<option value=" 인공지능 전문가 양성과정" name="survey_Title">인공지능
															전문가 양성과정</option>
														<option value=" SQL 전문가 양성과정" name="survey_Title">SQL
															전문가 양성과정</option>
														<option value=" 파이썬 전문가 양성과정" name="survey_Title">파이썬
															전문가 양성과정</option>
												</select></th>

											</tr>
										</table>



									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">목록생성</button>
									</div>
								</form>
							</div>
						</div>

						<!--로딩바-->
						<div id="loading">
							<img src="<c:url value='/resources/image/viewLoading.gif'/>"
								alt="loading">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<%-- 	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script> --%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/demo/datatables-demo.js"></script>


</body>
</html>