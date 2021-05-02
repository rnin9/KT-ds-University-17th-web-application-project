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

<scripts
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
	margin-bottom: 30px;
}

.main { /* 이름 밑에 속성들을 감싸서 적용 */
	height: auto;
	position: relative;
	text-align: left;
	border-bottom: 1px solid #eeeeee;
	padding-bottom: 30px;
	margin-bottom: 30px;
}

div.formtag { /* div 속 폼태그 전체 적용 */
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
	line-height: 15px;
}

.title { /* main 밑 속성값들의 이름 */
	margin: 35px 0px 0px 40px;
	display: inline-block;
	width: 150px;
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

#project_list {
	height: 600px;
}

div input[type="text"] { /* input type text 태그 지정*/
	width: 265px;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #c8c8c0;
	box-sizing: border-box;
	margin-right: 10px;
	line-height: 15px;
}

textarea {
	resize: none;
	border: 1px solid #c8c8c0;
	padding: 10px 20px;
	margin-top: 40px;
	min-height: 120px;
	width: 734px;
	line-height: 25px;
}

#textarea {
	float: left;
}

.fieldset {
	display: none;
	height: auto;
	position: relative;
}

#project_skill {
	top: 10px;
	margin-top: 40px;
}

#project_link, #project_skill_text {
	width: 734px;
}

#pro_add {
	float: right;
	position: absolute;
	right: 28px;
}

.addition {
	position: absolute;
	right: 90px;
	Z-INDEX: 1;
}

.foreach {
	position: absolute;
	right: 90px;
	Z-INDEX: 1;
}

.buttonGroups {
	width: 100%;
	margin-top: -20px;
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

.div_line {
	border-bottom: 3px solid #EEEEEE;
	position: relative;
	width: 82%;
	margin-left: 30px;
	margin-top: -570px;
	margin-bottom: 10px;
}

.line1 {
	border-bottom: 3px solid #EEEEEE;
	position: relative;
	width: 82%;
	margin-left: 30px;
	margin-top: 30px;
	margin-bottom: 10px;
}
/*
.div_line {
   border-bottom: 3px solid #EEEEEE;
    position: relative;
    width: 82%;
    margin-left: 30px;
    margin-top:30px;
    margin-bottom: 10px;	
}
.line1{
	border-bottom: 3px solid #EEEEEE;
    position: relative;
    width: 82%;
    margin-left: 30px;
    margin-top:-590px;
	margin-bottom: 10px;
}
*/
</style>

<script>
	function add_div(e, result) {
		var obj = document.createElement('button');
		var div = document.createElement('div');
		var line = document.createElement('div');

		line.setAttribute('class', 'div_line');
		obj.innerHTML = "삭제";
		obj.setAttribute('id', 'del_button')

		div.innerHTML = document.getElementById(e).innerHTML;
		$(div).find('.clear').val('');

		if (e == 'project_list') { //자격증
			document.getElementById('profield').appendChild(obj);
			div.appendChild(line);
			div.setAttribute("style", "height:600px;")
			document.getElementById('profield').appendChild(div);
			document.getElementById('profield').style.display = "block";

			div.setAttribute('id', result); //제일 밖에 id

			obj.setAttribute('class', 'btn ' + result + ' addition');
			obj.setAttribute('onclick', 'remove_div(' + result + ')');

			$(div).find(".test1").html("(0 / 1000)");
			$(div).find(".test1").attr("class", "test" + result);
			$(div).find("#test" + result).attr("id", "test" + result);

		}

	}

	function remove_div(obj) { //obj = id값 1... or   10..... 
		$(`#` + obj).remove();//한칸 삭제
		$(`.` + obj).remove();//삭제버튼 삭제
	}
</script> <script>
	var ID = '<c:out value="${member.userId}"/>';
	var resumeID =
<%=resumeID%>
	;
	data = {}
	data.ID = ID;
	data.resumeID = resumeID;
	$(document).on('click', '.addbutton', function(e) {
		$.ajax({
			type : "POST",
			url : "${contextPath}/resume/page4InsertProject.do",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(data),
			success : function(result) {
				add_div("project_list", result);
			},
			error : function() {
				alert("로그인해주세요")
			}
		});

				});
			
</script> 
<!-- delete -->
 <script>
		$(document).on('click','#del_button',function(e) {
			var array = this.className.split(" ");
			var seqNum = array[1];
			$.ajax({
					type : "POST",
					url : "${contextPath}/resume/page4DeleteProject.do",
					data : JSON.stringify(seqNum),
					contentType : "application/json; charset=UTF-8",
					success : function() {
					},
					error : function() {
					}
					});
			});
</script> 

<script>
	function resize(obj) {
		obj.style.height = "5px";
		obj.style.height = (2 + obj.scrollHeight) + "px";
	}
</script> <script>
	$(document).on('keyup', '.test', function(e) {

		var id = e.target.getAttribute('id');

		$(`.` + id).html("(" + $(this).val().length + " / 1000)");

		if ($(this).val().length > 1000) {
			$(this).val($(this).val().substring(0, 1000));
			$(`.` + id).html("(1000 / 1000)");
		}

	});
</script> <script>
	$(document).on(
			'click',
			'.move',
			function(e) {

				var projectEnforcement = [];
				var projectName = [];
				var projectDev = [];
				var projectContent = [];
				var projectRole = [];
				var projectURL = [];
				var projectSEQ = [];

				//career
				$("input[name='project_center']").each(
						function(i) {
							projectEnforcement
									.push($("input[name='project_center']").eq(
											i).val());
							projectName.push($("input[name='project_name']")
									.eq(i).val());
							projectDev.push($("input[name='project_skill']")
									.eq(i).val());
							projectContent.push($(
									"textarea[name='project_introduce']").eq(i)
									.val());
							projectRole.push($("textarea[name='project_role']")
									.eq(i).val());
							projectURL.push($("input[name='project_link']").eq(
									i).val());
							projectSEQ.push($(".projectList").eq(i).attr(
									"value"));
						});

				var data = {};

				data.userID = '<c:out value="${member.userId}"/>';
				data.resumeID = '<c:out value="${resumeVO.resumeID}"/>';

				data.projectEnforcement = projectEnforcement;
				data.projectName = projectName;
				data.projectDev = projectDev;
				data.projectContent = projectContent;
				data.projectRole = projectRole;
				data.projectURL = projectURL;
				data.projectSEQ = projectSEQ;

				$.ajax({
					type : "POST",
					url : "${contextPath}/resume/page4Update.do",
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
	<div class="sub_visual"></div>

	<div class="container">

		<div class="lnb">
			<ul>
				<li><a href="${contextPath}/main.do">홈</a></li>
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
			<button id="second" class="btn headbutton move none"
				onClick="location.href='${contextPath}/resume/resumeBackPage2.do?userID=${member.userId}&resumeID=<%=resumeID%>'">상세정보</button>
			<button id="third" class="btn headbutton move none"
				onClick="location.href='${contextPath}/resume/moveToPage3.do?userID=${member.userId}&resumeID=<%=resumeID%>'">경력사항
				/ 교육수료사항</button>
			<div id="forth" class="headbutton move">프로젝트 관련사항</div>
			<button id="last" class="btn headbutton move none"
				onClick="location.href='${contextPath}/resume/moveToPage5.do?userID=${member.userId}&resumeID=<%=resumeID%>'">자기소개서</button>
		</div>
		<div class="pageIntro">
			<h3>프로젝트 관련사항</h3>
		</div>

		<div class="main">
			<div id="project_list" class="list_field projectList"
				name="project_list" value="${projectList1.projectSEQ}">
				<button id="pro_add" class="btn addbutton" type="button">추가</button>
				<div>
					<label class="title">기관</label><input type="text"
						name="project_center" id="project_center" placeholder="기관명 입력"
						class="clear" onfocus="this.placeholder=''"
						onblur="this.placeholder='기관명 입력'"
						value="${projectList1.projectEnforcement}"> <label
						class="title">프로젝트명</label><input type="text" name="project_name"
						id="project_name" placeholder="프로젝트명 입력" class="clear"
						onfocus="this.placeholder=''" onblur="this.placeholder='프로젝트명 입력'"
						value="${projectList1.projectName}">
				</div>
				<div>
					<label class="title" id="project_skill">개발환경 및<br>사용기술
					</label><input type="text" name="project_skill" id="project_skill_text"
						class="clear" placeholder="WINDOWS7 / JAVA NETWORK,VB, ORACLE"
						onfocus="this.placeholder=''"
						onblur="this.placeholder='WINDOWS10 / JAVA NETWORK, VB, ORACLE...'"
						value="${projectList1.projectDev}">
				</div>
				<div>
					<label class="title" id="textarea">프로젝트 소개
						<div class="test1" style="display: inline-block;">(0 / 1000)</div>
					</label>
					<textarea id=test1 class="test clear" name="project_introduce"
						onkeyup="resize(this)" cols="70">${projectList1.projectContent}</textarea>
				</div>
				<div>
					<label class="title" id="textarea">담당한 역할</label>
					<textarea id="project_role" name="project_role" class="clear"
						onkeyup="resize(this)" cols="70">${projectList1.projectRole}</textarea>
				</div>
				<div>
					<label class="title">관련 링크</label><input type="text"
						name="project_link" id="project_link" placeholder="관련 링크 첨부"
						class="clear" onfocus="this.placeholder=''"
						onblur="this.placeholder='관련 링크 첨부'"
						value="${projectList1.projectURL}">
				</div>
			</div>

			<c:forEach var="project" items="${projectList}">
				<div id="${project.projectSEQ}" name="project_list"
					value="${project.projectSEQ}" class="list_field projectList">
					<button id="pro_add" class="btn addbutton " type="button">추가</button>
					<button id="del_button" class="btn ${project.projectSEQ} foreach"
						name="project_remove" type="button"
						onclick="remove_div(`${project.projectSEQ}`)">삭제</button>
					<div class="line1"></div>
					<div>
						<label class="title">기관</label><input type="text"
							name="project_center" id="project_center" placeholder="기관명 입력"
							onfocus="this.placeholder=''" onblur="this.placeholder='기관명 입력'"
							value="${project.projectEnforcement}"> <label
							class="title">프로젝트명</label><input type="text" name="project_name"
							id="project_name" placeholder="프로젝트명 입력"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='프로젝트명 입력'"
							value="${project.projectName}">
					</div>
					<div>
						<label class="title" id="project_skill">개발환경 및<br>사용기술
						</label><input type="text" name="project_skill" id="project_skill_text"
							placeholder="WINDOWS7 / JAVA NETWORK,VB, ORACLE"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='WINDOWS10 / JAVA NETWORK, VB, ORACLE...'"
							value="${project.projectDev}">
					</div>
					<div>
						<label class="title" id="textarea">프로젝트 소개
							<div class="test1" style="display: inline-block;">(0 /
								1000)</div>
						</label>
						<textarea id=test1 class="test" name="project_introduce"
							onkeyup="resize(this)" cols="70">${project.projectContent}</textarea>
					</div>
					<div>
						<label class="title" id="textarea">담당한 역할</label>
						<textarea id="project_role" name="project_role"
							onkeyup="resize(this)" cols="70">${project.projectRole}</textarea>
					</div>
					<div>
						<label class="title">관련 링크</label><input type="text"
							name="project_link" id="project_link" placeholder="관련 링크 첨부"
							onfocus="this.placeholder=''"
							onblur="this.placeholder='관련 링크 첨부'"
							value="${project.projectURL}">
					</div>
				</div>

			</c:forEach>
			<div id="profield" class="fieldset"></div>
		</div>
		<div class="buttonGroups">
			<button id="btn1" class="btn save move " type="button"
				onClick="location.href='${contextPath}/resume/moveToPage3.do?userID=${member.userId}&resumeID=<%=resumeID%>'">이전</button>
			<button id="btn2" class="btn save move" type="button"
				onClick="location.href='${contextPath}/resume/moveToPage5.do?userID=${member.userId}&resumeID=<%=resumeID%>'">다음</button>
		</div>
	</div>

</body>

</html>
