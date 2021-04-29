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
<title>과정 관리</title>

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>



<style>
a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	margin-left: 15%;
}

button {
	float: right;
	margin-right: 10px;
}
                                                                                                                    
.dataTables_wrapper {
	margin-top: 30px;
	display: inline-block;
	width: 100%;
}

</style>

</head>
<script type="text/javascript">
$(document).ready(function(){
   $('#myTable').DataTable({
      
      dom : 'lBfrtip',
      buttons: ['excel'],

      
      language: {
         info : '',
         sInfoFiltered : '',
         infoEmpty : '',
         emptyTable : '데이터가 없습니다.',
         thousands : ',',
         lengthMenu : '_MENU_ 개씩 보기',
         loadingRecords : '데이터를 불러오는 중',
         processing : '처리 중',
         zeroRecords : '검색 결과 없음',
         paginate : {
            first : '처음',
            last : '끝',
            next : '다음',
            previous : '이전'
         },
         search: '',
         sSearchPlaceholder: '통합 검색',
      
      }
   
   
   });
});
</script>
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
	function filterDate(){
		
		var value = document.getElementById("date").value /* 2021-04  */
		console.log(value);
	    var item = document.getElementsByClassName("item");
	    for(var i=0;i<item.length;i++){
	    	var date = item[i].getElementsByClassName("date");
	    	
	    	if(date[0].innerText.toUpperCase().indexOf(value) > -1){
	    		item[i].style.display="table-row";
			}else{
				item[i].style.display="none";
			}
	    }	
	} 
</script>
<script type="text/javascript">
	function enter(){
	    /* 엔터키의 코드는 13입니다. */
		if(event.keyCode == 13){
			filter()  /* 실행할 이벤트 */
		}
	}
</script>
<script type="text/javascript">
	/* 달력picker, 키보드로도 입력가능[ex)2021/4], format: "mm/yyyy" 등 으로 변경가능 */ 
	$(document).ready(function() {
		$('#sandbox-container input').datepicker({
			format : "yyyy-mm",
			startView : 1,
			minViewMode : 1,
			language : "ko",
			keyboardNavigation : false,
			forceParse : false,
			autoclose : true
		});
	});
</script>
<script>
	function closeCheck(){
		/*if (${isLogOn == true}){*/
			var url = "/springEx/course/closeCheck.do";
			var cnt = $("input[name='ab']:checked").length;
			var valueArr = new Array();
			$("input[name='ab']:checked").each(function(i){
				valueArr.push($(this).val());
			});
			if(cnt==0){
				Swal.fire("선택된 과정이 없습니다.","","warning");
			}
			else{	
				$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(data){
						console.log("success");
						window.location.reload();
						
					},
					error : function(data) { 
			            console.log("fail");
			        }
				})
			}
		/*}
		else{
			alert("로그인 후 시도해주세요.");
		}*/
	};
</script>
<script>
	function openCheck(){
		/*if (${isLogOn == true}){*/
			var url = "/springEx/course/openCheck.do";
			var cnt = $("input[name='ab']:checked").length;
			var valueArr = new Array();
			$("input[name='ab']:checked").each(function(i){
				valueArr.push($(this).val());
			});
			
			if(cnt==0){
				Swal.fire("선택된 과정이 없습니다.","","warning");
			}
			else{
				$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(data){
						console.log("success");
						window.location.reload();
						
					},
					error : function(data) { 
			            console.log("fail");
			        }
				})
			}
		/*}
		else{
			alert("로그인 후 시도해주세요.");
		}*/
	};	
</script>
<script>
	function deleteCheck(){
		
		/*if (${isLogOn == true}){*/
			var url = "/springEx/course/deleteCheck.do";
			var cnt = $("input[name='ab']:checked").length;
			var valueArr = new Array();
			$("input[name='ab']:checked").each(function(i){
				valueArr.push($(this).val());
			});
			if (cnt==0){
				Swal.fire("선택된 강의계획서가 없습니다.","","warning");
			}else{
				$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(data){
						console.log("success");
						window.location.reload();
						/*$("#container").load("${contextPath}/syllabus/syllabusList.do");*/
					},
					error : function(data) {
						Swal.fire("선택한 강의계획서를 사용하는 강의가 있습니다.","","error");
						console.log("fail");
			        }
				})
			}
		/*}
		else{
			alert("로그인 후 시도해주세요.");
		}*/
	};		
</script>
<script>
function register(){
	location.href='${contextPath}/course/courseRegister.do'
	/*if (${isLogOn == true}){
		location.href='${contextPath}/course/courseRegister.do'
	}
	else{
		alert("로그인 후 시도해주세요.");
	}*/
};
</script>

<body>

   <div class="container">

         <div class="lnb">
            <ul>
               <li><a href="/springEx/main.do">홈</a></li>
               <li style="color: grey; font-weight: bold;">〉</li>
               <li class="on"><a href="/springEx/course/courseList.do">과정
                     관리</a></li>
            </ul>
         </div>
<!-- 
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
                     <label class="searchTitle">마감상태</label>
                     <div class="col-md-8">
                        <select class="form-select" aria-label="Default select example">
                           <option selected>-- 선택 --</option>
                           <option value="신청">신청중</option>
                           <option value="조기마감">조기마감</option>
                           <option value="마감">마감</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <div class="serarchSubject">
                     <label class="searchTitle">날짜검색</label>
						<div class="col-md-8">
							<div id="sandbox-container">
								<div class="input-group date" style="width: 88%;">
									<input type="text" id="date" class="form-control" placeholder="수강기간을 선택해주세요." onchange="filterDate()">
								</div>
							</div>
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
 -->
         <table class="table_" id="myTable">
            <thead>
               <tr align="center">
                  <td><input type="checkbox" name="check-all"
                     onclick='selectAll(this)' /></td>
                  <td><b>번호</b></td>
                  <td><b>과정명</b></td>
                  <td><b>수강인원</b></td>
                  <td><b>교육비</b></td>
                  <td><b>접수기간</b></td>
                  <td><b>수강기간</b></td>
                  <td><b>상태</b></td>
               </tr>
            </thead>

            <tbody id="ajaxTable">
               <c:forEach var="courseVO" items="${courseList}">
                  <tr class="item">
                     <td><input type="checkbox" name="ab" value="${courseVO.courseID}"
                        onclick='checkSelectAll(this)' /></td>
                     <td>${courseVO.courseID}</td>
                     <td class="name"><a href="${contextPath}/course/selectCourse.do?courseID=${courseVO.courseID}">[${courseVO.syllabusVO.syllabusCategory1} > ${courseVO.syllabusVO.syllabusCategory2}]<br>${courseVO.syllabusVO.syllabusName}</a></td>
                     <td>${courseVO.coursePeopleMax}</td>
                     <td>${courseVO.courseFee}</td>
                     <td>${courseVO.courseApplyStart}~${courseVO.courseApplyEnd}</td>
                     <td class="date">${courseVO.courseStart}~${courseVO.courseEnd}</td>
                     <td>${courseVO.courseState}</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>

         <div style="margin-top: 50px; padding-bottom: 150px;">
            <button class="btn btn-outline-danger" type="button" onClick="closeCheck();">선택과정 조기마감</button>
            <button class="btn btn-outline-danger" type="button" onClick="openCheck();">선택과정 접수중</button>
            <button class="btn btn-outline-danger"
               onClick="register()">교육과정 등록</button>
         </div>
   </div>
</body>
</html>