<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<%
	String resumeID = request.getParameter("resumeID");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 작성</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css">
<script
	src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<style>
.sub_visual {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("${pageContext.request.contextPath}/resources/image/sub_visual/resume.jpg");
	border: 0;
	font-size: 32px;
	font-weight: 500;
	height: 190px;
	padding-top: 69px;
	background-position: 50% 50%;
	background-size: cover;
	background-repeat: no-repeat;
}

h3 {
	text-align: left;
	margin-bottom: 50px;
}

.main { /* 이름 밑에 속성들을 감싸서 적용 */
	height: auto;
	position: relative;
	text-align: left;
	border-bottom: 1px solid #eeeeee;
	padding-bottom: 40px;
	margin-bottom: 40px;
}

div.formtag { /* div 속 폼태그 전체 적용 */
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
	line-height: 15px;
}

.title { /* main 밑 속성값들의 이름 */
	margin: 40px 0px 0px 40px;
	display: inline-block;
	width: 100px;
	position: relative;
}

#title_area {
	display: inline-block;
	position: relative;
	margin-left: 5px
}

.headbutton {
	display: inline-block;
	background-color: tomato;
	border: 1px solid tomato;
	border-radius: 5px;
	width: 223px;
	height: 60px;
	text-align: center;
	color: white;
	line-height: 60px;
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 15px;
	font-weight: bolder;
	margin-left: -5px;
}



.none {
	display: inline-block;
	background-color: white;
	color: black;
	line-height: 46px;
	margin-top: 43px;
}

div input[type="text"] { /* input type text 태그 지정*/
	width: 210px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-right: 10px;
	line-height: 15px;
}

div select {
	width: 210px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-right: 10px;
	line-height: 15px;
}

#grade {
	width: 104px;
	margin-left: -11px;
	text-align: center;
}

#maxGrade {
	width: 86px;
	margin-left: 7px;
}

.list_field {
	height: 140px;
}

.fieldset {
	display: none;
	height: auto;
	position: relative;
}

.date {
	display: inline-block;
}

#lang {
	width: 120px;
	margin-left: -30px;
	margin-right: -10px;
}

#langtype {
	width: 135px;
}

#langscore {
	width: 106px;
	margin-left: -30px;
	margin-right: -9px;
}

#cer_add {
	float: right;
	position: absolute;
	right: 28px;
	margin-top: -15px;
}

#for_add {
	float: right;
	position: absolute;
	right: 28px;
	margin-top: -15px;
}

#del_button {
	position: absolute;
	right: 90px;
	margin-top: -15px;
}

.buttonGroups {
	width: 100%;
	margin-top: -10px;
}

.buttonGroups button {
	width: 90px;
	height: 35px;
	font-size: 1em;
	margin-bottom: 50px;
}

#btn1 {
	float: left;
}

#btn2 {
	float: right;
}
</style>

<!-- 날짜 관리 스크립트--> 
<script>
	$(document).ready(function() {
		$('#date input').datepicker({
			format : "yyyymmdd",
			language : "ko",
			startView : 2,
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true
		});
	});
</script> 

<script>


	function add_div(e, result) {
		var div = document.createElement('div');
		var obj = document.createElement('button');

		obj.innerHTML = "삭제";
		obj.setAttribute('id', 'del_button')

		div.innerHTML = document.getElementById(e).innerHTML;
		$(div).find('.clear').val('');


		if (e == 'certificate_list') { //자격증
			document.getElementById('cerfield').appendChild(obj);
			document.getElementById('cerfield').appendChild(div);
			
			document.getElementById('cerfield').style.display = "block";
			div.setAttribute('id', result); //제일 밖에 id
			div.setAttribute('name', "certificate_list");
			div.setAttribute('value',result);
			div.setAttribute('class','list_field certificateList');
			obj.setAttribute('class', 'btn ' + result);
			obj.setAttribute('name','certificate_remove');
			obj.setAttribute('onclick', 'remove_div(' + result + ')');

			$('.date input').each(function() {
				$(this).datepicker({
					format : "yyyymmdd",
					language : "ko",
					startView : 2,
					keyboardNavigation : false,
					forceParse : false,
					autoclose : true
				});
			});
	
		} else if (e == 'foreign_list') { //영어 자격증	
			document.getElementById('forfield').appendChild(obj);
			document.getElementById('forfield').appendChild(div);
			
			document.getElementById('forfield').style.display = "block";
			div.setAttribute('id', result); //제일 밖에 id
			div.setAttribute('name', "foreign_list");
			div.setAttribute('value',result);
			div.setAttribute('class','list_field foreignList');
			obj.setAttribute('class', 'btn ' + result);
			obj.setAttribute('name','foreign_remove');
			obj.setAttribute('onclick', 'remove_div(' + result + ')');
			
			$('.date input').each(function() {
				$(this).datepicker({
					format : "yyyymmdd",
					language : "ko",
					startView : 2,
					keyboardNavigation : false,
					forceParse : false,
					autoclose : true
				});
			});
		}

	}

	function remove_div(obj) { //obj = id값 500... or   300..... 
		$(`#` + obj).remove();//한칸 삭제
		$(`.` + obj).remove();//삭제버튼 삭제

	}
</script>

 <!-- 자격증, 외국어 자격증 insert 후에 받아온 SEQ값으로 재설정 --> 
 <script>
 		var ID ='<c:out value="${member.userId}"/>';
 		var resumeID = <%=resumeID%>;
 		data={}
 		data.ID = ID;
 		data.resumeID = resumeID;
			$(document).on('click','.addbutton',function(e) {
			if (this.id == "cer_add"){
			$.ajax({
					type : "POST",
					url : "${contextPath}/resume/page2InsertCertificate.do",
					contentType : "application/json; charset=UTF-8",
					data:JSON.stringify(data),
					success : function(result) {
					add_div("certificate_list",result);
					},
					error : function() {
					alert("실패")

					}
					});
			}
			else if (this.id == "for_add"){
			$.ajax({
					type : "POST",
					url : "${contextPath}/resume/page2InsertForeign.do",
					contentType : "application/json; charset=UTF-8",
					data:JSON.stringify(data),
					success : function(result) {
					add_div("foreign_list",result);
					},
					error : function() {
					alert("실패")

					}
					});
				
				
				
			}
					});
			
</script> 


 <!-- 삭제 버튼 누른 후에 받아온 id값을 넘겨주고 삭제--> 
 <script>
			$(document).on('click','#del_button',function(e) {
			var array = this.className.split(" ");
			var seqNum = array[1];
			if (this.name == "certificate_remove"){
			$.ajax({
					type : "POST",
					url : "${contextPath}/resume/page2DeleteCertificate.do",
					data : JSON.stringify(seqNum),
					contentType : "application/json; charset=UTF-8",
					success : function() {
						
					},
					error : function() {
						
					}
					});

			}
			else if (this.name == "foreign_remove"){
			$.ajax({
				type : "POST",
					url : "${contextPath}/resume/page2DeleteForeign.do",
					data : JSON.stringify(seqNum),
					contentType : "application/json; charset=UTF-8",
					success : function() {
						
					},
					error : function() {
						
					}
					});
				
			}
			});
</script> 

		
		
		
				
<script>
		$(document).on('click','.move',function(e) {
					var certificateName = [];
					var certificateEnforcement = [];
					var certificateDate = [];
					var certificateSEQ = [];

					var foreignCriteria = [];
					var foreignName = [];
					var foreignScore = [];
					var foreignEnforcement = [];
					var foreignDate = [];
					var foreignOther = [];
					var foreignSEQ = [];
					
					//자격증
					$("input[name='certificateName']").each(function(i) {
						certificateName.push($("input[name='certificateName']").eq(i).val());//자격증 (자격증명)
						certificateEnforcement.push($("input[name='certificateEnforcement']").eq(i).val());//자격증 (시행처)
						certificateDate.push($("input[name='certificateDate']").eq(i).val());//자격증 (취득일자)
						certificateSEQ.push($(".certificateList").eq(i).attr("value"));//자격증 (seqNum)
					});
					
					
					//외국어 자격증 
					$("input[name='foreignCriteria']").each(function(i) {
						foreignCriteria.push($("input[name='foreignCriteria']").eq(i).val());//외국어 자격증 (언어)
						foreignName.push($("input[name='foreignName']").eq(i).val());//외국어 자격증 (시험종류)
						foreignScore.push($("input[name='foreignScore']").eq(i).val());//외국어 자격증 (점수)
						foreignDate.push($("input[name='foreignDate']").eq(i).val());//외국어 자격증 (취득일)
						foreignSEQ.push($(".foreignList").eq(i).attr("value"));//외국어 자격증 (seqNum)
						
					});
					
					var data = {};

					data.userID ='<c:out value="${member.userId}"/>';
					
					data.resumeID = <%=resumeID%>;
					data.resumeSchool = $("input[name='resume_name']").val();//학교명
					data.resume_major = $("input[name='resume_major']").val();//전공
					data.resumeGrade = $("input[name='resume_grade']").val();//학점
					data.resumeLastEdu = $("#finalEducation option:selected").val();

					data.certificateName = certificateName;
					data.certificateEnforcement = certificateEnforcement;
					data.certificateDate = certificateDate;
					data.certificateSEQ = certificateSEQ;
					
					data.foreignCriteria = foreignCriteria;
					data.foreignName = foreignName;
					data.foreignScore = foreignScore;
					data.foreignDate = foreignDate;
					data.foreignSEQ = foreignSEQ;
					$.ajax({
						type : "POST",
						url : "${contextPath}/resume/page2Update.do",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify(data),
						success : function() {

						},
						error : function() {

						}
					});
				});
	</script>
	
	
</head>


<body>
	<div class="sub_visual">
		<span style="color: white;">이력서 작성</span>
	</div>

	<div class="container">

		<div class="lnb">
			<ul>
				<li><a href="/springEx/main.do">홈</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="${contextPath}/resume/resumeList.do?resumeUser=${member.userId}">이력서
						관리</a></li>
				<li style="color: grey; font-weight: bold;">〉</li>
				<li class="on"><a
					href="${contextPath}/resume/resumeWrite.do?userID=${member.userId}">이력서
						작성</a></li>
			</ul>
		</div>

		<div id="title_area">
		
				<button id="first" class="btn headbutton move none" 
					onClick="location.href='${contextPath}/resume/resumeBackPage1.do?userID=${member.userId}&resumeID=<%=resumeID%>'">기본정보</button>
				<div id="second" class="headbutton move">상세정보</div>
				<button id="third" class="btn headbutton move none" 
					onClick="location.href='${contextPath}/resume/moveToPage3.do?userID=${member.userId}&resumeID=<%=resumeID%>'">경력사항 / 교육수료사항</button>
				<button id="forth" class="btn headbutton move none" 
					onClick="location.href='${contextPath}/resume/moveToPage4.do?userID=${member.userId}&resumeID=<%=resumeID%>'">프로젝트 관련사항</button>
				<button id="last" class="btn headbutton move none" 
					onClick="location.href='${contextPath}/resume/moveToPage5.do?userID=${member.userId}&resumeID=<%=resumeID%>'">자기소개서</button>
			</div>
		<h3>상세정보</h3>
		<div class="main">

			<h4>학력사항</h4>
			<label class="title">최종학력 선택</label> <select id="finalEducation"
				name="education_check">
				<option value="elementry" style="text-align: center;">초등학교
					졸업</option>
				<option value="middle"<c:if test="${resumeVO.resumeLastEdu eq 'middle'}">selected</c:if>>중학교 졸업</option>
				<option value="high"<c:if test="${resumeVO.resumeLastEdu eq 'high'}">selected</c:if>>고등학교 졸업</option>
				<option value="university"<c:if test="${resumeVO.resumeLastEdu eq 'university'}">selected</c:if>>대학교 졸업</option>
				<option value="school"<c:if test="${resumeVO.resumeLastEdu eq 'school'}">selected</c:if>>대학원 졸업</option>
			</select>

			<div>
				<label class="title">학교명</label> <input type="text"
					name="resume_name" id="schoolName" placeholder="학교명 입력"
					onfocus="this.placeholder=''" onblur="this.placeholder='학교명 입력'" value="${resumeVO.resumeSchool}">
				<label class="title">전공</label> <input type="text"
					name="resume_major" id="major" placeholder="전공 입력"
					onfocus="this.placeholder=''" onblur="this.placeholder='전공 입력'" value="${member.userMajor}">
				<label class="title">학점</label> <input type="text"
					placeholder="학점 입력" onfocus="this.placeholder=''"
					onblur="this.placeholder='학점 입력'" name="resume_grade" id="grade" value="${resumeVO.resumeGrade}">
				/ <select name="resume_grade_check" id="maxGrade">
					<option value="3.5">3.5</option>
					<option value="4.0">4.0</option>
					<option value="4.5" selected="selected">4.5</option>
					<option value="4.8">4.8</option>
				</select>
			</div>
		</div>


		<div class="main">
			<div id="title_area">
				<h4>자격증</h4>
			</div>
			<div id="certificate_list" class="list_field certificateList" name="certificate_list" value="${certificateList1.certificateSEQ}">
				<button id="cer_add" class="btn addbutton" type="button">추가</button>
				<label class="title">자격증 명</label> 
				<input type="text" name="certificateName" placeholder="자격증 명 입력" class="clear"
					onfocus="this.placeholder=''" onblur="this.placeholder='자격증 명 입력'" value="${certificateList1.certificateName}">
				<label class="title">발행처/기관</label> <input type="text"
					name="certificateEnforcement" placeholder="발행처/기관 입력" class="clear"
					placeholder="발행처/기관 입력" onfocus="this.placeholder=''"
					onblur="this.placeholder='발행처/기관 입력'" value="${certificateList1.certificateEnforcement}">
				<div id="date_certificate" class="date">
					<label class="title">취득일</label> <input type="text"  class="clear"
						name="certificateDate" placeholder="취득일" value="${certificateList1.certificateDate}">
				</div>

			</div>
			
			<c:forEach var="certificate" items="${certificateList}" >
			
			<button id="del_button" class="btn ${certificate.certificateSEQ}" name="certificate_remove" onclick="remove_div(`${certificate.certificateSEQ}`)">삭제</button>
			<div id="${certificate.certificateSEQ}"  name="certificate_list" value="${certificate.certificateSEQ}" class="list_field certificateList">
				<button id="cer_add" class="btn addbutton" type="button">추가</button>
				<label class="title">자격증명</label> 
				<input type="text" name="certificateName" placeholder="자격증명 입력" onfocus="this.placeholder=''" onblur="this.placeholder='자격증명 입력'" value="${certificate.certificateName}">
				<label class="title">발행처/기관</label> <input type="text" name="certificateEnforcement" placeholder="발행처/기관 입력" onfocus="this.placeholder=''" onblur="this.placeholder='발행처/기관 입력'" value="${certificate.certificateEnforcement}">
				<div id="date_certificate" class="date">
					<label class="title">취득일</label> <input type="text" name="certificateDate" placeholder="취득일" value="${certificate.certificateDate}">
				</div>
			</div>
			</c:forEach> 
			<div id="cerfield" class="fieldset"></div>
			
		</div>
	

		<div class="main">
			<div id="title_area">
				<h4>어학시험</h4>
			</div>
			<div id="foreign_list" class="list_field foreignList" value="${foreignList1.foreignSEQ}">
				<button id="for_add" class="btn addbutton" type="button">추가</button>
				<div>
					<label class="title">언어</label> <input type="text" id="lang" class="clear" name="foreignCriteria" placeholder="언어 입력" onfocus="this.placeholder=''" onblur="this.placeholder='언어 입력'" value="${foreignList1.foreignCriteria}">
					<label class="title">시험 종류</label> <input type="text" id="langtype"
						name="foreignName" placeholder="시험종류 입력" placeholder="시험종류 입력" class="clear"
						onfocus="this.placeholder=''" onblur="this.placeholder='시험종류 입력'" value="${foreignList1.foreignName}">
					<label class="title">점수</label> <input type="text" id="langscore"
						name="foreignScore" placeholder="점수 입력" placeholder="점수 입력" class="clear"
						onfocus="this.placeholder=''" onblur="this.placeholder='점수 입력'" value="${foreignList1.foreignScore}">
					<div class="date">
						<label class="title">취득일</label> <input type="text" class="clear"
							name="foreignDate" placeholder="취득일" value="${foreignList1.foreignDate}">
					</div>
				</div>

			</div>
			
			<c:forEach var="foreign" items="${foreignList}" >
			
			<button id="del_button" class="btn ${foreign.foreignSEQ}" name="foreign_remove" onclick="remove_div(`${foreign.foreignSEQ}`)">삭제</button>
			<div id="${foreign.foreignSEQ}" name="foreign_list" value="${foreign.foreignSEQ}" class="list_field foreignList">
				<button id="for_add" class="btn addbutton" type="button">추가</button>
				<div>
					<label class="title">언어</label> <input type="text" id="lang" name="foreignCriteria" placeholder="언어 입력" onfocus="this.placeholder=''" onblur="this.placeholder='언어 입력'" value="${foreign.foreignCriteria}">
					<label class="title">시험 종류</label> <input type="text" id="langtype" name="foreignName" placeholder="시험종류 입력" onfocus="this.placeholder=''" onblur="this.placeholder='시험종류 입력'" value="${foreign.foreignName}">
					<label class="title">점수</label> <input type="text" id="langscore" name="foreignScore" placeholder="점수 입력" onfocus="this.placeholder=''" onblur="this.placeholder='점수 입력'" value="${foreign.foreignScore}">
					<div class="date">
						<label class="title">취득일</label> <input type="text" name="foreignDate" placeholder="취득일" value="${foreign.foreignDate}">
					</div>
				</div>

			</div>
			
			</c:forEach>
				
				
				
			<div id="forfield" class="fieldset"></div>
			
		</div>
		<div class="buttonGroups">
			<button id="btn1" class="btn move" type="button"
				onClick="location.href='${contextPath}/resume/resumeBackPage1.do?userID=${member.userId}&resumeID=<%=resumeID%>'">이전</button>
			<button id="btn2" class="btn move" type="button"
				onClick="location.href='${contextPath}/resume/moveToPage3.do?userID=${member.userId}&resumeID=<%=resumeID%>'">다음</button>
		</div>
	</div>

</body>


</html>
