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
<title>이력서 관리</title>

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/modal.css" />

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
	display: flex;
	flex-wrap: wrap;
	width: 75%;
	justify-content: space-around;
	flex-direction: column;
	padding-bottom: 200px;
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

/* .resumeList {
   border-collapse: collapse;
   font-size: 14px;
   line-height: 2.2;
   margin-top: 40px;
   text-align: center;
   width: 100%;
   line-height: 40px;
} */
#item {
	border-color: grey;
	border-radius: .25rem;
	border-size: 1px;
}

#btn {
	margin-left: -20px;
}

#resumeTable {
	color: black;
	font-family: 'Noto Sans KR', sans-serif;
	width: 600px;
	margin-right: 40px;
}

#resumeTable th {
	text-align: center;
	background-color: #eee;
}

#resumeTable td {
	padding: 5px;
}

#resCarr>th {
	colspan: 2;
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
<script type="text/javascript">
$(document).ready(function(){
   $('#table_id').DataTable({
       dom : 'lBfrtip',
         buttons: [],

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
<!-- resumeInfo script -->
<script>

  $(document).ready(function () {
      let activeTab = sessionStorage.getItem('activeTab');
      // get Tab value
      $('#myTab a[href="'+activeTab+'"]').trigger('click');
      $(".next").click(function(){
         
        $( '.modal-body' ).animate( { scrollTop : 0 }, 1000 );
     current_fs = $(this).parent();
      next_fs = $(this).parent().next();
      
      //Add Class Active
      $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

      //show the next fieldset
      next_fs.show();
      //hide the current fieldset with style
      current_fs.animate({opacity: 0}, {
      step: function(now) {
      // for making fielset appear animation
      opacity = 1 - now;

      current_fs.css({
      'display': 'none',
      'position': 'relative'
      });
      next_fs.css({'opacity': opacity});
      },
      duration: 600
      });
      });

      $(".previous").click(function(){
     
      $( '.modal-body' ).animate( { scrollTop : 0 }, 1000 );
         
      current_fs = $(this).parent();
      previous_fs = $(this).parent().prev();

      //Remove class active
      $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

      //show the previous fieldset
      previous_fs.show();

      //hide the current fieldset with style
      current_fs.animate({opacity: 0}, {
      step: function(now) {
      // for making fielset appear animation
      opacity = 1 - now;

      current_fs.css({
      'display': 'none',
      'position': 'relative'
      });
      previous_fs.css({'opacity': opacity});
      },
      duration: 600
      });
      });

      $('.radio-group .radio').click(function(){
      $(this).parent().find('.radio').removeClass('selected');
      $(this).addClass('selected');
      });

      $("#reset").click(function(){
         location.reload();
     });
  })
  // reloading
  function getResumeInfo(resumeID, resumeUser, userName, resumePic) {
     
     $.ajax({            // get Resumes
          method: "GET",
          url: "${contextPath}/resume/resumeInfo.do?resumeID="+resumeID+"&resumeUser="+resumeUser,
          success: (resp) => {   // when success
             console.log(resp);
             var now = new Date();   //get current Date
             var year = now.getFullYear();   // get Current Year
             var yyyy=resp.resume.memberVO.birth.substr(0,4);
             var mm = resp.resume.memberVO.birth.substr(4,2);
             var dd = resp.resume.memberVO.birth.substr(6,2);
             var age = year-parseInt(yyyy)+1;
             var phone1 = resp.resume.memberVO.userPhoneNumber.substr(0,3);
             var phone2 = resp.resume.memberVO.userPhoneNumber.substr(3,4);
             var phone3 = resp.resume.memberVO.userPhoneNumber.substr(7,4);
          
             
             $("#modal_title").text(userName+"의 이력서");
              $("#resName").text(resp.resume.memberVO.userName);
              $("#resPic").attr('src', '${pageContext.request.contextPath}/resources/image/resume/'+resumePic)
              $("#resEngName").text(resp.resume.resumeForeign);
              $("#resAge").text(age);
              $("#resGender").text(resp.resume.memberVO.userGender);
              $("#resBirth").text(yyyy+"년 "+mm+"월 "+dd+"일");
              $("#resAddress").text(resp.resume.memberVO.userAddress1+" "+resp.resume.memberVO.userAddress2);
              $("#resPhone").text(phone1+"-"+phone2+"-"+phone3);
              $("#resEmail").text(resp.resume.memberVO.userEmail);
              $("#resLastEdu").text(resp.resume.resumeLastEdu+"("+resp.resume.resumeSchool+")");
              $("#resMajor").text(resp.resume.memberVO.userMajor);
              $("#resGrade").text(resp.resume.resumeGrade);
              
              $("#resCtx1").html(resp.resume.resumeContext1);
              $("#resCtx2").html(resp.resume.resumeContext2);
              $("#resCtx3").html(resp.resume.resumeContext3);
              $("#resCtx4").html(resp.resume.resumeContext4);
              
              if(resp.resume.resumeContext5 == null){
                 $("#resCtx5").html("");
              } else{
                 $("#resCtx5").html(resp.resume.resumeContext5);
              }
              
              
                if (resp.certificate != null) {
                 for(i=0; i<resp.certificate.length; i++) { // when Certificate is Exist
                    var certificate_list = "";
                    var c_yyyy=resp.certificate[i].certificateDate.substr(0,4);
                    var c_mm = resp.certificate[i].certificateDate.substr(4,2);
                    var c_dd = resp.certificate[i].certificateDate.substr(6,2);
                    
                    certificate_list += "<tr>";
                    certificate_list += "<td>"+resp.certificate[i].certificateName+"</td>";
                    certificate_list += "<td>"+resp.certificate[i].certificateEnforcement+"</td>";
                    certificate_list += "<td>"+c_yyyy+"년 "+c_mm+"월 "+c_dd+"일"+"</td>";
                    certificate_list += "</tr>";
                    
                    $("#resCert").append(certificate_list);
                  }
                }
              
                 
                  if (resp.foreign != null) {
                     for(i=0; i<resp.foreign.length; i++) { // when Foreign Certificate is exist
                        var foreign_list = "";
                        var f_yyyy=resp.foreign[i].foreignDate.substr(0,4);
                        var f_mm = resp.foreign[i].foreignDate.substr(4,2);
                        var f_dd = resp.foreign[i].foreignDate.substr(6,2);
                        
                        foreign_list += "<tr>";
                        foreign_list += "<td>"+resp.foreign[i].foreignCriteria+"</td>";
                        foreign_list += "<td>"+resp.foreign[i].foreignName+"</td>";
                        foreign_list += "<td>"+resp.foreign[i].foreignScore+"</td>";
                        foreign_list += "<td>"+f_yyyy+"년 "+f_mm+"월 "+f_dd+"일 "+"</td>";
                        foreign_list += "</tr>";
                        
                        $("#resFor").append(foreign_list);
                      }    
                 }
                 
                  if (resp.career != null) {
                      for(i=0; i<resp.career.length; i++) { // when career is Exist
                         var career_list = "";
                         var caStart_yyyy=resp.career[i].careerStartdate.substr(0,4);
                         var caStart_mm = resp.career[i].careerStartdate.substr(4,2);
                         var caStart_dd = resp.career[i].careerStartdate.substr(6,2);
                         var caEnd_yyyy=resp.career[i].careerEnddate.substr(0,4);
                         var caEnd_mm = resp.career[i].careerEnddate.substr(4,2);
                         var caEnd_dd = resp.career[i].careerEnddate.substr(6,2);
                         
                         if(resp.career[i].careerCheck == "C"){
                            
                            career_list += "<tr>";
                            career_list += "<th>"+"회사명"+"</th>";
                             career_list += "<th>"+resp.career[i].careerCenter+"</th>";
                             career_list += "</tr>";
                             career_list += "<tr>";
                             career_list += "<td>"+"경력기간"+"</td>";
                             career_list += "<td>"+caStart_yyyy+"."+caStart_mm+"."+caStart_dd+" ~ "+caEnd_yyyy+"."+caEnd_mm+"."+caEnd_dd+"</td>";
                             career_list += "</tr>";
                             career_list += "<tr>";
                             career_list += "<td>"+"직위"+"</td>";
                             career_list += "<td>"+resp.career[i].careerPosition+"</td>";
                             career_list += "</tr>";
                             career_list += "<tr>";
                             career_list += "<td>"+"고용형태"+"</td>";
                             career_list += "<td>"+resp.career[i].careerType+"</td>";
                             career_list += "</tr>";
                             $("#resCarr_C").append(career_list);
                          } else if(resp.career[i].careerCheck == "E") {
                             career_list += "<tr>";
                             career_list += "<th>"+"교육 기관"+"</th>";
                             career_list += "<th>"+resp.career[i].careerCenter+"</th>";
                             career_list += "</tr>";
                             career_list += "<tr>";
                             career_list += "<td>"+"교육 기간"+"</td>";
                             career_list += "<td>"+caStart_yyyy+"."+caStart_mm+"."+caStart_dd+" ~ "+caEnd_yyyy+"."+caEnd_mm+"."+caEnd_dd+"</td>";
                             career_list += "</tr>";
                             career_list += "<tr>";
                             career_list += "<td>"+"교육 시간"+"</td>";
                             career_list += "<td>"+resp.career[i].careerHour+"</td>";
                             career_list += "</tr>";
                             career_list += "<tr>";
                             career_list += "<td>"+"비고"+"</td>";
                             if(resp.career[i].careerOther == null){
                                career_list += "<td>"+" "+"</td>";
                             }
                             else{
                                career_list += "<td>"+resp.career[i].careerOther+"</td>";
                             }
                             
                             career_list += "</tr>";
                             $("#resCarr_E").append(career_list);
                        }
                      }
                  }
                           if (resp.project != null) {
                              for(i=0; i<resp.project.length; i++) { // when project is Exist
                                 var project_list = "";
                                 
                                 project_list += "<tr>";
                                 project_list += "<th style="+"width:108px"+">"+"기관명"+"</th>";
                                 project_list += "<th>"+resp.project[i].projectEnforcement+"</th>";
                                 project_list += "</tr>";
                                 project_list += "<tr>";
                                 project_list += "<td>"+"프로젝트 명"+"</td>";
                                 project_list += "<td>"+resp.project[i].projectName+"</td>";
                                 project_list += "</tr>";
                                 project_list += "<tr>";
                                 project_list += "<td>"+"개발환경 및 사용기술"+"</td>";
                                 project_list += "<td>"+resp.project[i].projectDev+"</td>";
                                 project_list += "</tr>";
                                 project_list += "<tr>";
                                 project_list += "<td>"+"프로젝트 소개"+"</td>";
                                 project_list += "<td>"+resp.project[i].projectContent+"</td>";
                                 project_list += "</tr>";
                                 project_list += "<tr>";
                                 project_list += "<td>"+"담당한 역할"+"</td>";
                                 project_list += "<td>"+resp.project[i].projectRole+"</td>";
                                 project_list += "</tr>";
                                 project_list += "<tr>";
                                 project_list += "<td>"+"관련링크"+"</td>";
                                 project_list += "<td>"+resp.project[i].projectURL+"</td>";
                                 project_list += "</tr>";
                                 
                                 $("#resPro").append(project_list);
                               }    
                          } 
              
          },
          error: (err) => {
              console.log("err: "+err);
      }
      })
     
    }
    
  function tabtab(h) {
      sessionStorage.setItem('activeTab', h);
      console.log('href   yyyy' + h);
  }

  </script>
<body>

	<div class="container">
		<div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-scrollable">
				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header">
						<h5 class="modal-title" id="modal_title"></h5>
						<button type="button" class="close" data-dismiss="modal">X</button>
					</div>
					<div class="modal-body">
						<div class="container-fluid" id="grad1">
							<div class="row justify-content-center mt-0">
								<div>
									<div class="card px-0 pt-4 pb-0 mt-3 mb-3">
										<div class="row">
											<div class="col-md-12 mx-0">
												<form id="msform">
													<!-- progressbar -->
													<ul id="progressbar">
														<li class="active" id="basic"><strong>기본정보</strong></li>
														<li id="personal"><strong>상세정보</strong></li>
														<li id="education"><strong>경력/교육사항</strong></li>
														<li id="project"><strong>프로젝트</strong></li>
														<li id="introduce"><strong>자기소개서</strong></li>
													</ul>
													<!-- fieldsets -->
													<fieldset id="init">
														<div class="form-card">
															<h2 class="fs-title">기본정보</h2>
															<table border id="resumeTable">
																<tr>
																	<th rowspan="4"><img id="resPic"
																		src="http://jjunstudio.com/zbxe/files/attach/images/351/652/85a698d051126aa4043e83f4ff2376a0.jpg"
																		style="width: 122px; height: 163px;" /></th>
																</tr>
																<tr>
																	<th>성명</th>
																	<td id="resName"></td>
																	<th>영문명</th>
																	<td id="resEngName"></td>
																</tr>
																<tr>
																	<!-- &nbsp; = ?? -->
																	<th colspan="1" style="width: 84px;">나이</th>
																	<td colspan="1" style="width: 165px;" id="resAge"></td>
																	<th colspan="1" width="15%">성별</th>
																	<td colspan="1" width="200px" id="resGender"></td>

																</tr>
																<tr>
																	<th colspan="1">생년월일</th>
																	<td colspan="3" id="resBirth"></td>
																</tr>
																<tr>
																	<th>주소</th>
																	<td colspan="4" id="resAddress"></td>
																</tr>
																<tr>
																	<th rowspan="2">연락처</th>
																	<th>H.P</th>
																	<td colspan="4" id="resPhone">000-0000-0000</td>
																</tr>
																<tr>
																	<th>Email</th>
																	<td colspan="4" id="resEmail">test@test.com</td>
																</tr>
																<tr>
																	<th rowspan="3">학력사항</th>
																	<th>최종학력</th>
																	<td colspan="4" id="resLastEdu">대학교졸업</td>
																</tr>
																<tr>
																	<th>전공</th>
																	<td colspan="4" id="resMajor">컴퓨터공학과</td>
																</tr>
																<tr>
																	<th>학점</th>
																	<td colspan="4" id="resGrade">4.0/4.5</td>
																</tr>

															</table>
														</div>
														<input type="button" name="next"
															class="next action-button" value="다음" />
													</fieldset>
													<fieldset>
														<div class="form-card">
															<h2 class="fs-title">자격증</h2>
															<table border id="resumeTable">
																<tr>
																	<th>자격증명</th>
																	<th>발행처/기관</th>
																	<th>취득일</th>
																</tr>
																<tbody id="resCert">
																</tbody>
															</table>

															<h2 class="fs-title" style="margin-top: 100px">어학시험</h2>
															<table border id="resumeTable">
																<tr>
																	<th>언어</th>
																	<th>시험종류</th>
																	<th>점수</th>
																	<th>취득일</th>
																</tr>
																<tbody id="resFor">
																</tbody>
															</table>
														</div>
														<input type="button" name="previous"
															class="previous action-button-previous" value="이전" /> <input
															type="button" name="next" class="next action-button"
															value="다음" />
													</fieldset>
													<fieldset>
														<div class="form-card">
															<h2 class="fs-title">경력사항</h2>
															<table border id="resumeTable">
																<tbody id="resCarr_C">
																</tbody>
															</table>
															<h2 class="fs-title" style="margin-top: 100px">교육사항</h2>
															<table border id="resumeTable">
																<tbody id="resCarr_E">
																</tbody>
															</table>

														</div>
														<input type="button" name="previous"
															class="previous action-button-previous" value="이전" /> <input
															type="button" name="next" class="next action-button"
															value="다음" />
													</fieldset>

													<fieldset>
														<div class="form-card">
															<h2 class="fs-title">프로젝트</h2>
															<table border id="resumeTable">
																<tbody id="resPro">
																</tbody>
															</table>
														</div>
														<input type="button" name="previous"
															class="previous action-button-previous" value="이전" /> <input
															type="button" name="next" class="next action-button"
															value="다음" />
													</fieldset>

													<fieldset>
														<div class="form-card">
															<h2 class="fs-title">자기소개서</h2>
															<table border id="resumeTable">
																<tr>
																	<th style="width: 98px;">성장과정</th>
																	<td id="resCtx1"></td>
																</tr>
																<tr>
																	<th>학교생활</th>
																	<td id="resCtx2"></td>
																</tr>
																<tr>
																	<th>성격(장/단점)</th>
																	<td id="resCtx3"></td>
																</tr>
																<tr>
																	<th>희망업무 및 장래포부</th>
																	<td id="resCtx4"></td>
																</tr>
																<tr>
																	<th>기타사항</th>
																	<td id="resCtx5"></td>
																</tr>


															</table>
														</div>
														<input type="button" name="previous"
															class="previous action-button-previous" value="이전" />
													</fieldset>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" id="reset" class="btn btn-default"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		<div class="pageIntro">대표이력서 관리</div>

		<table class="table_" id="table_id">
			<thead>
				<tr align="center">
					<td>아이디</td>
					<td>이름</td>
					<td>대표 이력서</td>
				</tr>
			<tbody id="ajaxTable">
				<c:forEach var="resumeAdmin" items="${resumeAdmin}">
					<tr id="item">
						<td>${resumeAdmin.resumeUser}</td>
						<td>${resumeAdmin.memberVO.userName}</td>
						<td class="name"><a
							 href="#myModal"
							data-toggle="modal"
							onclick="getResumeInfo('${resumeAdmin.resumeID}','${resumeAdmin.resumeUser}','${resumeAdmin.memberVO.userName}', '${resumeAdmin.resumePic}');">
								${resumeAdmin.resumeDate} </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>




	</div>
</body>
</html>