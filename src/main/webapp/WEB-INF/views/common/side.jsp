<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/sideBar.css" />

<div class="nav-side-menu">

	<div class="menu-list"
		style="width: 15%; min-width: 150px; position: fixed;">

		<ul id="menu-content" class="menu-content collapse out">
			<c:choose>
				<c:when test="${partner.partnerLicenseNum != 'kt_ds_university' }">
					<li><a
						href="${contextPath}/partner/company/companyApplyManage.do?partnerLicenseNum=${partner.partnerLicenseNum}">
							<i class="fas fa-file-alt"></i> 채용 관리
					</a></li>
					<li><a
						href="${contextPath}/partner/company/companyEmployee.do?partnerLicenseNum=${partner.partnerLicenseNum}">
							<i class="fas fa-users" style="margin-right: 4px;"></i> 직원 관리
					</a></li>
				</c:when>
				<c:otherwise>
					<li data-toggle="collapse" data-target="#user" class="collapsed">
						<a href="#" onclick="return false;"> <i class="fas fa-users"
							style="margin-right: 14px;"></i>회원관리 <i
							class="fas fa-chevron-down" ></i></a>
					</li>
					<ul class="sub-menu collapse" id="user">
						<li><a href="${contextPath}/manageUser/userList.do">회원 관리</a></li>
						<li><a href="${contextPath}/resume/resumeAdmin.do">이력서 관리</a></li>

					</ul>

					<li data-toggle="collapse" data-target="#partner" class="collapsed">
						<a href="#" onclick="return false;"> <i class="far fa-handshake" style="margin-right: 5px; margin-left: 10px;"></i>협력사 관리 <i
								class="fas fa-chevron-down"></i></a>
					</li>
					<ul class="sub-menu collapse" id="partner">
						<li><a href="${contextPath}/partner/partnerList.do"> 기업정보</a></li>
						<li><a href="${contextPath}/partner/jobOpeningPost.do"> 채용공고 등록</a></li>
						<li><a href="${contextPath}/partner/jobOpeningList.do"> 채용공고 관리</a></li>
					</ul>

					<li data-toggle="collapse" data-target="#course" class="collapsed">
						<a href="#" onclick="return false;"> <i class="fas fa-laptop"
							style="margin-right: 14px;"></i>강의관리 <i
							class="fas fa-chevron-down"></i></a>
					</li>
					<ul class="sub-menu collapse" id="course">
						<li><a href="/springEx/syllabus/syllabusList.do"> 강의계획서</a></li>
						<li><a href="/springEx/course/courseList.do"> 과정 관리</a></li>
						<li><a href="/springEx/courseTake/courseApplyList.do"> 수강
								관리</a></li>
					</ul>


					<li><a href="${contextPath}/notice/listNotice.do" style="margin-right: 20px;"> <i
							class="fas fa-file-alt" style="margin-right: 4px;"></i> 공지사항
					</a></li>
					<li><a href="${contextPath}/question/listQuestion.do" style="margin-right: 20px;"> <i
							class="fas fa-question-circle" style="margin-right: 4px;"></i>
							1:1 문의
					</a></li>
					<li><a href="${contextPath}/survey/listSurvey.do" style="margin-right: 20px;"> <i
							class="fas fa-edit" style="margin-right: 4px;"></i> 설문조사
					</a></li>

				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
