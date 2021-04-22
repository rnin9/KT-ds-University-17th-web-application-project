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

	<div class="menu-list" style="width: 15%; position: fixed;">

		<ul id="menu-content" class="menu-content collapse out">
			<li><a href="${contextPath}/partner/company/companyApplyManage.do?partnerLicenseNum=${partner.partnerLicenseNum}">
			 <i class="fas fa-file-alt"></i> 지원자 관리 </a></li>

		
			<!-- <ul class="sub-menu collapse" id="service">
				<li>Trendmonitoring</li>
				<li>Alarmmonitoring</li>
				<li>Audit-Trail</li>
			</ul>


			<li data-toggle="collapse" data-target="#new" class="collapsed">
				<a href="#"><i class="fa fa-car fa-lg"></i> Reporting <i
					class="fas fa-chevron-down"></i></a>
			</li>
			<ul class="sub-menu collapse" id="new">
				<li>Alarmstatistik</li>
				<li>Prozessfähigkeit</li>
			</ul> -->


			<li><a href="${contextPath}/partner/company/companyEmployee.do?partnerLicenseNum=${partner.partnerLicenseNum}">
			 <i class="fas fa-users" style="margin-right: 14px;"></i> 직원 관리 </a></li>

		</ul>
	</div>
</div>
