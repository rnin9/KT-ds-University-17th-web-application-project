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
<title>공지사항 관리</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />


<style>
.bg-primary {
	background-color: white !important;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
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
		var url = "/springEx/notice/deleteCheck.do";
		var cnt = $("input[name='ab']:checked").length;
		var valueArr = new Array();
		$("input[name='ab']:checked").each(function(i){
			valueArr.push($(this).val());
		});
		console.log(valueArr);
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
				/*$("#container").load("${contextPath}/notice/listNotice.do");*/
			},
			error : function(data) { 
	            console.log("fail");
	        }
		});
	};
</script>

<body>

	<div class="container">
		<form method="post" action="${contextPath}/notice/insertNotice.do">

			<div class="lnb">
				<ul>
					<li><a href="/springEx/main.do">홈</a></li>
					<li style="color: grey; font-weight: bold;">〉</li>
					<li class="on"><a href="/springEx/notice/listNotice.do">공지사항
							관리</a></li>
				</ul>
			</div>

			<div class="well-searchbox">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<div class="serarchSubject">
							<label class="searchTitle">분류</label>
							<div class="col-md-8">
								<select class="form-select" aria-label="Default select example">
									<option selected>-- 분류를 선택하세요 --</option>
									<option value="유료과정">일반</option>
									<option value="재직자향상">채용예정자</option>
									<option value="채용예정자과정">긴급</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="serarchSubject">
							<label class="searchTitle">검색</label>
							<div class="col-md-8">
								<input type="text" id="value" class="form-control"
									onKeyPress="JavaScript:enter();" placeholder="제목으로 검색">
								<input type="text" style="display: none;" />
							</div>
						</div>

						<div class="col-sm-offset-4 col-sm-5"
							style="display: inline-block; text-aglin: center;">
							<button type="button" class="btn button_search"
								onClick="filter()" style="margin-top: 10px;">검색</button>
						</div>
					</div>
				</form>
			</div>


			<div class="bottom">
				<div class="bottom-left">
					<select id="cntSelectBox" name="cntSelectBox"
						onchange="changeSelectBox(${pagination.currentPage},${pagination.cntPerPage},${pagination.pageSize});"
						class="form-control" style="width: 100px;">
						<option value="10"
							<c:if test="${pagination.cntPerPage == '10'}">selected</c:if>>10개씩</option>
						<option value="20"
							<c:if test="${pagination.cntPerPage == '20'}">selected</c:if>>20개씩</option>
						<option value="30"
							<c:if test="${pagination.cntPerPage == '30'}">selected</c:if>>30개씩</option>
					</select>
				</div>
			</div>
			<table class="table_">
				<thead>
					<tr align="center">
						<td><input type="checkbox" name="check-all"
							onclick='selectAll(this)' /></td>
						<td><b>분류</b></td>
						<td><b>제목</b></td>
						<td><b>작성자</b></td>
						<td><b>작성일</b></td>
						<td><b>조회</b></td>
					</tr>
				</thead>

				<tbody id="ajaxTable">
					<c:forEach var="noticeList" items="${noticeList}">
						<tr class="item">
							<td><input type="checkbox" name="ab"
								value="${noticeList.notice_no}" onclick='checkSelectAll(this)' /></td>
							<td>${noticeList.notice_category}</td>
							<td class="name"><a
								href="${contextPath}/notice/readNotice.do?notice_no=${noticeList.notice_no}">${noticeList.notice_title}</a></td>
							<td>${noticeList.notice_adminID}</td>
							<td>${noticeList.notice_date}</td>
							<td>${noticeList.notice_hit}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>



			<div style="margin-top: 50px; padding-bottom: 150px;">
				<button class="btn button_bottom" type="button"
					onClick="deleteCheck();">선택강의 삭제</button>
				<button class="btn button_bottom"
					onClick="location.href='noticeForm.do'">공지사항 등록</button>
			</div>





			<!--paginate -->
			<div class="paginate">
				<div class="paging">
					<a class="direction prev" href="javascript:void(0);"
						onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
						&lt;&lt; </a> <a class="direction prev" href="javascript:void(0);"
						onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
						&lt; </a>

					<c:forEach begin="${pagination.firstPage}"
						end="${pagination.lastPage}" var="idx">
						<a
							style="color:<c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
							href="javascript:void(0);"
							onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
								value="${idx}" /></a>
					</c:forEach>
					<a class="direction next" href="javascript:void(0);"
						onclick="movePage(${pagination.currentPage}<c:if test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
						&gt; </a> <a class="direction next" href="javascript:void(0);"
						onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
						&gt;&gt; </a>
				</div>
			</div>
			<!-- /paginate -->





			<script>
function changeSelectBox(currentPage, cntPerPage, pageSize){
    var selectValue = $("#cntSelectBox").children("option:selected").val();
    movePage(currentPage, selectValue, pageSize);
    
}
 
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    var url = "${pageContext.request.contextPath}/notice/listNotice.do";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>

		</form>
	</div>
</body>
</html>
