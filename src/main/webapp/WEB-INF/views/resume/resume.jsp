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
<title>강의계획서 관리</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
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

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

.bg-primary {
	background-color: white !important;
}

.container {
	width: 74.64%;
	font-family: 'Noto Sans KR', sans-serif;
}

.resumeList {
	border-collapse: collapse;
	font-size: 14px;
	line-height: 2.2;
	margin-top: 40px;
	text-align: center;
	/* color: #555; */
	width: 100%;
	line-height: 40px;
}

#item {
	border-color: grey;
	border-radius: .25rem;
	border-size: 1px;
}

#btn {
	margin-left: -20px;
}
</style>
<script>
$(document).on('click','#remove',function(e){
	var resumeID = $("input[name='check']:checked").val(); 
	data={}
	data.resumeID = resumeID
	 Swal.fire({
	        title:'삭제',
	        text:'이력서를 삭제하시겠습니까?',
			icon:'warning',
	        confirmButtonText: `삭제`,
	        showCancelButton: true,
	      	confirmButtonColor: '#3085d6',
	        cancelButtonText: `취소`,
	        }).then((res) =>{
	        	if(res.isConfirmed){
	        		$.ajax({
						type : "post",
						url : "${contextPath}/resume/deleteResume2.do",
						contentType : "application/json; charset=UTF-8",
						data:JSON.stringify(data),
						success : function() {
							alert("성공");
							location.reload(true);
						},
						error : function() {
						alert("실패")

						}
						});
	        		
	        		
	        	}
	        	else{
	        		return;
	        	}
	        })
	
});
</script>

<script type="text/javascript">
               var result = '${msg}';
               var name = '${resumeName}'
               
               if (result == 'removeSuccess'){
            	   window.onload=function() {
            		   swal("삭제 완료",(name + " 이력서 삭제 완료"),"success");
            	   }
               }
  </script>
</head>



<body>
	<div class="sub_visual"></div>

	<div class="container">
		<form method="post" action="${contextPath}/resume/resumeWrite.do">

			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a
						href="${contextPath}/resume/resumeList.do?resumeUser=${member.userId}">이력서관리</a></li>
				</ul>
			</div>


			<table class="resumeList">

				<tbody id="ajaxTable" style="width: 70%">
					<c:forEach var="resumeList" items="${resumeList}">
						<tr id="item">
							<td><c:choose>
									<c:when test="${resumeList.resumeCheck eq 'Y'}">
										<label
											style="color: #dc3545; font-weight: bold; font-size: 17px;">[대표
											이력서] </label>
									</c:when>
									<c:when test="${resumeList.resumeCheck eq 'N'}">
										<input type="radio" id="check" name="check"
											value="${resumeList.resumeID}">
									</c:when>
								</c:choose></td>

							<td class="name"><c:choose>
									<c:when test="${resumeList.resumeCheck eq 'Y'}">
										<a style="font-weight: bold; font-size: 17px"
											href="${contextPath}/resume/resumeInfo.do?resumeID=${resumeList.resumeID}&resumeUser=${resumeList.resumeUser}">
											${resumeList.resumeDate} </a>
									</c:when>
									<c:when test="${resumeList.resumeCheck eq 'N'}">
										<a
											href="${contextPath}/resume/resumeInfo.do?resumeID=${resumeList.resumeID}&resumeUser=${resumeList.resumeUser}">
											${resumeList.resumeDate} </a>
									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="btn button_bottom btn-outline-danger" type="button"
					id="remove">삭제</button>
				<button class="btn button_bottom btn-outline-danger" type="button"
					onClick="location.href='${contextPath}/resume/modResume.do?userID=${member.userId}&resumeID='+check.value">수정</button>
				<button class="btn button_bottom btn-outline-danger" type="button"
					onClick="location.href='${contextPath}/resume/resumeWrite.do?userID=${member.userId}'">
					이력서 작성</button>

				<button id="represent" class="btn button_bottom btn-outline-danger"
					type="button"
					onClick="location.href='${contextPath}/resume/resumeCheck.do?resumeID='+check.value+'&resumeUser=${member.userId}'">
					대표 이력서 설정</button>

			</div>
			check

		</form>
	</div>
</body>
<!--  
<script>
	
		$(document).on("click", "input[name='check']:radio" ,function () {
			var checked = $(this).attr("value");
			
			return checked;
			
		})

</script>-->
</html>