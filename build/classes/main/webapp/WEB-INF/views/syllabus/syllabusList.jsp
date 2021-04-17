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



<style>
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

.well-searchbox {
   min-height: 20px;
   min-width: 400px;
   padding: 19px;
   top: 90px;
   background: #f8f8f8;
   margin-bottom: 20px;
   padding-bottom: 0px;
   border: 1px solid #e3e3e3;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
   box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
   margin-top: 30px;
}

.well-searchbox label {
   /* color: #555; */
   width: 20%;
   margin: 10px;
   text-align: right;
}

.btn {
   color: white;
   display: inline-block;
   font-weight: 400;
   text-align: center;
   vertical-align: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
   background-color: tomato;
   border-color: rgba(247, 94, 94, 0 .8);
   padding: .375rem .75rem;
   font-size: 1rem;
   line-height: 1.5;
   border-radius: .25rem;
   transition: color .15s ease-in-out, background-color .15s ease-in-out,
      border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.button_bottom {
   background-color: tomato;
   float: right;
   margin-left: 10px;
}

.serarchSubject {
   display: flex;
   flex-direction: row;
}

.subject {
   display: flex;
   flex-direction: row;
}

.table_syllabusList {
   border-collapse: collapse;
   font-size: 14px;
   line-height: 2.2;
   margin-top: 40px;
   text-align: center;
   /* color: #555; */
   width: 100%;
   line-height: 40px;
}

.table_syllabusList thead {
   border-top: 1px solid #e4e4e4;
   border-bottom: 1px solid #e4e4e4;
   background-color: #f8f8f8;
   text-align: center;
}

.form-control {
   border: hidden;
   width: 88%;
}

.form-select {
   border: hidden;
   width: 41%;
   display: inline-block;
   margin-right: 6%;
}

.col-md-8 {
   display: inline-block;
   text-align: left;
}

.searchTitle {
   margin-right: 20px;
}

</style>

</head>

<script type="text/javascript">
   function checkSelectAll(checkbox)  {
      const selectall 
        = document.querySelector('input[name="check-all"]');
      if(checkbox.checked == false)  {
        selectall.checked = false;
      }
    }

    function selectAll(selectAll)  {
      const checkboxes 
         = document.getElementsByName('ab');
      
      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked
      })
    }
</script>
<script type="text/javascript">
	function filter(){
	
	    var value = document.getElementById("value").value.toUpperCase();
	    var item = document.getElementsByClassName("item");
	    
	    for(var i=0;i<item.length;i++){
	    	var name = item[i].getElementsByClassName("name");
	    	if(name[0].innerText.toUpperCase().indexOf(value) > -1){
	    		item[i].style.display="table-row";
			}else{
				item[i].style.display="none";
			}
	    }	
	} 
</script>
<script type="text/javascript">
	function enter(){
	    // 엔터키의 코드는 13입니다.
		if(event.keyCode == 13){
			filter()  // 실행할 이벤트
		}
	}
</script>
<script>
	function deleteCheck(){
		var url = "/springEx/syllabus/deleteCheck.do";
		var cnt = $("input[name='ab']:checked").length;
		var valueArr = new Array();
		$("input[name='ab']:checked").each(function(i){
			valueArr.push($(this).val());
		});
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
				valueArr : valueArr
			},
			success : function(data){
				console.log("success");
				/*window.location.reload();*/
				$("#container").load("${contextPath}/syllabus/syllabusList.do");
			},
			error : function(data) { 
	            console.log("fail");
	        }
		});
	};
		
		
</script>
<body>

   <div class="container">
      <form method="post" action="${contextPath}/syllabus/insertSyllabus.do">

         <div class="lnb">
            <ul>
               <li><a href="/springEx/main.do">홈</a></li>
               <li style="color: grey; font-weight: bold;">〉</li>
               <li class="on"><a href="/springEx/syllabus/syllabusList.do">강의계획서
                     관리</a></li>
            </ul>
         </div>

         <div class="well-searchbox">
            <form class="form-horizontal" role="form">
               <div class="form-group">
                  <div class="serarchSubject">
                     <label class="searchTitle">강의분류</label>
                     <div class="col-md-8">
                        <select class="form-select" aria-label="Default select example">
                           <option selected>-- 1차 분류를 선택하세요 --</option>
                           <option value="유료과정">유료과정</option>
                           <option value="재직자향상">재직자향상</option>
                           <option value="채용예정자과정">채용예정자과정</option>
                        </select><select class="form-select" aria-label="Default select example">
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
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <div class="serarchSubject">
                     <label class="searchTitle">강의명</label>
                     <div class="col-md-8">
                        <input type="text" id="value" class="form-control" onKeyPress="JavaScript:enter();"
                           placeholder="일부 단어만으로도 검색이 가능합니다.">
                           <input type="text" style="display: none;" />
                     </div>
                  </div>

                  <div class="col-sm-offset-4 col-sm-5"
                     style="display: inline-block; text-aglin: center;">
                     <button type="button" class="btn button_search" onClick="filter()"
                        style="margin-top: 10px;">검색</button>
                  </div>
               </div>
            </form>
         </div>

         <table class="table_syllabusList">
            <thead>
               <tr align="center">
                  <td><input type="checkbox" name="check-all"
                     onclick='selectAll(this)' /></td>
                  <td><b>번호</b></td>
                  <td><b>분류</b></td>
                  <td><b>강의명</b></td>
                  <td><b>교육일수</b></td>
                  <td><b>교육시간</b></td>
               </tr>
            </thead>

            <tbody id="ajaxTable">
               <c:forEach var="syllabus" items="${syllabusList}">
                  <tr class="item">
                     <td><input type="checkbox" name="ab" value="${syllabus.syllabusID}"
                        onclick='checkSelectAll(this)' /></td>
                     <td>${syllabus.syllabusID}</td>
                     <td>${syllabus.syllabusCategory1} > ${syllabus.syllabusCategory2}</td>
                     <td class="name"><a
                        href="${contextPath}/syllabus/selectSyllabus.do?syllabusID=${syllabus.syllabusID}">${syllabus.syllabusName}</a></td>
                     <td>${syllabus.syllabusTotalDays}</td>
                     <td>${syllabus.syllabusTotalTime}</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>

         <div style="margin-top: 50px; padding-bottom: 150px;">
            <button class="btn button_bottom" type="button" onClick="deleteCheck();">선택강의 삭제</button>
            <button class="btn button_bottom"
               onClick="location.href='syllabusForm.do'">강의계획서 등록</button>
         </div>

         <div>여기에 페이징</div>
      </form>
   </div>
</body>
</html>