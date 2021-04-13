<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<html>
<head>
<meta charset="UTF-8">
<title>회사 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
	
<!--  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
    <link rel="stylesheet" type="text/css" href="/juliet/resources/juliet.css">
    
    <link id="bsdp-css" href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />-->
    
    <style>
    	.content{
    		width:80%;
            font-family: 'Noto Sans KR', sans-serif;
    		margin-left: 10%;
    	}
        .partnerTitle {
            text-align: left;
            font-size: 28px;
            font-weight: bold;
            padding-left: 10px;
        }

        .line {
            height: 5px;
            border: none;
            background-color: rgba(190, 190, 190, 0.8);
        }

        form {
            margin: auto;
        }

        .well-searchbox label {
            color: #555;
            width: 20%;
            margin: 10px;
            text-align: right;
        }

        .serarchSubject {
            display: flex;
            flex-direction: row;
            width: 250px;
            float: right;
        }

        .subject {
            display: flex;
            flex-direction: row;
        }

        .col {
            font-size: 13px;
        }

        .table_partnerList {
            border-collapse: collapse;
            font-size: 14px;
            line-height: 2.2;
            margin-top: 12px;
            text-align: center;
            color: #555;
            width: 100%;
            margin: auto;
            line-height: 40px;
        }

        .table_partnerList thead>tr>th {
            border-top: 1px solid #e4e4e4;
            border-bottom: 1px solid #e4e4e4;
            background-color: #f8f8f8;
            text-align: center;
        }

        .button_approve {
            display: inline-block;
            margin-bottom: 0;
            font-weight: 400;
            text-align: center;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            white-space: nowrap;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.428571429;
            border-radius: 4px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
            color: #fff;
            background-color: #28a745;
            border-color: #28a745;
        }
        .form-control {
            width: 180px;
        }

        .pageNav {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            margin-top: 5%;
        }

        .informationNow {
            text-align: center;
        }

        .informationAll {
            text-align: center;
            display:flex;
           	flex-wrap: wrap;
           	justify-content:space-around;
           	margin-top: 5%;
            
        }
        .card 
        .cardContent1{
        	font-size: 40px; 
        	font-weight: 400;
        	color: rgba(255, 255, 255, 0.7);
        }
        .cardContent2{
        	font-weight: bolder; 
        	font-size: 40px;
        	color: rgba(255, 255, 255, 0.7);
        
        }

        .partnerStateNum {
            border-left: 10px solid red;
            height: 30%;
            width: auto;
            text-align:center;
            vertical-align: middle;
            text-shadow: 2px 2px 2px gray;
            font-size:30px;
            

        }

        .status_cooperation {
            height: 30px;
            width: 77px;
            border-radius: 5px;
            background-color: #ee4035;
            line-height: 30px;
            color: white
        }

        .status_convention {
            height: 30px;
            width: 77px;
            border-radius: 5px;
            background-color: #0392cf;
            line-height: 30px;
            color: white
        }
         .status_ing {
        	line-height: 30px;
       		height: 30px;
       		width: 77px;
            border-radius: 5px;
            background-color: #7bc043;
            color: white;
            margin-left: 10px;
    		margin-right: 10px;
    		margin-bottom: 3px;
    		margin-top: 3px;
        }

        .status_not {
            height: 30px;
            width: 77px;
            border-radius: 5px;
            background-color: gray;
            line-height: 30px;
            color: white
        }

        .buttonGroups {
            float: right;
        }
         .button_bottom {
    		background-color: tomato;
   			float: right;
   			 margin-left: 10px;
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
    		transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
    	}
    </style>
    <script src="https://unpkg.com/sweetalert/dist/sweeta;ert.min.js">></script>
    
  <script type="text/javascript">
               var result = '${msg}';
               var name = '${partnerName}'
               
               if (result == 'modSuccess') {
            	   window.onload=function() {
                	   swal("수정 완료",(name + " 기업 수정 완료"),"success")
                	   
            	   }
               }else if (result == 'removeSuccess'){
            	   window.onload=function() {
            		   swal("삭제 완료",(name + " 기업 삭제 완료"),"success");
            	   }
               }else if (result == 'addSuccess'){
            	   window.onload=function() {
            		   swal("등록 완료",(name + " 기업 등록 완료"),"success");
            	   }
               }
        </script>
        
</head>
<body>
<div id="container">
<div class="content">
<div class="lnb">
        <ul>
            <li><a href="${contextPath}/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a href="${contextPath}/partner/partnerList.do">협력사 관리</a></li>
        </ul>
    </div>
    <div class="informationAll">
        <div class="card text-white" style="width:17%; ">
           <div class="card-body" style="background-color: #ee4035;">
           <div class="cardContent1" >협력사 </div>
           <div class="cardContent2">${numCooperation}</div>
        </div>
        </div>
        <div class="card text-white" style="width:17%; ">
        <div class="card-body" style="background-color: #0392cf; ">
           <div class="cardContent1" > 협약사</div>
             <div class="cardContent2">${numConvention}</div>
        </div>
        </div>
        <div class="card text-white" style="width:17%; ">
        <div class="card-body" style="background-color: #7bc043; ">
            <div class="cardContent1" >협약 진행중</div>
             <div class="cardContent2"> ${numIng}</div>
        </div>
        </div>
        <div class="card text-white" style="width:17%; ">
        <div class="card-body" style="background-color: gray; ">
           <div class="cardContent1" > 미협약 </div>
            <div class="cardContent2">${numNot}</div>
        </div>
        </div>
    </div>

    <br>
    <br>
    <br>
    
    <div class="rightButtonGroup">
        <div class="serarchSubject">
            <input type="text" class="form-control" placeholder="기업명">
            <button type="submit" class="btn btn-success">검색</button>
        </div>
        <br>
        <br>
        
        <div class="buttonGroups">
            <button type="button" class="btn" onClick="location.href='${contextPath}/partner/partnerForm.do'">등록</button>
            <button type="button" class="btn">삭제</button>
        </div>
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
    <table class="table_partnerList">
        <thead>
            <tr>
                <th><input type="checkbox" /></th>
                <th width="100"><b>상태</b></th>
                <th width="200"><b>기업명</b></th>
                <th><b>이메일</b></th>
                <th><b>전화번호</b></th>
                <th><b>사업자등록번호</b></th>
                <th><b>등록일</b></th>
                <th><b>상세정보</b></th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="partner" items="${partnerList}" >
   				<tr align="center">
   				<td><input type="checkbox" /></td>
				<td>
				<c:choose>
    				<c:when test="${partner.partnerState eq '협력사       '}">  <!-- 협력사면 빨간색바탕으로 출력 -->
    					<div class="status_cooperation">협력사</div> 
    				</c:when>
    				<c:when test="${partner.partnerState eq '협약사       '}">  <!-- 협약사면 파란색바탕으로 출력 -->
    					<div class="status_convention">협약사</div> 
    				</c:when>
    				<c:when test="${partner.partnerState eq '협약 진행중'}">    <!-- 협약 진행중이면 녹색바탕으로 출력 -->
    					<div class="status_ing">협약 진행중</div> 
    				</c:when> 
    				<c:when test="${partner.partnerState eq '미협약       '}">   <!--미협약이면 회색바탕으로 출력 -->
    					<div class="status_not">미협약</div> 
    				</c:when>
    			</c:choose>
    			</td>
      			<td>${partner.partnerName}</td>
      			<td>${partner.partnerEmail}</td>
      			<td>${partner.partnerPhoneNumber}</td>
      			<td>${partner.partnerLicenseNum}</td>
      			<td>${partner.partnerRegisterDate}</td>
      			<td><button type="button" class="btn" style="background-color: rgb(0 0 0 / 25%);" onClick="location.href='${contextPath}/partner/detailInfoPartner.do?partnerLicenseNum=${partner.partnerLicenseNum}'">상세정보</button></td>
    			</tr>
  			</c:forEach> 
        </tbody>
    </table>
    <div class="buttonGroups">
        <button type="button" class="btn " onClick="location.href='${contextPath}/partner/partnerForm.do'">등록</button>
        <button type="button" class="btn ">삭제</button>
    </div>
    <!--paginate -->
									<div class="paginate">
										<div class="paging">
											<a class="direction prev" href="javascript:void(0);"
												onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
												&lt;&lt; </a> <a class="direction prev"
												href="javascript:void(0);"
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
 </div>
 </div>
<script>
//10,20,30개씩 selectBox 클릭 이벤트
function changeSelectBox(currentPage, cntPerPage, pageSize){
    var selectValue = $("#cntSelectBox").children("option:selected").val();
    movePage(currentPage, selectValue, pageSize);
    
}
 
//페이지 이동
function movePage(currentPage, cntPerPage, pageSize){
    var url = "${pageContext.request.contextPath}/partner/partnerList.do";
    url = url + "?currentPage="+currentPage;
    url = url + "&cntPerPage="+cntPerPage;
    url = url + "&pageSize="+pageSize;
    
    location.href=url;
}
 
</script>
</body>

</html>
