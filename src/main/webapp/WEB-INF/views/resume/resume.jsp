<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset="UTF-8">
<title>이력서 관리</title>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/modal.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
.sub_visual {
   font-family: 'Noto Sans KR', sans-serif;
   width: 100%;
   background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
      url("${pageContext.request.contextPath}/resources/image/sub_visual/resume.jpg");
   border: 0;
   font-size: 32px;
   font-weight: 500;
   height: 190px;
   padding-top: 69px;
   background-position: 50% 50%;
   background-size: cover;
   background-repeat: no-repeat;
}

a:link, a:visited, a:hover {
   color: black;
   text-decoration: none;
}

.resumeList {
   border-collapse: collapse;
   font-size: 14px;
   line-height: 2.2;
   margin-top: 40px;
   text-align: center;
   /* color: #555; */
   width: 100%;
   line-height: 40px;
}

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
</style>
<script>
$(document).on('click','#remove',function(e){
   var resumeID = $("input[name='check']:checked").val(); 
   data={}
   data.resumeID = resumeID
    Swal.fire({
           title:'삭제',
           text:'이력서를 삭제하시겠습니까?',
         icon:'warning',
           confirmButtonText: `삭제`,
           showCancelButton: true,
            confirmButtonColor: '#3085d6',
           cancelButtonText: `취소`,
           }).then((res) =>{
              if(res.isConfirmed){
                 $.ajax({
                  type : "post",
                  url : "${contextPath}/resume/deleteResume2.do",
                  contentType : "application/json; charset=UTF-8",
                  data:JSON.stringify(data),
                  success : function() {
                     alert("성공");
                     location.reload(true);
                  },
                  error : function() {
                  alert("실패")

                  }
                  });
                 
                 
              }
              else{
                 return;
              }
           })
   
});
</script>

<script type="text/javascript">
               var result = '${msg}';
               var name = '${resumeName}'
               
               if (result == 'removeSuccess'){
                  window.onload=function() {
                     swal("삭제 완료",(name + " 이력서 삭제 완료"),"success");
                  }
               }
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
          	 
             var resumeContext2 = resp.resume.resumeContext2;
             var resumeContext3 = resp.resume.resumeContext3;
             var resumeContext4 = resp.resume.resumeContext4;
             var resumeContext5 = resp.resume.resumeContext5;
             
             $("#modal_title").text(userName+"의 이력서");
              $("#resName").text(resp.resume.memberVO.userName);
              if(resumePic != "") {
                  $("#resPic").attr('src', '${pageContext.request.contextPath}/resources/image/resume/'+resumePic)
                  } else if(resumePic == "") {
                  $("#resPic").attr('src', '${pageContext.request.contextPath}/resources/image/resume/img.jpg')
                  }
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
                    if(resp.certificate[i].certificateDate != null) {
                    var c_yyyy=resp.certificate[i].certificateDate.substr(0,4);
                    var c_mm = resp.certificate[i].certificateDate.substr(4,2);
                    var c_dd = resp.certificate[i].certificateDate.substr(6,2);
                    
                    
                    certificate_list += "<tr>";
                    certificate_list += "<td>"+resp.certificate[i].certificateName+"</td>";
                    certificate_list += "<td>"+resp.certificate[i].certificateEnforcement+"</td>";
                    certificate_list += "<td>"+c_yyyy+"년 "+c_mm+"월 "+c_dd+"일"+"</td>";
                    certificate_list += "</tr>";
                    }
                    
                    $("#resCert").append(certificate_list);
                  }
                }
              
                 
                  if (resp.foreign != null) {
                     for(i=0; i<resp.foreign.length; i++) { // when Foreign Certificate is exist
                        var foreign_list = "";
                        if(resp.foreign[i].foreignDate != null) {
                        var f_yyyy=resp.foreign[i].foreignDate.substr(0,4);
                        var f_mm = resp.foreign[i].foreignDate.substr(4,2);
                        var f_dd = resp.foreign[i].foreignDate.substr(6,2);
                        
                        
                        foreign_list += "<tr>";
                        foreign_list += "<td>"+resp.foreign[i].foreignCriteria+"</td>";
                        foreign_list += "<td>"+resp.foreign[i].foreignName+"</td>";
                        foreign_list += "<td>"+resp.foreign[i].foreignScore+"</td>";
                        foreign_list += "<td>"+f_yyyy+"년 "+f_mm+"월 "+f_dd+"일 "+"</td>";
                        foreign_list += "</tr>";
                        }
                        
                        $("#resFor").append(foreign_list);
                      }    
                 }
                 
                  if (resp.career != null) {
                      for(i=0; i<resp.career.length; i++) { // when career is Exist
                         var career_list = "";
                         if (resp.career[i].careerEnddate != null) {
                             var caEnd_yyyy=resp.career[i].careerEnddate.substr(0,4);
                             var caEnd_mm = resp.career[i].careerEnddate.substr(4,2);
                             var caEnd_dd = resp.career[i].careerEnddate.substr(6,2);
                             }
                          if(resp.career[i].careerStartdate != null) {
                         var caStart_yyyy=resp.career[i].careerStartdate.substr(0,4);
                         var caStart_mm = resp.career[i].careerStartdate.substr(4,2);
                         var caStart_dd = resp.career[i].careerStartdate.substr(6,2);
                          
                         
                         
                         if(resp.career[i].careerCheck == "C"){
                            
                             career_list += "<tr>";
                             career_list += "<th>"+"회사명"+"</th>";
                             career_list += "<th>"+resp.career[i].careerCenter+"</th>";
                             career_list += "</tr>";
                             career_list += "<tr>";
                             career_list += "<td>"+"경력기간"+"</td>";
                             if (caEnd_yyyy != null) {
                                career_list += "<td>"+caStart_yyyy+"."+caStart_mm+"."+caStart_dd+" ~ "+caEnd_yyyy+"."+caEnd_mm+"."+caEnd_dd+"</td>";
                             } else {
                               career_list += "<td>"+caStart_yyyy+"."+caStart_mm+"."+caStart_dd+" ~ 재직중</td>";
                             }
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
                  }
                  if (resp.project != null) {
                      for(i=0; i<resp.project.length; i++) { // when project is Exist
                         var project_list = "";
                          if(resp.project[i].projectEnforcement != null) {
                         
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
                  }
              
          },
          error: (err) => {
              console.log("err: "+err);
      }
      })
      document.getElementById('modIn').setAttribute('value',resumeID);
     $(document).on('click','#modIn',function(e){
    	 var resumeID = $(this).val()
    	 location.href="${contextPath}/resume/modResume.do?userID=${member.userId}&resumeID="+resumeID;
     })
      
      
    }
    
  function tabtab(h) {
      sessionStorage.setItem('activeTab', h);
      console.log('href   yyyy' + h);
  }

  </script>
</head>


<script>
$(document).on('click','#remove',function(e){
   var resumeID = $("input[name='check']:checked").val();
   if (resumeID != null){
      
   
   data={}
   data.resumeID = resumeID
    Swal.fire({
           title:'이력서를 삭제하시겠습니까?',
         icon:'warning',
           confirmButtonText: `삭제`,
           showCancelButton: true,
            confirmButtonColor: '#3085d6',
           cancelButtonText: `취소`,
           }).then((res) =>{
              if(res.isConfirmed){
                 $.ajax({
                  type : "post",
                  url : "${contextPath}/resume/deleteResume2.do",
                  contentType : "application/json; charset=UTF-8",
                  data:JSON.stringify(data),
                  success : function() {
                     Swal.fire({ icon: 'success', 
                            title: '이력서가 삭제되었습니다.', 
                            showConfirmButton: false,
                            timer: 1000
                            });
                     setTimeout(function(){
                            location.reload();
                             }, 900);
                  },
                  error : function() {
                  alert("다시 시도해주세요.");

                  }
                  });
                 
                 
              }
              else{
                 return;
              }
           })}
   
});
</script>


<script>
$(document).on('click','.check',function(e){
   var id_check = $(this).attr("id");
   var resumeID = $("input[name='check']:checked").val();
   var check = $('input:radio[name=check]').is(':checked');
   if ($('input:radio[name=check]').is(':checked') == false){
      Swal.fire({ icon: 'error', 
           title: '이력서를 선택해주세요.', 
           showConfirmButton: false,
           });
      return false;
      
   }else if(id_check =="represent") {
      Swal.fire({
           icon:"question",
           title: '대표 이력서로 설정하시겠습니까?',
           width: '550px',
           showDenyButton: false,
           showCancelButton: true,
           confirmButtonText: '예',
           cancelButtonText: '취소',
           confirmButtonColor: '#3085d6',
     	  cancelButtonColor: '#d33'
           
         }).then((result) => {
            if (result.isConfirmed) {
               Swal.fire({icon: 'success',
                  title:'설정 완료',
                  showConfirmButton: false})
               setTimeout(function(){
                  location.href="${contextPath}/resume/resumeCheck.do?resumeID="+resumeID+"&resumeUser=${member.userId}"
                             }, 900);
               
                
              } else if (result.isDenied) {
                
              }
         }
   )
       
            
   }
});

</script>


</head>

<body>

   <div class="sub_visual">
   <span style="color: white;">이력서 관리</span>
   </div>

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
                                                      src="${pageContext.request.contextPath}/resources/image/resume/img.jpg"
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
                  <button type="button" class="btn btn-outline-danger btn-default"
                     data-dismiss="modal" value=""
                     id="modIn">수정</button>
                  <button type="button" id="reset"
                     class="btn btn-outline-danger btn-default" data-dismiss="modal">확인</button>
               </div>
            </div>
         </div>
      </div>
      <div class="lnb">
         <ul>
            <li><a href="${contextPath}/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a
               href="${contextPath}/resume/resumeList.do?resumeUser=${member.userId}">이력서 관리</a></li>
         </ul>
      </div>

      <!--<div class="pageIntro">이력서 관리</div>-->
      <form method="post" action="${contextPath}/resume/resumeWrite.do">

         <table class="resumeList">

            <tbody id="ajaxTable" style="width: 70%">
               <c:forEach var="resumeList" items="${resumeList}">
                  <tr id="item">
                     <td><c:choose>
                           <c:when test="${resumeList.resumeCheck eq 'Y'}">
                              <label
                                 style="color: #dc3545; font-weight: bold; font-size: 17px;">[대표
                                 이력서] </label>
                           </c:when>
                           <c:when test="${resumeList.resumeCheck eq 'N'}">
                              <input type="radio" id="check" name="check"
                                 value="${resumeList.resumeID}">
                           </c:when>
                        </c:choose></td>

                     <td class="name"><c:choose>
                           <c:when test="${resumeList.resumeCheck eq 'Y'}">
                              <a style="font-weight: bold; font-size: 17px" href="#myModal"
                                 data-toggle="modal"
                                 onclick="getResumeInfo('${resumeList.resumeID}','${resumeList.resumeUser}','${resumeList.memberVO.userName}', '${resumeList.resumePic}');">
                                 ${resumeList.resumeDate} </a>

                           </c:when>
                           <c:when test="${resumeList.resumeCheck eq 'N'}">
                              <a href="#myModal" data-toggle="modal"
                                 onclick="getResumeInfo('${resumeList.resumeID}','${resumeList.resumeUser}','${resumeList.memberVO.userName}', '${resumeList.resumePic}');">
                                 ${resumeList.resumeDate} </a>
                           </c:when>
                        </c:choose></td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>



         <div style="margin-top: 50px; padding-bottom: 150px;">
            <button class="btn btn-outline-danger button_bottom check"
               type="button" id="remove">삭제</button>
            <button class="btn btn-outline-danger button_bottom" type="button"
               onClick="location.href='${contextPath}/resume/resumeWrite.do?userID=${member.userId}'">
               이력서 작성</button>
            <button id="represent"
               class="btn btn-outline-danger button_bottom check" type="button">대표
               이력서 설정</button>


         </div>

      </form>
   </div>

</body>
</html>