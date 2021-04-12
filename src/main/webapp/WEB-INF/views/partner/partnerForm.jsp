<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>   

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회사 등록</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>    
          
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
            rel="stylesheet">
               
        <link rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <link id="bsdp-css"
            href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
            rel="stylesheet">
            
        <script src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
    
    <style>
        
        #main { /* 전체를 감싸서 적용 */
            width: auto
        }

        div.formtag { /* div 속 폼태그 전체 적용 */
            border-radius: 5px; 
            background-color: #f2f2f2; 
            padding: 40px;
            line-height: 15px;
        }

        #container1 { /* 이름 밑에 속성들을 감싸서 적용 */
            background-color: #f2f2f2;
            height: auto;
            width: 40%;
            position: relative;
            margin-bottom: 40px;
            padding-bottom: 40px;
            text-align: center;
			margin-left: auto;
			margin-right: auto;
			border-radius: 3px;
			font-family: 'Noto Sans KR', sans-serif;
    		
        }

        #field {
            background-color: #fafafa;
            height: auto;
            position: relative;
            margin-bottom: 40px;
            padding-bottom: 40px;
            margin-top: -50px;
        }

        #title_area {
            margin: 20px 10px 20px 10px;
        }

        .title { /* container 밑 속성값들의 이름 */
            margin: 60px 0px 0px 40px;
            display: inline-block;
            width: 100px;
            position: relative;   
        }

        .must { /* 속성값 옆 필수라는 빨간색 문구 */
            color: #fc0038;
            font-size: 12px;
            letter-spacing: -1px;
            margin-left: -20px;
            margin-right: 40px;   
        }

        .toggle { 
            display: inline-block;
            margin-top: 50px;
            margin-left: 35px;
        }
        div input[type="text"] { /* input type text 태그 지정*/
            width: 40%;
            padding: 10px 20px;
            display: inline-block;
            border: 1px solid #c8c8c0;
            box-sizing: border-box;
            margin-left: 8px;
            margin-right: 10px;
            line-height: 15px; 
        }
        .block1{
    		display: flex;
    	}
    	.block2{
    		width:90%;
    	}

    </style>
	<script type="text/javascript">
    	$('#partnerHeadCount').on("blur keyup", function() {
					$(this).val($(this).val().replace(/[ㄱ-힣a-zA-Z-]/g, ''));
				});
			

	</script>
	<!--이전으로 돌아가는 function -->
	<script type="text/javascript"> 
	$(document).ready(function(){
		$("#back").click(function(){

		window.history.back();
		location.href = document.referrer;
		

		});

	});
	</script>

</head>


<body>
  
    <form action="${contextPath}/partner/addPartner.do" accept-charset="UTF-8" method="POST" autocomplete="off">
        <div id="main">
       
            <div id="container1">
            <h2 style="padding-top: 30px;">기업 등록</h2>
            <div class="block1">
                <div class="block2">
                    <label class="title">사업자번호</label>
                    <input type="text" name="partnerLicenseNum" placeholder="사업자번호">
                </div>
                <div class="block2" style="margin-left: -4px;">
                    <label class="title">협약 상태</label>
                    <select id="partnerState" name="partnerState" size="1" style="width: 40%;  margin-left: 8px; margin-right: 10px;">
            			<option value="">선택하세요</option>
            			<option value="협력사">협력사</option>
            			<option value="협약사">협약사</option>
            			<option value="협약 진행중">협약 진행중</option>
            			<option value="미협약">미협약</option>
        			</select>
                </div>
           	</div>
            <div class="block1">
                <div class="block2">
                    <label class="title">기업명</label>
                    <input type="text" name="partnerName" placeholder="기업명">
                </div>
                <div class="block2">
                    <label class="title">기업 정보</label>
                    <input type="text" name="partnerInformation" placeholder="회사 정보">
                </div>
            </div>
            <div class="block1">
               <div class="block2">
                    <label class="title">기업 주소</label>
                    <input type="text"  name="partnerAddress"placeholder="기업 주소">
                </div>
                <div class="block2">
                    <label class="title">기업 전화번호</label>
                    <input type="text" name="partnerPhoneNumber" placeholder="기업 전화번호">
                </div>
            </div>
            <div class="block1">
                <div class="block2">
                    <label class="title">기업 이메일</label>
                    <input type="text"  name="partnerEmail" placeholder="기업 이메일">
                </div>
                <div class="block2">
                    <label class="title">대표명</label>
                    <input type="text" name="partnerCEO" placeholder="대표명">
                </div>
            </div>
            <div class="block1">
                <div class="block2">
                    <label class="title">인원규모</label>
                    <input type="text"  id="partnerHeadCount" name="partnerHeadCount" placeholder="숫자를 입력하세요.">
                    <div class="partnerHeadCount regex"></div>
                </div>
                <div class="block2">
                    <label class="title">기업 홈페이지</label>
                    <input type="text" name="partnerURL" placeholder="기업 홈페이지">
                </div>
            </div>
			<button type="submit" class="btn btn-secondary" style="margin-top:5%;" onClick="/partner/addPartner.do">등록</button>
			<button type="button" class="btn btn-secondary" style="margin-top:5%; " id="back" >이전</button>
        </div>
        </div>
    </form> 
    
    
     <script>
            $("#partnerHeadCount").on("input", function() {
			var regex = /^\d{1,}/;
			var result = regex.exec($("#partnerHeadCount").val());

			if (result != null) {
				$(".partnerHeadCount.regex").html("");
			} else {
				$(".partnerHeadCount.regex").html("숫자만 입력 가능합니다.");
			}
		})
    </script>
    
    
    
    
</body>

</html>