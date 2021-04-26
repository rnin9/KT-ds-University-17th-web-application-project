<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
     function onLoginClicked(){ 				/* 로그인 operation Sweet alert 사용 */
    	 Swal.fire({
    		  html: `<img
    				src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
    				alt="로고" style="width:200px; height:60px;"/><input type="text" id="login" class="swal2-input" placeholder="Username">
    		  <input type="password" id="password" class="swal2-input" placeholder="Password">`,
    		  confirmButtonText: 'Sign in',
    		  showCancelButton: true,
    		  showCloseButton: true,
    		  focusConfirm: false,
    		  preConfirm: () => {			// 로그인 process 이전 체크 
    		    const login = Swal.getPopup().querySelector('#login').value
    		    const password = Swal.getPopup().querySelector('#password').value
    		    if (!login || !password) {
    		      Swal.showValidationMessage(`Please enter login and password`)	// id & pw가 없는 경우
    		    }
    		     else{
    
    		   return $.ajax({				// 비동기통신, ID와 비밀번호가 있는지 확인함, 결과는 json으로 반환
		            method: "POST",
		            url: "${contextPath}/member/login.do",
		            data: {
		                userId: login,
		                userPassword: password
		            },
		            success: (resp) => {	// 모든 결과를 success로 받음
		            	if (resp.result == true) {
		                 const logOn = true;
		                 return resp.result;	// 결과 반환
		                } 
		            	else {
		                	const logOn = false;
			                Swal.showValidationMessage(`Check Your ID & Password or E-Mail Check!`) // 정보가 없는경우, Error       	
		            }},
		            error: (data) => {
		                console.log("로그인 실패");
		     	}
		        })}
    		  }
    		}).then((result) => {
    			if(result.isConfirmed){			// 확인된 경우, 로그인
    				   Swal.fire({    					   
	                      	title: "환영합니다! " + result.value.member.userName + " 님!",
	                        icon: "success"
	                    })
 						 
                		if((result.value.member.userPosition =='PARTNER' && result.value.url =='/member/login.do')
                			|| (result.value.member.userPosition =='ADMIN' && result.value.url =='/member/login.do')){
                			 setTimeout(() => window.location.href = '${contextPath}/partner/main.do', 1000); // 페이지 새로고침
                		 } else{
                			 setTimeout(() => window.location.reload(), 1000);
                		 }
    			}
    		}) 
     }
</script>

</head>
<body>

	<!-- 권한별 다른 메뉴, position별로 기능 추가 필요 -->
	<c:choose>
		<c:when
			test="${isLogOn != null && member.userPosition == 'PARTNER'}">
			<nav class="navbar navbar-expand-sm navbar-dark bg-primary-admin">
		</c:when>
		<c:when
			test="${isLogOn != null && member.userPosition == 'ADMIN'}">
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary-admin">
		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-expand-xl navbar-dark bg-primary">
		</c:otherwise>
	</c:choose>


	<c:choose>
		<c:when
			test="${ (isLogOn == true && member.userPosition == 'ADMIN') }">
			<a class="navbar-brand-admin" href="${contextPath}/partner/main.do"><img
				src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo1.png"
				alt="로고" /></a>
		</c:when>
		<c:when
			test="${ (isLogOn == true && member.userPosition == 'PARTNER')}">
			<a class="navbar-brand-admin" href="${contextPath}/partner/main.do"><img
				src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo1.png"
				alt="로고" /></a>
		</c:when>
		<c:otherwise>
			<a class="navbar-brand" href="${contextPath}/main.do"><img
				src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
				alt="로고" /></a>
		</c:otherwise>
	</c:choose>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#main_nav" aria-expanded="false"
		aria-label="Toggle navigation" style="background-color: indianred;">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="main_nav">
		<ul class="navbar-nav mr-auto">
			<!-- 일반유저, 회원(사용자인 경우 시작) -->
			<c:choose>
				<%--	  로그인 전		--%>
				<c:when
					test="${isLogOn == null && (member.userPosition != 'ADMIN' && member.userPosition != 'PARTNER')}">
					<li class="nav-item dropdown"><a
						class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown">
							kt ds Univ. </a>
						<ul class="dropdown-menu fade-up">
							<li><a class="dropdown-item"
								href="${contextPath}/universityIntro.do"> 회사소개</a></li>
							<li><a class="dropdown-item"
								href="${contextPath}/universityConsortium.do"> 컨소시엄</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/course/userCourseList.do">과정신청</a></li>
				</c:when>
				<%--	  로그인 후		--%>
				<%--		채용예정자		--%>
				<c:when test="${isLogOn != null && member.userPosition == '채용예정자'}">
					<li class="nav-item dropdown"><a
						class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown">
							kt ds Univ. </a>
						<ul class="dropdown-menu fade-up">
							<li><a class="dropdown-item"
								href="${contextPath}/universityIntro.do"> 회사소개</a></li>
							<li><a class="dropdown-item"
								href="${contextPath}/universityConsortium.do"> 컨소시엄</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/course/userCourseList.do">과정신청</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/member/apply.do">채용공고</a></li>

				</c:when>
				<%--		재직자		--%>
				<c:when test="${isLogOn != null && member.userPosition == '재직자'}">
					<li class="nav-item dropdown"><a
						class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown">
							kt ds Univ. </a>
						<ul class="dropdown-menu fade-up">
							<li><a class="dropdown-item"
								href="${contextPath}/universityIntro.do"> 회사소개</a></li>
							<li><a class="dropdown-item"
								href="${contextPath}/universityConsortium.do"> 컨소시엄</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/course/userCourseList.do">과정신청</a></li>
				</c:when>

			</c:choose>
			<!-- 일반유저, 회원(사용자인 경우 끝) -->
			<!-- 일반유저, 회원(관리자인 경우 시작) -->
			<%-- <c:choose>
				<c:when
					test="${isLogOn == true  && member!= null  && member.userPosition == 'ADMIN'}">
					<li class="nav-item dropdown"><a
						class="nav-link-admin  dropdown-toggle" href="#"
						data-toggle="dropdown"> 회원관리 </a>
						<ul class="dropdown-menu fade-up">
							<li><a class="dropdown-item" href="#"> 회원정보관리</a></li>
							<li><a class="dropdown-item" href="#"> 이력서관리 </a></li>
							<li><a class="dropdown-item" href="#"> 지원서관리 </a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link-admin  dropdown-toggle" href="#"
						data-toggle="dropdown"> 강의관리 </a>
						<ul class="dropdown-menu fade-up">
							<li><a class="dropdown-item" href="${contextPath}/syllabus/syllabusList.do"> 강의계획서 관리</a></li>
							<li><a class="dropdown-item" href="${contextPath}/course/courseList.do"> 과정관리 </a></li>
							<li><a class="dropdown-item" href="${contextPath}/courseTake/courseApplyList.do"> 수강관리 </a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link-admin  dropdown-toggle" href="#"
						data-toggle="dropdown"> 협력사관리 </a>
						<ul class="dropdown-menu fade-up">
							<li><a class="dropdown-item" href="#"> 기업정보관리</a></li>
							<li><a class="dropdown-item" href="${contextPath}/partner/jobOpeningPost.do"> 채용공고 등록 </a></li>
							<li><a class="dropdown-item" href="${contextPath}/partner/jobOpeningList.do"> 채용공고 관리 </a></li>
						</ul></li>


					<li class="nav-item"><a class="nav-link-admin"
						href="${contextPath}/notice/listNotice.do">공지사항 관리</a></li>
					<li class="nav-item"><a class="nav-link-admin" href="${contextPath}/question/listQuestion.do">문의사항
							관리</a></li>
					<li class="nav-item"><a class="nav-link-admin"
						href="${contextPath}/survey/listSurvey.do">설문조사 관리</a></li>
				</c:when>
			</c:choose> --%>
			<!-- 관리자인 경우 끝) -->
			<!-- 협력사인 경우 시작) -->
			<%-- <c:choose>
				<c:when
					test="${isLogOn == true  && member!= null  && member.userPosition == 'PARTNER'}">
					<li class="nav-item"><a class="nav-link-admin"
						href="${contextPath}/partner/company/companyApplyManage.do?partnerLicenseNum=${partner.partnerLicenseNum}">지원자
							관리</a></li>
					<li class="nav-item"><a class="nav-link-admin"
						href="${contextPath}/partner/company/companyEmployee.do?partnerLicenseNum=${partner.partnerLicenseNum}">직원
							관리</a></li>
				</c:when>
			</c:choose> --%>
			<!-- 협력사인 경우 끝) -->
		</ul>

		<ul class="navbar-nav ml-auto">
			<!-- 관리자가 아닌경우 시작 -->
			<c:choose>
				<c:when test="${member.userPosition != 'ADMIN' && member.userPosition != 'PARTNER'}">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/location.do"> 교육장 안내 </a></li>
					<li class="nav-item dropdown"><a
						class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown">
							고객지원 </a>
						<ul class="dropdown-menu fade-up">
							<li><a class="dropdown-item" href="${contextPath}/notice/listNotice.do"> 공지사항</a></li>
							<li><a class="dropdown-item" href="${contextPath}/faq.do"> FAQ</a></li>
							<li><a class="dropdown-item" href="${contextPath}/question/userListQuestion.do?userId=${member.userId}"> 1:1문의</a></li>
						</ul></li>
				</c:when>
			</c:choose>
			<!-- 관리자가 아닌경우 끝 -->
			<!-- 로그인이 아닌경우 회원가입 보임 -->
			<c:choose>
				<c:when test="${isLogOn == null}">
					<li class="nav-item"><a
						href="${contextPath}/member/joinAgreeForm.do" class="nav-link">
							회원가입 </a></li>
				</c:when>
			</c:choose>
			<!-- 회원이 아닌경우 회원가입 보임 끝 -->

			<!-- 오른쪽 메뉴 -->
			<c:choose>
				 <c:when
					test="${(isLogOn == true  && member.userPosition == 'ADMIN')}">
					<li class="nav-item dropdown"><a
						class="nav-link-admin" href="#"
						data-toggle="dropdown">
							${member.userName} (${member.userId})
					</a>
					</li>
					<li class="nav-item"><a class="nav-link-admin"
						href="${contextPath}/member/logout.do"><i
							class="fas fa-sign-out-alt" style="font-size: 25px"></i> <span>logout</span>
					</a></li>
				</c:when> 
				<c:when
					test="${ (isLogOn == true && member.userPosition == 'PARTNER') }">
					<li class="nav-item dropdown"><a
						class="nav-link-admin" href="#"
						data-toggle="dropdown">
							${partner.partnerLicenseNum} (${partner.partnerName})
					</a>
					</li>
					<li class="nav-item"><a class="nav-link-admin"
						href="${contextPath}/member/logout.do"><i
							class="fas fa-sign-out-alt" style="font-size: 25px"></i> <span>logout</span>
					</a></li>
				</c:when>
				<c:when test="${isLogOn == true  && member.userPosition!= 'ADMIN'}">
					<li class="nav-item dropdown"><a
						class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown">
							<i class="fas fa-cog"></i> ${member.userName} (${member.userId})
					</a>
						<ul class="dropdown-menu dropdown-menu-right fade-down">
							<li><a class="dropdown-item"
								href="${contextPath}/member/myInfo.do?userID=${member.userId}">
									내정보 관리</a></li>
							<li><a class="dropdown-item" href="#"> 이력서 관리 </a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/member/logout.do"><i
							class="fas fa-sign-out-alt" style="font-size: 25px"></i> <span>logout</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link"
						onclick="onLoginClicked()"> <span style="margin-right: 5px;">login</span><i
							class="fas fa-sign-in-alt" style="font-size: 25px"></i>
					</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- navbar-collapse.// -->
	</nav>

</body>