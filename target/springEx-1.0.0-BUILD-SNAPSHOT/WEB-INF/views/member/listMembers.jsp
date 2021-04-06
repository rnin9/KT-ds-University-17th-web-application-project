<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 목록창</title>
</head>
<body>
<table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>아이디</b></td>
      <td><b>비밀번호</b></td>
      <td><b>이름</b></td>
      <td><b>이메일</b></td>
      <td><b>생년월일</b></td>
      <td><b>성별</b></td>
      <td><b>전공선택</b></td>
      <td><b>과정선택</b></td>
      <td><b>직업</b></td>
      <td><b>회사</b></td>
      <td><b>전화번호</b></td>
      <td><b>주소</b></td>
      <td><b>가입일</b></td>
      <td><b>메일인증</b></td>
      <td><b>삭제</b></td>
      
   </tr>
   
 <c:forEach var="member" items="${membersList}" >     
   <tr align="center">
      <td>${member.userId}</td>
      <td>${member.userPassword}</td>
      <td>${member.userName}</td>
      <td>${member.userEmail}</td>
      <td>${member.birth}</td>
      <td>${member.userGender}</td>
      <td>${member.userMajor}</td>
      <td>${member.userPosition}</td>
      <td>${member.userJob}</td>
      <td>${member.userCompany}</td>
      <td>${member.userPhoneNumber}</td>
      <td>${member.userAddress1} ${member.userAddress2} </td>
      <td>${member.userJoindate}</td>
      <td>${member.approval_status}</td>
      <td><a href="${contextPath}/member/removeMember.do?id=${member.userId }">삭제하기</a></td>
    </tr>
  </c:forEach>   
</table>
<a  href="${contextPath}/member/memberJoinForm.do"><h1 style="text-align:center">회원가입</h1></a>
</body>
</html>
