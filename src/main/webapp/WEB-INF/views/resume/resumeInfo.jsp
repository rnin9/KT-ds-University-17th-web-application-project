<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>   

<!DOCTYPE html>
<html lang = "ko">
<head>
<title>이력서 미리보기</title>
    <meta charset="utf-8">
    
<style>
     #container {
        width: 980px; 
        margin-left: 3px;
        background-color: white;
        text-align: start;
        font-family: S-CoreDream-3Light;
    }
    .baseinfo{
        display: flex;
    }
     header{
        box-sizing: border-box;
        margin-bottom: 27px;
        padding: 30px 0px;
        border-top: 2px solid #555555;
        border-bottom: 1px solid #eeee
    }
    img{
        margin-right: 30px;
        object-fit: fill;
        margin-left: 30px;
        width: 150px;
    }
    .divider {
        border-left: 3px solid green;
        height: 500px;
    
    }
    .info{
        display: flex;
         flex-direction: column;
    }
    .rowSummary{
        margin-left: 0px;
        position: relative;
        padding-left: 20px;
        background: #f1f3f4;
        font-size: 1.07em;
        font-weight: 400;
        padding: 5px
    }
    .content{
        float: left;
        width:770px;
        word-break: keep-all;
        word-wrap: break-word;
    }
    .context{
        width:990px;
        word-break: keep-all;
        word-wrap: break-word;
    }
    .str {
        
        float: left;
        width:200px;
    }
    .row{
        clear:left;
    }
    .containerItem{
        margin-top: 100px;
        clear:left;
        border-bottom: 1px solid black;
    }
    h4{
    	margin-left: 20px;
    }
 
    
</style>
</head>
<body>

    <div id = "container">
    <header>
    <div class= baseinfo>
        <div class= picture>
        <img src="${pageContext.request.contextPath}/resources/image/resume/passport-photo1.jpg" >
        </div>
        <div class = info>
        <h3>
            <span>${member.userName}</span>
            <span class=divider></span>
            <span>${member.userGender}</span>
            <span class=divider></span>
            <span>26살</span>
        </h3>
        <h5>
            <span>국적</span>
            <span>대한민국</span>
            <span class=divider></span>
            <span>생년월일</span>
            <span>${member.birth}</span>
        </h5>
        <h5>
            <span>영문이름</span>
			<span> </span>
            <span class=divider></span>
            <span>이메일</span>
            <span>${member.userEmail}</span>
        </h5>
        <h5>
            <span>핸드폰번호</span>
            <span>${member.userPhoneNumber}</span>
            <span class=divider></span>
            <span>주소</span>
            <span>${member.userAddress1} ${member.userAddress2}</span>
        </h5>
        <div>
    <div>
    </header>


    <div class="containerItem" style="margin-top: 50px;">
    <h3>
        <span class=divider></span>
        <span> 학력</span>
    </h3>
    </div>
    <div class= rowSummary>
        <h3>
            <span>${resumeInfo.resumeSchool}</span>
        </h3>   
    </div>
    <div class=row>
        <div class="str">
        <h4>전공학과</h4>
        </div>
        <div class="content"><h5>${member.userMajor}<h5></div>
    </div>
    <div class=row>
        <div class="str">
        <h4>성적</h4>
        </div>
        <div class="content"><h5><h5></div>
    </div>


    <div class="containerItem">
        <h3>
            <span class=divider></span>
            &nbsp
            <span> 교육 및 경력</span>
        </h3>
    </div>
    <c:forEach var="resumeInfo_career" items="${resumeInfo_career}">
                  <tr class="item">
                     
           
                     <td>${resumeInfo_career.careerCenter}</td>
                     <td><button class="btn button_bottom" type="button">수정</button></td>
                     <td><button class="btn button_bottom" type="button">삭제</button></td>
                  </tr>
               </c:forEach> 
    <div class= rowSummary>
        <h3>
            <span></span>
        </h3>   
    </div>
    <div class=row>
        <div class="str">
        <h4>기간</h4>
        </div>
        <div class="content"><h5>2019.02~2020.05<h5></div>
    </div>
    <div class=row>
        <div class="str">
        <h4>주관기관</h4>
        </div>
        <div class="content"><h5>kt ds university<h5></div>
    </div>
    <div class=row>
        <div class="str">
        <h4>주요경력 및 교육사항</h4>
        </div>
        <div class="content"><h5>자바 웹 애플리케이션 개발 과정<h5></div>
    </div>


    <div class="containerItem" style="margin-top: 50px;">
    <h3>
        <span class=divider></span>
        &nbsp
        <span>자격증</span>
    </h3>
    </div>
        <div class="str">
        <h3>TOEIC</h3>
        </div>
        <div class="content"><h5>990<h5></div>
    <div class="row">
        <div class="str">
        <h4>TOEIC Speaking</h4>
        </div>
        <div class="content"><h5>8등급<h5></div>
    </div>

    
    <div class="containerItem" style="margin-top: 50px;">
        <h3>
            <span class=divider></span>
            &nbsp
            <span>보유기술</span>
        </h3>
    </div>
    <div class="str">
    <h3>C언어, 자바, 파이썬, 스프링</h3>
    </div>


    <div class="containerItem">
        <h3>
            <span class=divider></span>
            &nbsp
            <span> 프로젝트 경력 사항</span>
        </h3>
    </div>
    <div class= rowSummary>
        <h3>
            <span>기관: 네이버</span>
        </h4>   
    </div>
    <div class=row>
        <div class="str">
        <h4>프로젝트 명</h4>
        </div>
        <div class="content"><h5><h5></div>
    </div>
    <div class=row>
        <div class="str">
        <h4>개발환경 및 사용기술</h4>
        </div>
        <div class="content"><h5>자바를 기반으로한 스프링 프레임워크를 이용함 <h5></div>
    </div>
    <div class=row>
        <div class="str">
        <h4>프로젝트 소개</h4>
        </div>
        <div class="content"><h5><h5></div>
    </div>
    <div class=row>
        <div class="str">
        <h4>담당한 역할</h4>
        </div>
        <div class="content"><h5><h5></div>      
    </div>
    <div class=row>
        <div class="str">
        <h4>프로젝트 관련 링크</h4>
        </div>
        <div class="content"><a href="https://github.com/rnin9/KT-ds-University-17th-web-application-project"><h5>https://github.com/rnin9/KT-ds-University-17th-web-application-project<h5></a></div>
    </div>
    <div class="containerItem">
        <h3>
            <span class=divider>
            &nbsp
            <span>자기소개서</span>
        </h3>
    </div>


    <div class= rowSummary>
        <h3>
            <span>1.성장과정</span>
        </h3>   
    </div>
        <div class="context"><h5><h5></div>

    <div class= rowSummary>
        <h3>
            <span>2.학교생활</span>
        </h3>   
    </div>
        <div class="context"><h5><h5></div>


    <div class= rowSummary>
        <h3>
            <span>3.성격</span>
        </h3>   
    </div>
        <div class="context1"><h5><h5></div>

    <div class= rowSummary>
        <h3>
            <span>4.희망업무 및 장래포부</span>
        </h3>   
    </div>
        <div class="context1"><h5><h5></div>

    <div class= rowSummary>
        <h3>
            <span>5.특기사항</span>
        </h3>   
    </div>
        <div class="context1"><h5><h5></div>

    


</div>
</body>
</html>