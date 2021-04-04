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
		                id: login,
		                pwd: password
		            },
		            success: (resp) => {	// 모든 결과를 success로 받음
		            	if (resp.result == true) {
		                 const logOn = true;
		                 return resp.result;	// 결과 반환
		                } else {
		                	const logOn = false;
			                Swal.showValidationMessage(`Check Your ID & Password!`) // 정보가 없는경우, Error
		                	
		            }},
		            error: (data) => {
		                console.log("로그인 실패");
		     	}
		        })}
    		  }
    		}).then((result) => {
    			console.log(result);
    			if(result.isConfirmed){			// 확인된 경우, 로그인
						console.log(result.value.member.id);
    				   Swal.fire({    					   
	                      	title: "환영합니다! " + result.value.member.id + " 님!",
	                        icon: "success"
	                    })
 
                		setTimeout(() => window.location.reload(), 1000); // 페이지 새로고침
    		 	}
    		}) 
     }
</script>

</head>
<body>

	<!-- 권한별 다른 메뉴, position별로 기능 추가 필요 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="${contextPath}/main.do"><img
			src="${pageContext.request.contextPath}/resources/image/header/logo/KTds_logo2.png"
			alt="로고" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#main_nav" aria-expanded="false"
			aria-label="Toggle navigation" style="background-color: indianred;">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="main_nav">

			<ul class="navbar-nav mr-auto">


				<li class="nav-item"><a class="nav-link" href="#">KT
						university</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/member/listMembers.do">공지사항</a></li>
				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/member/listMembers.do">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="#">게시판관리</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown">
								수강관리 </a>
							<ul class="dropdown-menu fade-up">
								<li><a class="dropdown-item" href="#"> 채용예정자</a></li>
								<li><a class="dropdown-item" href="#"> 재직자 </a></li>
							</ul></li>
					</c:when>
				</c:choose>

			</ul>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"> Menu
						item </a></li>
				<li class="nav-item"><a class="nav-link" href="#"> 오시는길 </a></li>

				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<li class="nav-item dropdown"><a
							class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown">
								<i class="fas fa-cog"></i> ${member.name} (${member.id})
						</a>
							<ul class="dropdown-menu dropdown-menu-right fade-down">
								<li><a class="dropdown-item" href="#"> 내정보 관리</a></li>
								<li><a class="dropdown-item" href="#"> 이력서 관리 </a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/member/logout.do"><i
								class="fas fa-sign-out-alt" style="font-size: 25px"></i> <i
								class="fas fa-running"
								style="font-size: 25px; margin-left: 3px;"></i> </a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							onclick="onLoginClicked()"> <i class="fas fa-running"
								style="font-size: 25px; margin-right: 6px;"></i><i
								class="fas fa-sign-in-alt" style="font-size: 25px"></i>
						</a></li>
					</c:otherwise>
				</c:choose>
			</ul>

		</div>
		<!-- navbar-collapse.// -->
	</nav>
</body>