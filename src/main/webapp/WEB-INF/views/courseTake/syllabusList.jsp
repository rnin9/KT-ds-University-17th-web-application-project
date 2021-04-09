<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>syllabusList</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <style>
        #subTitle{
            color: rgb(68,68,68); 
        }
        #table{
            border-top: 2px solid rgb(105, 153, 165);
            width: 80%;
        }
        #tableLeft{
            text-align: center;
            background: rgb(247,247,247);
            color:rgb(85, 85, 85);
        }
        .form-select{
            width:80%;
        }
        tr{
            text-align: center;
        }
		#content{
			background-color: white;
		}
    </style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	$(function(){
		$('#selectAll').click(function(){
			if ($("input:checkbox[id='selectAll']").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else{
				$("input[type=checkbox]").prop("checked", false);
			}
		})	
	})
	$(function(){
		$('#register').click(function(){
			location.href = ""
		})
	})
	
</script>
<body>
     <!-- 부가적인 테마 -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

     <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div id="content">
    <div id="subTitle" style="text-align: left">
        <h2>강의계획서 리스트</h2>
    </div>
    <div>
        <table id="table" style="margin-bottom:40px;">
            <tr>
                <th id="tableLeft">강의 분류</th>
                <td>
                    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                        <option selected>-- 1차 분류를 선택하세요 --</option>
                        <option value="유료과정">유료과정</option>
						<option value="재직자향상">재직자향상</option>
						<option value="채용예정자과정">채용예정자과정</option>
                    </select>
                </td>
                <td>
                    <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                        <option selected>-- 2차 분류를 선택하세요 --</option>
						<option value="OS 분야">OS 분야</option>
						<option value="IoT&모바일">IoT&모바일</option>
						<option value="SW공학">SW공학</option>
						<option value="클라우드">클라우드</option>
						<option value="웹 프로그래밍">웹 프로그래밍</option>
						<option value="빅데이터">빅데이터</option>
						<option value="non-IT">non-IT</option>
						<option value="OA">OA</option>
						<option value="분석/설계">분석/설계</option>
						<option value="프로젝트관리">프로젝트관리</option>
						<option value="오픈소스">오픈소스</option>
						<option value="모바일">모바일</option>
						<option value="보안">보안</option>
						<option value="네트워크">네트워크</option>
						<option value="프로그래밍">프로그래밍</option>
						<option value="데이터베이스">데이터베이스</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th id="tableLeft">단어 검색</th>
                <td><input type="text" class="form-control" placeholder="검색"></td>
                <td><button type="button">검색</button></td>
            </tr>
        </table>
    </div>
    <div>
        <table id="table">
            <tr>
            	<th><input type="checkbox" id="selectAll"></th>
                <th id="tableLeft">번호</th>
                <th id="tableLeft">분류</th>             
                <th id="tableLeft">강의명</th>
				<th id="tableLeft">교육일수</th>
				<th id="tableLeft">교육시간</th>
            </tr>
        <c:forEach var="syllabus" items="${syllabusList}" >
            <tr>
            	<td><input type="checkbox"></td>
                <td>${syllabus.syllabusID}</td>
                <td>${syllabus.syllabusCategory1} > ${syllabus.syllabusCategory2}</td>
                <td><a href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">${syllabus.syllabusName}</a></td>
				<td>${syllabus.syllabusTotalDays}</td>
				<td>${syllabus.syllabusTotalTime}</td>
            </tr>
        </c:forEach>
        </table>
    </div>
    <div style="width:35%; float: right;">
        <button type="button" onClick="location.href='syllabusForm.do'">강의계획서 등록</button>
        <button type="button">선택강좌 삭제</button>
    </div>
</div>
</body>
</html>