
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/modal.css" />

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<style>
.table thead th {
	width: 25%;
	vertical-align: bottom;
	border-bottom: 2px solid #dee2e6;
}

.flex-box {
	display: flex;
	justify-content: space-evenly;
}

.flex-col {
	display: flex;
	flex-direction: column;
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

.d_divider {
	border-left: 3px solid green;
	height: 500px;
}

.c_content {
	float: left;
	width: 770px;
	word-break: keep-all;
	word-wrap: break-word;
}

.c_context {
	width: 990px;
	word-break: keep-all;
	word-wrap: break-word;
}

.s_str {
	float: left;
	width: 200px;
}

.r_row {
	clear: left;
}

.c_containerItem {
	margin-top: 100px;
	clear: left;
	border-bottom: 1px solid black;
}

#resCarr>th {
	colspan: 2;
}
</style>
<script>
        $(document).ready(function () {
            let activeTab = sessionStorage.getItem('activeTab');
            // ���ΰ�ħ �� �� ���� ����
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
        // ��� body text ����
        
        function getResumeInfo(resumeID, userID, userName) {
        	
        	$.ajax({				// �񵿱����, �̷¼� ��������
	            method: "GET",
	            url: "${contextPath}/partner/getResumeByID.do?partnerApplyResumeID="+resumeID+"&partnerApplyUserID="+userID,
	            success: (resp) => {	// ��� ����� success�� ����
	            	console.log(resp);
	            	var now = new Date();	// ���� ��¥ �� �ð�
	            	var year = now.getFullYear();	// ����
	            	var yyyy=resp.resume.memberVO.birth.substr(0,4);
	            	var mm = resp.resume.memberVO.birth.substr(4,2);
	            	var dd = resp.resume.memberVO.birth.substr(6,2);
	            	var age = year-parseInt(yyyy)+1;
	            	var phone1 = resp.resume.memberVO.userPhoneNumber.substr(0,3);
	            	var phone2 = resp.resume.memberVO.userPhoneNumber.substr(3,4);
	            	var phone3 = resp.resume.memberVO.userPhoneNumber.substr(7,4);
	            
	            	
	            	$("#modal_title").text(userName+"�� �̷¼�");
                    $("#resName").text(resp.resume.memberVO.userName);
                    $("#resEngName").text(resp.resume.resumeForeign);
                    $("#resAge").text(age);
                    $("#resGender").text(resp.resume.memberVO.userGender);
                    $("#resBirth").text(yyyy+"�� "+mm+"�� "+dd+"��");
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
                    	resp.resume.resumeContext5.replace(/&nbsp;/," "); 
                    	$("#resCtx5").html("");
                    } else{
                    	resp.resume.resumeContext5.replace(/&nbsp;/," "); 
                    	$("#resCtx5").html(resp.resume.resumeContext5);
                    }
                    
                    
                      if (resp.certificate != null) {
                    	for(i=0; i<resp.certificate.length; i++) { // ���̺��� �� ��ŭ �ݺ�
                    		var certificate_list = "";
                    		var c_yyyy=resp.certificate[i].certificateDate.substr(0,4);
        	            	var c_mm = resp.certificate[i].certificateDate.substr(4,2);
        	            	var c_dd = resp.certificate[i].certificateDate.substr(6,2);
        	            	
                    		certificate_list += "<tr>";
                    		certificate_list += "<td>"+resp.certificate[i].certificateName+"</td>";
                    		certificate_list += "<td>"+resp.certificate[i].certificateEnforcement+"</td>";
                    		certificate_list += "<td>"+c_yyyy+"�� "+c_mm+"�� "+c_dd+"�� "+"</td>";
                    		certificate_list += "</tr>";
                    		
                    		$("#resCert").append(certificate_list);
                    	 }
                      }
                    
                    	
                    	 if (resp.foreign != null) {
                        	for(i=0; i<resp.foreign.length; i++) { // ���̺��� �� ��ŭ �ݺ�
                        		var foreign_list = "";
                        		var f_yyyy=resp.foreign[i].foreignDate.substr(0,4);
            	            	var f_mm = resp.foreign[i].foreignDate.substr(4,2);
            	            	var f_dd = resp.foreign[i].foreignDate.substr(6,2);
            	            	
            	            	foreign_list += "<tr>";
            	            	foreign_list += "<td>"+resp.foreign[i].foreignCriteria+"</td>";
            	            	foreign_list += "<td>"+resp.foreign[i].foreignName+"</td>";
            	            	foreign_list += "<td>"+resp.foreign[i].foreignScore+"</td>";
            	            	foreign_list += "<td>"+f_yyyy+"�� "+f_mm+"�� "+f_dd+"�� "+"</td>";
            	            	foreign_list += "</tr>";
                        		
                        		$("#resFor").append(foreign_list);
                        	 } 	
                    	}
                    	
                    	 if (resp.career != null) {
                         	for(i=0; i<resp.career.length; i++) { // ���̺��� �� ��ŭ �ݺ�
                         		var career_list = "";
                         		var caStart_yyyy=resp.career[i].careerStartdate.substr(0,4);
             	            	var caStart_mm = resp.career[i].careerStartdate.substr(4,2);
             	            	var caStart_dd = resp.career[i].careerStartdate.substr(6,2);
             	            	var caEnd_yyyy=resp.career[i].careerEnddate.substr(0,4);
             	            	var caEnd_mm = resp.career[i].careerEnddate.substr(4,2);
             	            	var caEnd_dd = resp.career[i].careerEnddate.substr(6,2);
             	            	
             	            	if(resp.career[i].careerCheck == "C"){
             	            		
             	            		career_list += "<tr>";
             	            		career_list += "<th>"+"ȸ���"+"</th>";
                 	            	career_list += "<th>"+resp.career[i].careerCenter+"</th>";
                 	            	career_list += "</tr>";
                 	            	career_list += "<tr>";
                 	            	career_list += "<td>"+"��±Ⱓ"+"</td>";
                 	            	career_list += "<td>"+caStart_yyyy+"."+caStart_mm+"."+caStart_dd+" ~ "+caEnd_yyyy+"."+caEnd_mm+"."+caEnd_dd+"</td>";
                 	            	career_list += "</tr>";
                 	            	career_list += "<tr>";
                 	            	career_list += "<td>"+"����"+"</td>";
                 	            	career_list += "<td>"+resp.career[i].careerPosition+"</td>";
                 	            	career_list += "</tr>";
                 	            	career_list += "<tr>";
                 	            	career_list += "<td>"+"�������"+"</td>";
                 	            	career_list += "<td>"+resp.career[i].careerType+"</td>";
                 	            	career_list += "</tr>";
                 	            	$("#resCarr_C").append(career_list);
                                } else if(resp.career[i].careerCheck == "E") {
                                	career_list += "<tr>";
                                	career_list += "<th>"+"�������"+"</th>";
                 	            	career_list += "<th>"+resp.career[i].careerCenter+"</th>";
                 	            	career_list += "</tr>";
                 	            	career_list += "<tr>";
                 	            	career_list += "<td>"+"�����Ⱓ"+"</td>";
                 	            	career_list += "<td>"+caStart_yyyy+"."+caStart_mm+"."+caStart_dd+" ~ "+caEnd_yyyy+"."+caEnd_mm+"."+caEnd_dd+"</td>";
                 	            	career_list += "</tr>";
                 	            	career_list += "<tr>";
                 	            	career_list += "<td>"+"�̼��ð�"+"</td>";
                 	            	career_list += "<td>"+resp.career[i].careerHour+"</td>";
                 	            	career_list += "</tr>";
                 	            	career_list += "<tr>";
                 	            	career_list += "<td>"+"���"+"</td>";
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
                                 	for(i=0; i<resp.project.length; i++) { // ���̺��� �� ��ŭ �ݺ�
                                 		var project_list = "";
                                 		
                     	            	project_list += "<tr>";
                     	            	project_list += "<th style="+"width:108px"+">"+"�����"+"</th>";
                     	            	project_list += "<th>"+resp.project[i].projectEnforcement+"</th>";
                     	            	project_list += "</tr>";
                     	            	project_list += "<tr>";
                     	            	project_list += "<td>"+"������Ʈ ��"+"</td>";
                     	            	project_list += "<td>"+resp.project[i].projectName+"</td>";
                     	            	project_list += "</tr>";
                     	            	project_list += "<tr>";
                     	            	project_list += "<td>"+"����ȯ�� �� �����"+"</td>";
                     	            	project_list += "<td>"+resp.project[i].projectDev+"</td>";
                     	            	project_list += "</tr>";
                     	            	project_list += "<tr>";
                     	            	project_list += "<td>"+"������Ʈ �Ұ�"+"</td>";
                     	            	project_list += "<td>"+resp.project[i].projectContent+"</td>";
                     	            	project_list += "</tr>";
                                 		project_list += "<tr>";
                     	            	project_list += "<td>"+"����� ����"+"</td>";
                     	            	project_list += "<td>"+resp.project[i].projectRole+"</td>";
                     	            	project_list += "</tr>";
                     	            	project_list += "<tr>";
                     	            	project_list += "<td>"+"���ø�ũ"+"</td>";
                     	            	project_list += "<td>"+resp.project[i].projectURL+"</td>";
                     	            	project_list += "</tr>";
                     	            	
                     	            	$("#resPro").append(project_list);
                                 	 } 	
                             	} 
             	    
	            },
	            error: (err) => {
	                console.log(err+" �񵿱� ����");
	     	}
	        })
        	
          }

        // �� Ŭ�� �� session�� ���� �� �� ����
        function tabtab(h) {
            sessionStorage.setItem('activeTab', h);
            console.log('href   yyyy' + h);
        }


        // Check Pass Or Fail 
        function chk_passOrFail(userID, userName, partnerID) {
        	    Swal.fire({
        	        title:userName+'('+userID+')',
     				icon:'warning',
        	        confirmButtonText: `�հ�`,
        	        confirmButtonColor: '#3085d6',
        	        showCloseButton: true,
        	        showCancelButton: true,
        	        cancelButtonText: `���հ�`,
        	        cancelButtonColor: '#d33',
        	        }).then((res) => {
          			if(res.isConfirmed){
          				
          			Swal.fire({               /* update operation start */
          				     title:'�հ� ó��',
          				     text: '�հ� ó���Ͻðڽ��ϱ�?',
          				     showCancelButton: true,
          				     showCloseButton: true,
          				     icon:"success",
          				     confirmButtonColor: '#3085d6',
          				     cancelButtonColor: '#d33',
							 cancelButtonText: '���',
          				     confirmButtonText: '�հ�'
          				   }).then((result) => {
          				     /* Read more about isConfirmed, isDenied below */
          				     if (result.isConfirmed) {
          				    	 $.ajax({				//check update to pass
          		      	              method: "POST",
          		      	              url: "${contextPath}/partner/company/manageApply.do",
          		      	              data: {
          		      	            	partnerApplyUserID    : userID,
          		      	              	partnerApplyPartnerID : partnerID,
          		      	                partnerApplyState : '�հ�'
          		      	              },
          		      	              success: (resp) => {	// update to pass and reloading
          		      	            	location.reload();        
          		      	              },
          		      	              error: (data) => {
          		      	                  console.log("������ ���� ����"+data);
          		      	               }
          		      	          }) 
          				     } else{
          				         return;     /* cancel operation */
          				     }
          				   })
          			
      	          } else if( res.dismiss ==='cancel'){
      	        	Swal.fire({               /* check update to fail */
     				     title:'���հ� ó��',
     				     text: '���հ� ó���Ͻðڽ��ϱ�?',
     				     showCloseButton: true,
     				     showCancelButton: true,
     				     icon:"error",
     				     confirmButtonColor: '#d33',
     				     cancelButtonColor: '#3085d6#d33',
     				    cancelButtonText: '���',
     				     confirmButtonText: '���հ�'
     				   }).then((result) => {
     				     /* Read more about isConfirmed, isDenied below */
     				     if (result.isConfirmed) {
     				    	 $.ajax({				// update to fail
     		      	              method: "POST",
     		      	              url: "${contextPath}/partner/company/manageApply.do",
     		      	              data: {
     		      	            	partnerApplyUserID    : userID,
      		      	              	partnerApplyPartnerID : partnerID,
      		      	                partnerApplyState : '���հ�'
      		      	              
     		      	              },
     		      	              success: (resp) => {	// update to fail and reloading
     		      	            	location.reload();        
     		      	              },
     		      	              error: (data) => {
     		      	                  console.log("������ ���� ����"+data);
     		      	               }
     		      	          }) 
     				     } else{
     				         return;     /* cancel update */
     				     }
     				   })
      	        } else{
      	        	 return;
      	          }
          			  
        	      })
        	}
        
        function chk_reset(userID, userName, partnerID) {
    	    Swal.fire({
    	        title:'���� ó��',
    	        text:'�ش� ����� �����մϴ�',
 				icon:'warning',
    	        confirmButtonText: `�հ�`,
    	        confirmButtonColor: '#3085d6',
    	        showCloseButton: true,
    	        showCancelButton: true,
    	        cancelButtonText: `���հ�`,
    	        cancelButtonColor: '#d33',
    	        }).then((res) => {
      			if(res.isConfirmed){
      				
      			Swal.fire({               /* check editing */
      				     title:'�հ� ó��',
      				     text: '�հ� ó���Ͻðڽ��ϱ�?',
      				     showCancelButton: true,
      				     showCloseButton: true,
      				     icon:"success",
      				     confirmButtonColor: '#3085d6',
      				     cancelButtonColor: '#d33',
						 cancelButtonText: '���',
      				     confirmButtonText: '�հ�'
      				   }).then((result) => {
      				     /* Read more about isConfirmed, isDenied below */
      				     if (result.isConfirmed) {
      				    	 $.ajax({				// update to pass 
      		      	              method: "POST",
      		      	              url: "${contextPath}/partner/company/manageApply.do",
      		      	              data: {
      		      	            	partnerApplyUserID    : userID,
      		      	              	partnerApplyPartnerID : partnerID,
      		      	                partnerApplyState : '�հ�'
      		      	              },
      		      	              success: (resp) => {	// update success and reloading
      		      	            	location.reload();        
      		      	              },
      		      	              error: (data) => {
      		      	                  console.log("������ ���� ����"+data);
      		      	               }
      		      	          }) 
      				     } else{
      				         return;     /* cancel editing */
      				     }
      				   })
      			
  	          } else if( res.dismiss ==='cancel'){
  	        	Swal.fire({               /* edit to fail */
 				     title:'���հ� ó��',
 				     text: '���հ� ó���Ͻðڽ��ϱ�?',
 				     showCloseButton: true,
 				     showCancelButton: true,
 				     icon:"error",
 				     confirmButtonColor: '#d33',
 				     cancelButtonColor: '#3085d6',
 				    cancelButtonText: '���',
 				     confirmButtonText: '���հ�'
 				   }).then((result) => {
 				     /* Read more about isConfirmed, isDenied below */
 				     if (result.isConfirmed) {
 				    	 $.ajax({				// update to not allowed
 		      	              method: "POST",
 		      	              url: "${contextPath}/partner/company/manageApply.do",
 		      	              data: {
 		      	            	partnerApplyUserID    : userID,
  		      	              	partnerApplyPartnerID : partnerID,
  		      	                partnerApplyState : '���հ�'
  		      	              
 		      	              },
 		      	              success: (resp) => {	// update success and reloading
 		      	            	location.reload();        
 		      	              },
 		      	              error: (data) => {
 		      	                  console.log("������ ���� ����"+data);
 		      	               }
 		      	          }) 
 				     } else{
 				         return;     /* �������� ��� */
 				     }
 				   })
  	        } else{
  	        	 return;
  	          }
      			  
    	      })
    	}
        
        function suggestToUser(userID, partnerID, userName) {
        	Swal.fire({
    	    	html: `
    	    	<h2>ä�� ����</h2>
    	    	<input type="text" id="user" style="background-color: #eee;" class="swal2-input" readonly>
    	    	<input type="text" id="suggestTitle" placeholder="����" class="swal2-input">
    	    	<textarea type="text" id="suggestDesc" placeholder="���� ����" style="height:300px; padding-top: 5px;" class="swal2-input" rows="100"></textarea>`,
    	        confirmButtonText: `����`,
    	        confirmButtonColor: '#3085d6',
    	        showCloseButton: true,
    	        showCancelButton: true,
    	        cancelButtonText: `���`,
    	        cancelButtonColor: '#d33',
    	        onOpen: function() {
                    $('#user').attr("value", userName);
                },
                preConfirm: () => {			// pre confirm
                	const suggestDesc = Swal.getPopup().querySelector('#suggestDesc').value;
          			const suggestTitle = Swal.getPopup().querySelector('#suggestTitle').value;
          			if (!suggestDesc || !suggestTitle) {
        		      Swal.showValidationMessage(`Please enter title and Description`)	// check title and Descrtion is not null
        		    }
        		    else{
        		    	return;
        		}
          		}
    	        }).then((res) => {
      			if(res.isConfirmed){
      			const suggestDesc = Swal.getPopup().querySelector('#suggestDesc').value;
          		const suggestTitle = Swal.getPopup().querySelector('#suggestTitle').value;
          		Swal.fire({               /* check editing */
      				     title:'������ ����',
      				     text: 'ä�� �����Ͻðڽ��ϱ�?',
      				     showCancelButton: true,
      				     showCloseButton: true,
      				     icon:"success",
      				     confirmButtonColor: '#3085d6',
      				     cancelButtonColor: '#d33',
						 cancelButtonText: '���� ���',
      				     confirmButtonText: 'ä�� ����'
      				   }).then((result) => {
      				     /* Read more about isConfirmed, isDenied below */
      				     if (result.isConfirmed) {
      				    	
      				    	 $.ajax({				// update to pass 
      		      	              method: "POST",
      		      	              url: "${contextPath}/partner/company/manageSuggest.do",
      		      	              data: {
      		      	            	partnerSuggestionUserID    : userID,
      		      	              	partnerSuggestionPartnerID : partnerID,
      		      	              	partnerSuggestionTitle : suggestTitle,
      		      	                partnerSuggestionDescription : suggestDesc
      		      	              },
      		      	              success: (resp) => {	// update success and reloading
      		      	            	 Swal.fire('���ȿϷ�!', '', 'success').then(()=>{
      		      	            	 location.reload(); 
      		      	             	})
      		      	              },
      		      	              error: (data) => {
      		      	                  console.log("������ ���� ����"+data);
      		      	               }
      		      	          })  
      				     } else{
      				         return;     /* cancel editing */
      				     }
      				   })
      			
  	          } else{
  	        	 return;
  	          } 
    	      })
    	}
        
        function deleteSuggestion(userID, partnerID){
        	 Swal.fire({
     	        title:'ä������ ����',
     	        text:'���� �Ŀ� ������ �� �����ϴ�.',
  				icon:'warning',
     	        confirmButtonText: `����`,
     	        confirmButtonColor: '#d33',
     	        showCloseButton: true,
     	        showCancelButton: true,
     	        cancelButtonText: `���`,
     	        cancelButtonColor: '#3085d6',
     	        }).then((res) => {
       			if(res.isConfirmed){
       				    	 $.ajax({				//check update to pass
       		      	              method: "POST",
       		      	              url: "${contextPath}/partner/company/deleteSuggest.do",
       		      	              data: {
       		      	            	partnerSuggestionUserID    : userID,
       		      	              	partnerSuggestionPartnerID : partnerID,
       		      	                partnerSuggestionPartnerD : 'N'
       		      	              },
       		      	              success: (resp) => {	// update to pass and reloading
       		      	            	location.reload();        
       		      	              },
       		      	              error: (data) => {
       		      	                  console.log("������ ���� ����"+data);
       		      	               }
       		      	          }) 
       			} 
   	          else{
   	        	 return;
   	          	 }
       			})
        }
     </script>
<body>
	<div id="applyContents">
		<div class="sub_visual">
			<span style="color: white;">���»� ����</span>
		</div>
		<div class="container"
			style="display: flex; flex-wrap: wrap; width: 75%; justify-content: space-around; flex-direction: column; padding-bottom: 200px;">

			<!-- Modal -->
			<!-- <div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-dialog-scrollable">
 -->
			<div class="modal fade bd-example-modal-lg" id="myModal"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-scrollable">
					<!-- Modal content-->
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title" id="modal_title"></h5>
							<button type="button" class="close" data-dismiss="modal">��</button>
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
															<li class="active" id="basic"><strong>�⺻����</strong></li>
															<li id="personal"><strong>�ڰ��� ����</strong></li>
															<li id="education"><strong>���/��������</strong></li>
															<li id="project"><strong>������Ʈ</strong></li>
															<li id="introduce"><strong>�ڱ�Ұ���</strong></li>
														</ul>
														<!-- fieldsets -->
														<fieldset id="init">
															<div class="form-card">
																<h2 class="fs-title">�⺻����</h2>
																<table border id="resumeTable">
																	<tr>
																		<th rowspan="4"><img
																			src="http://jjunstudio.com/zbxe/files/attach/images/351/652/85a698d051126aa4043e83f4ff2376a0.jpg"
																			style="width: 122px; height: 163px;" /></th>
																	</tr>
																	<tr>
																		<th>����</th>
																		<td id="resName">������</td>
																		<th>������</th>
																		<td id="resEngName"></td>
																	</tr>
																	<tr>
																		<!-- &nbsp; = ��ĭ ���� -->
																		<th colspan="1" style="width: 84px;">����</th>
																		<td colspan="1" style="width: 165px;" id="resAge"></td>
																		<th colspan="1" width="15%">����</th>
																		<td colspan="1" width="200px" id="resGender"></td>

																	</tr>
																	<tr>
																		<th colspan="1">�������</th>
																		<td colspan="3" id="resBirth"></td>
																	</tr>
																	<tr>
																		<th>�ּ�</th>
																		<td colspan="4" id="resAddress"></td>
																	</tr>
																	<tr>
																		<th rowspan="2">����ó</th>
																		<th>��ȭ��ȣ</th>
																		<td colspan="4" id="resPhone">000-0000-0000</td>
																	</tr>
																	<tr>
																		<th>Email</th>
																		<td colspan="4" id="resEmail">test@test.com</td>
																	</tr>
																	<tr>
																		<th rowspan="3">�з»���</th>
																		<th>�����з�</th>
																		<td colspan="4" id="resLastEdu">���б� ����</td>
																	</tr>
																	<tr>
																		<th>����</th>
																		<td colspan="4" id="resMajor">��ǻ�Ͱ��а�</td>
																	</tr>
																	<tr>
																		<th>����</th>
																		<td colspan="4" id="resGrade">4.0/4.5</td>
																	</tr>

																</table>
															</div>
															<input type="button" name="next"
																class="next action-button" value="����" />
														</fieldset>
														<fieldset>
															<div class="form-card">
																<h2 class="fs-title">�ڰ��� ����</h2>
																<table border id="resumeTable">
																	<tr>
																		<th>�ڰ��� ��</th>
																		<th>����ó/���</th>
																		<th>�����</th>
																	</tr>
																	<tbody id="resCert">
																	</tbody>
																</table>

																<h2 class="fs-title" style="margin-top: 100px">����
																	����</h2>
																<table border id="resumeTable">
																	<tr>
																		<th>���</th>
																		<th>��������</th>
																		<th>����</th>
																		<th>�����</th>
																	</tr>
																	<tbody id="resFor">
																	</tbody>
																</table>
															</div>
															<input type="button" name="previous"
																class="previous action-button-previous" value="����" /> <input
																type="button" name="next" class="next action-button"
																value="����" />
														</fieldset>
														<fieldset>
															<div class="form-card">
																<h2 class="fs-title">��»���</h2>
																<table border id="resumeTable">
																	<tbody id="resCarr_C">
																	</tbody>
																</table>
																<h2 class="fs-title" style="margin-top: 100px">��������
																	����</h2>
																<table border id="resumeTable">
																	<tbody id="resCarr_E">
																	</tbody>
																</table>

															</div>
															<input type="button" name="previous"
																class="previous action-button-previous" value="����" /> <input
																type="button" name="next" class="next action-button"
																value="����" />
														</fieldset>

														<fieldset>
															<div class="form-card">
																<h2 class="fs-title">������Ʈ</h2>
																<table border id="resumeTable">
																	<tbody id="resPro">
																	</tbody>
																</table>
															</div>
															<input type="button" name="previous"
																class="previous action-button-previous" value="����" /> <input
																type="button" name="next" class="next action-button"
																value="����" />
														</fieldset>

														<fieldset>
															<div class="form-card">
																<h2 class="fs-title">�ڱ�Ұ���</h2>
																<table border id="resumeTable">
																	<tr>
																		<th style="width: 98px;">�������</th>
																		<td id="resCtx1"></td>
																	</tr>
																	<tr>
																		<th>�б���Ȱ</th>
																		<td id="resCtx2"></td>
																	</tr>
																	<tr>
																		<th>���� (��/����)</th>
																		<td id="resCtx3"></td>
																	</tr>
																	<tr>
																		<th>������� �� �巡����</th>
																		<td id="resCtx4"></td>
																	</tr>
																	<tr>
																		<th>��Ÿ����</th>
																		<td id="resCtx5"></td>
																	</tr>


																</table>
															</div>
															<input type="button" name="previous"
																class="previous action-button-previous" value="����" />
														</fieldset>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="partnerInfoModalBody" style="text-align: left">
								<div class="row">
									<div class="col-3" style="color: #444444; font-weight: bold">
										<p>�Ұ�</p>
										<p>�ּ�</p>
										<p>�����</p>
										<p>�̸���</p>
										<p>������Ʈ</p>
									</div>
									<div class="col-8">
										<p id="partner_info"></p>
										<p id="partner_addr"></p>
										<p id="partner_headcnt"></p>
										<p id="partner_email"></p>
										<p id="partner_purl"></p>
									</div>
								</div>
							</div> -->
						</div>
						<div class="modal-footer">
							<button type="button" id="reset" class="btn btn-default"
								data-dismiss="modal">Ȯ��</button>
						</div>
					</div>

				</div>
			</div>

			<section id="tabs" class="project-tab">
				<div>
					<div class="row">
						<div class="col-md-12">
							<nav style="margin-top: 100px;">

								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a id="firstNav" href="#nav-home"
										data-toggle="tab" onclick="tabtab('#nav-home')"
										class="nav-link active">���� ���</a></li>
									<li class="nav-item"><a id="secondNav" href="#nav-profile"
										data-toggle="tab" onclick="tabtab('#nav-profile')"
										class="nav-link">ä�� ����</a></li>
								</ul>
							</nav>

							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-home"
									role="tabpanel" aria-labelledby="nav-home-tab">
									<%--                ù��° ���� ���̺�                --%>
									<table class="table" cellspacing="0">
										<thead>
											<tr>
												<th>�̸�</th>
												<th>������</th>
												<th>�� �� ����</th>
												<%-- <c:forEach var="apList" items="${applyList}">
												<c:choose>
												<c:when test="${apList.partnerApplyState != '������'}">
												 --%>
												<th>��� ����</th>
												<%-- </c:when>
												</c:choose>
												</c:forEach>
											 --%>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="apList" items="${applyList}">
												<tr align="center">
													<td>${apList.memberVO.userName}</td>
													<td><a class="info" data-toggle="modal"
														href="#myModal"
														onclick="getResumeInfo('${apList.partnerApplyResumeID}','${apList.memberVO.userId}','${apList.memberVO.userName}');">
															<i class="fas fa-search"></i>
													</a></td>
													<c:choose>
														<c:when test="${apList.partnerApplyState == '������'}">
															<td><a style="text-decoration: underline" href="#"
																onclick="chk_passOrFail('${apList.memberVO.userId}','${apList.memberVO.userName}','${apList.partnerApplyPartnerID}');"><i
																	class="fas fa-user-check"></i></a></td>
															<td></td>
														</c:when>
														<c:when test="${apList.partnerApplyState == '�հ�   '}">
															<td style="color: blue;">${apList.partnerApplyState}</td>
															<td><a style="text-decoration: underline" href="#"
																onclick="chk_reset('${apList.memberVO.userId}','${apList.memberVO.userName}','${apList.partnerApplyPartnerID}');"><i
																	class="fas fa-user-edit"></i></a>
														</c:when>
														<c:otherwise>
															<td style="color: red;">${apList.partnerApplyState}</td>
															<td><a style="text-decoration: underline" href="#"
																onclick="chk_reset('${apList.memberVO.userId}','${apList.memberVO.userName}','${apList.partnerApplyPartnerID}');"><i
																	class="fas fa-user-edit"></i></a>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="nav-profile" role="tabpanel"
									aria-labelledby="nav-profile-tab">
									<%--                �ι�° ���� ���̺�                --%>
									<table class="table" cellspacing="0">
										<thead>
											<tr>
												<th>�̸�</th>
												<th>�̷¼�</th>
												<th>ä������</th>
												<th>����</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="sugList" items="${suggestionList}">
												<tr>
													<td>${sugList.userName}</td>
													<td><a class="info" data-toggle="modal"
														href="#myModal"
														onclick="getResumeInfo('${sugList.resumeVO.resumeID}','${sugList.userId}','${sugList.userName}');">
															<i class="fas fa-search"></i>
													</a></td>

													<c:choose>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionAcception == null}">
															<td><a style="text-decoration: underline" href="#"
																onclick="suggestToUser('${sugList.userId}','${partner.partnerLicenseNum}','${sugList.userName}');return false;"><i
																	class="fas fa-hands-helping"></i></a></td>
														</c:when>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionAcception == '����'}">
															<td style="color: blue;">${sugList.suggestionVO.partnerSuggestionAcception}</td>
														</c:when>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionAcception == '���'}">
															<td style="color: green;">${sugList.suggestionVO.partnerSuggestionAcception}</td>
														</c:when>
														<c:otherwise>
															<td style="color: red;">${sugList.suggestionVO.partnerSuggestionAcception}</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionPartnerD != null }">
															<td><a style="text-decoration: underline" href="#"
																onclick="deleteSuggestion('${sugList.userId}','${partner.partnerLicenseNum}');"><i
																	class="fas fa-user-times"></i></a></td>
														</c:when>
														<c:otherwise>
															<td></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/modal.css" />

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<style>
.table thead th {
	width: 25%;
	border-bottom: 1px;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-wrap: wrap;
	width: 80%;
	justify-content: space-around;
	flex-direction: column;
	margin-left: 15%;
}

.flex-box {
	display: flex;
	justify-content: space-evenly;
}

.flex-col {
	display: flex;
	flex-direction: column;
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

.d_divider {
	border-left: 3px solid green;
	height: 500px;
}

.c_content {
	float: left;
	width: 770px;
	word-break: keep-all;
	word-wrap: break-word;
}

.c_context {
	width: 990px;
	word-break: keep-all;
	word-wrap: break-word;
}

.s_str {
	float: left;
	width: 200px;
}

.r_row {
	clear: left;
}

.c_containerItem {
	margin-top: 100px;
	clear: left;
	border-bottom: 1px solid black;
}
</style>
<script>
        $(document).ready(function () {
            let activeTab = sessionStorage.getItem('activeTab');
            // 새로고침 후 탭 상태 보존
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
				})
            
        });

        // 모달 body text 설정
        
        function getResumeInfo(resumeID, userID) {
        	
        	$.ajax({				// 비동기통신, 이력서 가져오기
	            method: "GET",
	            url: "${contextPath}/partner/getResumeByID.do?partnerApplyResumeID="+resumeID+"&partnerApplyUserID="+userID,
	            success: (resp) => {	// 모든 결과를 success로 받음
	            	
	            	console.log(resp);
	            	$("#modal_title").text(resp.resume.resumeUser+"의 이력서");
                    $("#partner_info").text(resp.resume.resumeDate);
                    $("#partner_addr").text(resp.resume.resumeID);
                    $("#partner_email").text(resp.resume.resumeUser);
	            },
	            error: (err) => {
	                console.log(err+" 비동기 실패");
	     	}
	        })
        	
            }

        // 탭 클릭 시 session에 현재 탭 값 저장
        function tabtab(h) {
            sessionStorage.setItem('activeTab', h);
            console.log('href   yyyy' + h);
        }


        // Check Pass Or Fail 
        function chk_passOrFail(userID, userName, partnerID) {
        	    Swal.fire({
        	        title:userName+'('+userID+')',
     				icon:'warning',
        	        confirmButtonText: `합격`,
        	        confirmButtonColor: '#3085d6',
        	        showCloseButton: true,
        	        showCancelButton: true,
        	        cancelButtonText: `불합격`,
        	        cancelButtonColor: '#d33',
        	        }).then((res) => {
          			if(res.isConfirmed){
          				
          			Swal.fire({               /* update operation start */
          				     title:'합격 처리',
          				     text: '합격 처리하시겠습니까?',
          				     showCancelButton: true,
          				     showCloseButton: true,
          				     icon:"success",
          				     confirmButtonColor: '#3085d6',
          				     cancelButtonColor: '#d33',
							 cancelButtonText: '취소',
          				     confirmButtonText: '합격'
          				   }).then((result) => {
          				     /* Read more about isConfirmed, isDenied below */
          				     if (result.isConfirmed) {
          				    	 $.ajax({				//check update to pass
          		      	              method: "POST",
          		      	              url: "${contextPath}/partner/company/manageApply.do",
          		      	              data: {
          		      	            	partnerApplyUserID    : userID,
          		      	              	partnerApplyPartnerID : partnerID,
          		      	                partnerApplyState : '합격'
          		      	              },
          		      	              success: (resp) => {	// update to pass and reloading
          		      	            	location.reload();        
          		      	              },
          		      	              error: (data) => {
          		      	                  console.log("데이터 전달 실패"+data);
          		      	               }
          		      	          }) 
          				     } else{
          				         return;     /* cancel operation */
          				     }
          				   })
          			
      	          } else if( res.dismiss ==='cancel'){
      	        	Swal.fire({               /* check update to fail */
     				     title:'불합격 처리',
     				     text: '불합격 처리하시겠습니까?',
     				     showCloseButton: true,
     				     showCancelButton: true,
     				     icon:"error",
     				     confirmButtonColor: '#d33',
     				     cancelButtonColor: '#3085d6#d33',
     				    cancelButtonText: '취소',
     				     confirmButtonText: '불합격'
     				   }).then((result) => {
     				     /* Read more about isConfirmed, isDenied below */
     				     if (result.isConfirmed) {
     				    	 $.ajax({				// update to fail
     		      	              method: "POST",
     		      	              url: "${contextPath}/partner/company/manageApply.do",
     		      	              data: {
     		      	            	partnerApplyUserID    : userID,
      		      	              	partnerApplyPartnerID : partnerID,
      		      	                partnerApplyState : '불합격'
      		      	              
     		      	              },
     		      	              success: (resp) => {	// update to fail and reloading
     		      	            	location.reload();        
     		      	              },
     		      	              error: (data) => {
     		      	                  console.log("데이터 전달 실패"+data);
     		      	               }
     		      	          }) 
     				     } else{
     				         return;     /* cancel update */
     				     }
     				   })
      	        } else{
      	        	 return;
      	          }
          			  
        	      })
        	}
        
        function chk_reset(userID, userName, partnerID) {
    	    Swal.fire({
    	        title:'변경 처리',
    	        text:'해당 결과로 변경합니다',
 				icon:'warning',
    	        confirmButtonText: `합격`,
    	        confirmButtonColor: '#3085d6',
    	        showCloseButton: true,
    	        showCancelButton: true,
    	        cancelButtonText: `불합격`,
    	        cancelButtonColor: '#d33',
    	        }).then((res) => {
      			if(res.isConfirmed){
      				
      			Swal.fire({               /* check editing */
      				     title:'합격 처리',
      				     text: '합격 처리하시겠습니까?',
      				     showCancelButton: true,
      				     showCloseButton: true,
      				     icon:"success",
      				     confirmButtonColor: '#3085d6',
      				     cancelButtonColor: '#d33',
						 cancelButtonText: '취소',
      				     confirmButtonText: '합격'
      				   }).then((result) => {
      				     /* Read more about isConfirmed, isDenied below */
      				     if (result.isConfirmed) {
      				    	 $.ajax({				// update to pass 
      		      	              method: "POST",
      		      	              url: "${contextPath}/partner/company/manageApply.do",
      		      	              data: {
      		      	            	partnerApplyUserID    : userID,
      		      	              	partnerApplyPartnerID : partnerID,
      		      	                partnerApplyState : '합격'
      		      	              },
      		      	              success: (resp) => {	// update success and reloading
      		      	            	location.reload();        
      		      	              },
      		      	              error: (data) => {
      		      	                  console.log("데이터 전달 실패"+data);
      		      	               }
      		      	          }) 
      				     } else{
      				         return;     /* cancel editing */
      				     }
      				   })
      			
  	          } else if( res.dismiss ==='cancel'){
  	        	Swal.fire({               /* edit to fail */
 				     title:'불합격 처리',
 				     text: '불합격 처리하시겠습니까?',
 				     showCloseButton: true,
 				     showCancelButton: true,
 				     icon:"error",
 				     confirmButtonColor: '#d33',
 				     cancelButtonColor: '#3085d6',
 				    cancelButtonText: '취소',
 				     confirmButtonText: '불합격'
 				   }).then((result) => {
 				     /* Read more about isConfirmed, isDenied below */
 				     if (result.isConfirmed) {
 				    	 $.ajax({				// update to not allowed
 		      	              method: "POST",
 		      	              url: "${contextPath}/partner/company/manageApply.do",
 		      	              data: {
 		      	            	partnerApplyUserID    : userID,
  		      	              	partnerApplyPartnerID : partnerID,
  		      	                partnerApplyState : '불합격'
  		      	              
 		      	              },
 		      	              success: (resp) => {	// update success and reloading
 		      	            	location.reload();        
 		      	              },
 		      	              error: (data) => {
 		      	                  console.log("데이터 전달 실패"+data);
 		      	               }
 		      	          }) 
 				     } else{
 				         return;     /* 수정실행 취소 */
 				     }
 				   })
  	        } else{
  	        	 return;
  	          }
      			  
    	      })
    	}
        
        function suggestToUser(userID, partnerID, userName) {
        	Swal.fire({
    	    	html: `
    	    	<h2>채용 제안</h2>
    	    	<input type="text" id="user" style="background-color: #eee;" class="swal2-input" readonly>
    	    	<input type="text" id="suggestTitle" placeholder="제목" class="swal2-input">
    	    	<textarea type="text" id="suggestDesc" placeholder="제안 조건" style="height:300px; padding-top: 5px;" class="swal2-input" rows="100"></textarea>`,
    	        confirmButtonText: `제안`,
    	        confirmButtonColor: '#3085d6',
    	        showCloseButton: true,
    	        showCancelButton: true,
    	        cancelButtonText: `취소`,
    	        cancelButtonColor: '#d33',
    	        onOpen: function() {
                    $('#user').attr("value", userName);
                },
                preConfirm: () => {			// pre confirm
                	const suggestDesc = Swal.getPopup().querySelector('#suggestDesc').value;
          			const suggestTitle = Swal.getPopup().querySelector('#suggestTitle').value;
          			if (!suggestDesc || !suggestTitle) {
        		      Swal.showValidationMessage(`Please enter title and Description`)	// check title and Descrtion is not null
        		    }
        		    else{
        		    	return;
        		}
          		}
    	        }).then((res) => {
      			if(res.isConfirmed){
      			const suggestDesc = Swal.getPopup().querySelector('#suggestDesc').value;
          		const suggestTitle = Swal.getPopup().querySelector('#suggestTitle').value;
          		Swal.fire({               /* check editing */
      				     title:'포지션 제안',
      				     text: '채용 제안하시겠습니까?',
      				     showCancelButton: true,
      				     showCloseButton: true,
      				     icon:"success",
      				     confirmButtonColor: '#3085d6',
      				     cancelButtonColor: '#d33',
						 cancelButtonText: '제안 취소',
      				     confirmButtonText: '채용 제안'
      				   }).then((result) => {
      				     /* Read more about isConfirmed, isDenied below */
      				     if (result.isConfirmed) {
      				    	
      				    	 $.ajax({				// update to pass 
      		      	              method: "POST",
      		      	              url: "${contextPath}/partner/company/manageSuggest.do",
      		      	              data: {
      		      	            	partnerSuggestionUserID    : userID,
      		      	              	partnerSuggestionPartnerID : partnerID,
      		      	              	partnerSuggestionTitle : suggestTitle,
      		      	                partnerSuggestionDescription : suggestDesc
      		      	              },
      		      	              success: (resp) => {	// update success and reloading
      		      	            	 Swal.fire('제안완료!', '', 'success').then(()=>{
      		      	            	 location.reload(); 
      		      	             	})
      		      	              },
      		      	              error: (data) => {
      		      	                  console.log("데이터 전달 실패"+data);
      		      	               }
      		      	          })  
      				     } else{
      				         return;     /* cancel editing */
      				     }
      				   })
      			
  	          } else{
  	        	 return;
  	          } 
    	      })
    	}
        
        function deleteSuggestion(userID, partnerID){
        	 Swal.fire({
     	        title:'채용제안 삭제',
     	        text:'삭제 후엔 복구할 수 없습니다.',
  				icon:'warning',
     	        confirmButtonText: `삭제`,
     	        confirmButtonColor: '#d33',
     	        showCloseButton: true,
     	        showCancelButton: true,
     	        cancelButtonText: `취소`,
     	        cancelButtonColor: '#3085d6',
     	        }).then((res) => {
       			if(res.isConfirmed){
       				    	 $.ajax({				//check update to pass
       		      	              method: "POST",
       		      	              url: "${contextPath}/partner/company/deleteSuggest.do",
       		      	              data: {
       		      	            	partnerSuggestionUserID    : userID,
       		      	              	partnerSuggestionPartnerID : partnerID,
       		      	                partnerSuggestionPartnerD : 'N'
       		      	              },
       		      	              success: (resp) => {	// update to pass and reloading
       		      	            	location.reload();        
       		      	              },
       		      	              error: (data) => {
       		      	                  console.log("데이터 전달 실패"+data);
       		      	               }
       		      	          }) 
       			} 
   	          else{
   	        	 return;
   	          	 }
       			})
        }
     </script>
<body>
	<div id="applyContents">
		<div class="sub_visual">
			<span style="color: white;">협력사 지원</span>
		</div>
		<div class="container"
			style="display: flex; flex-wrap: wrap; width: 75%; justify-content: space-around; flex-direction: column; padding-bottom: 200px;">

			<!-- Modal -->
			<!-- <div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-dialog-scrollable">
 -->
			<div class="modal fade bd-example-modal-lg" id="myModal"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-scrollable">
					<!-- Modal content-->
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title" id="modal_title"></h5>
							<button type="button" class="close" data-dismiss="modal">×</button>
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
															<li id="personal"><strong>자격증 정보</strong></li>
															<li id="education"><strong>경력사항</strong></li>
															<li id="project"><strong>프로젝트</strong></li>
															<li id="introduce"><strong>자기소개서</strong></li>
														</ul>
														<!-- fieldsets -->
														<fieldset id="init">
															<div class="form-card">
																<h2 class="fs-title">기본정보</h2>
																<table border id="resumeTable">
																	<tr>
																		<th rowspan="4"><img
																			src="http://jjunstudio.com/zbxe/files/attach/images/351/652/85a698d051126aa4043e83f4ff2376a0.jpg"
																			style="width: 122px; height: 163px;" /></th>
																	</tr>
																	<tr>
																		<th>성명</th>
																		<td>강민주</td>
																		<th>영문명</th>
																		<td>Min ju Kang</td>
																	</tr>
																	<tr>
																		<!-- &nbsp; = 한칸 띄우기 -->
																		<th colspan="1" style="width: 84px;">나이</th>
																		<td colspan="1" style="width: 165px;">28세</td>
																		<th colspan="1" width="15%">성별</th>
																		<td colspan="1" width="200px">남자</td>

																	</tr>
																	<tr>
																		<th colspan="1">생년월일</th>
																		<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;년&nbsp;&nbsp;&nbsp;
																			월&nbsp;&nbsp;&nbsp;일</td>
																	</tr>
																	<tr>
																		<th>주소</th>
																		<td colspan="4">서울시 용산구 청파로 251 다올노블리움
																			513호kkkkkkkkkkkkkkkkkkkkkkkkkkkkk</td>
																	</tr>
																	<tr>
																		<th rowspan="2">연락처</th>
																		<th>전화번호</th>
																		<td colspan="4">031-000-0000</td>
																	</tr>
																	<tr>
																		<th>Email</th>
																		<td colspan="4">test@test.com</td>
																	</tr>
																	<tr>
																		<th rowspan="3">학력사항</th>
																		<th>최종학력</th>
																		<td colspan="4">대학교 졸업</td>
																	</tr>
																	<tr>
																		<th>전공</th>
																		<td colspan="4">컴퓨터공학과 (학점 :4.5)</td>
																	</tr>
																	<tr>
																		<th>학점</th>
																		<td colspan="4">4.0/4.5</td>
																	</tr>

																</table>
															</div>
															<input type="button" name="next"
																class="next action-button" value="다음" />
														</fieldset>
														<fieldset>
															<div class="form-card">
																<h2 class="fs-title">자격증 정보</h2>
																<table border id="resumeTable">
																	<tr>
																		<th>자격증 명</th>
																		<th>발행처/기관</th>
																		<th>취득일</th>
																	</tr>
																	<tr>
																		<td>SQLD</td>
																		<td>한국 데이터베이스 산업진흥원</td>
																		<td>2021.04.01</td>
																	</tr>
																</table>

																<h2 class="fs-title" style="margin-top: 100px">어학
																	시험</h2>
																<table border id="resumeTable">
																	<tr>
																		<th>언어</th>
																		<th>시험종류</th>
																		<th>점수</th>
																		<th>취득일</th>
																	</tr>
																	<tr>
																		<td>영어</td>
																		<td>TOEIC</td>
																		<td>990</td>
																		<td>2021.04.01</td>
																	</tr>
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
																	<tr>
																		<td colspan="2" style="background-color: #eee;">회사명</td>
																	</tr>
																	<tr>
																		<td>경력기간</td>
																		<td>2021.02.01~2021.02.28</td>
																	</tr>
																	<tr>
																		<td>직위</td>
																		<td>과장</td>
																	</tr>
																	<tr>
																		<td>고용형태</td>
																		<td>정규직</td>
																	</tr>

																	<tr>
																		<td colspan="2" style="background-color: #eee;">회사명</td>
																	</tr>
																	<tr>
																		<td>경력기간</td>
																		<td>2021.02.01~2021.02.28</td>
																	</tr>
																	<tr>
																		<td>직위</td>
																		<td>과장</td>
																	</tr>
																	<tr>
																		<td>고용형태</td>
																		<td>정규직</td>
																	</tr>

																	<tr>
																		<td colspan="2" style="background-color: #eee;">회사명</td>
																	</tr>
																	<tr>
																		<td>경력기간</td>
																		<td>2021.02.01~2021.02.28</td>
																	</tr>
																	<tr>
																		<td>직위</td>
																		<td>과장</td>
																	</tr>
																	<tr>
																		<td>고용형태</td>
																		<td>정규직</td>
																	</tr>

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
																	<tr>
																		<td colspan="2" style="background-color: #eee;">기관명</td>
																	</tr>
																	<tr>
																		<td style="width: 110px;">프로젝트 명</td>
																		<td>스프링 프로젝트</td>
																	</tr>
																	<tr>
																		<td>기간</td>
																		<td>2021.02.01~2021.02.28</td>
																	</tr>
																	<tr>
																		<td>개발환경<br> 및 사용기술
																		</td>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파 가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<td>프로젝트 소개</td>
																		<td>
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<td>담당한 역할</td>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>

																	<tr>
																		<td colspan="2" style="background-color: #eee;">기관명</td>
																	</tr>
																	<tr>
																		<td style="width: 110px;">프로젝트 명</td>
																		<td>스프링 프로젝트</td>
																	</tr>
																	<tr>
																		<td>기간</td>
																		<td>2021.02.01~2021.02.28</td>
																	</tr>
																	<tr>
																		<td>개발환경<br> 및 사용기술
																		</td>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파 가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<td>프로젝트 소개</td>
																		<td>
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<td>담당한 역할</td>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>

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
																		<th style="width: 110px;">성장과정</th>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파 가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<th>학교생활</th>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파 가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<th>성격 (장/단점)</th>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파 가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<th>희망업무 및 장래포부</th>
																		<td>
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파
																			가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파</td>
																	</tr>
																	<tr>
																		<th>기타사항</th>
																		<td>가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파가나다라마바사아차카타파</td>
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
							<!-- <div class="partnerInfoModalBody" style="text-align: left">
								<div class="row">
									<div class="col-3" style="color: #444444; font-weight: bold">
										<p>소개</p>
										<p>주소</p>
										<p>사원수</p>
										<p>이메일</p>
										<p>웹사이트</p>
									</div>
									<div class="col-8">
										<p id="partner_info"></p>
										<p id="partner_addr"></p>
										<p id="partner_headcnt"></p>
										<p id="partner_email"></p>
										<p id="partner_purl"></p>
									</div>
								</div>
							</div> -->
						</div>
						<div class="modal-footer">
							<button type="button" id="reset" class="btn btn-default"
								data-dismiss="modal">확인</button>
						</div>
					</div>

				</div>
			</div>

			<section id="tabs" class="project-tab">
				<div>
					<div class="row">
						<div class="col-md-12">
							<nav style="margin-top: 100px;">

								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a id="firstNav" href="#nav-home"
										data-toggle="tab" onclick="tabtab('#nav-home')"
										class="nav-link active">지원 목록</a></li>
									<li class="nav-item"><a id="secondNav" href="#nav-profile"
										data-toggle="tab" onclick="tabtab('#nav-profile')"
										class="nav-link">채용 제안</a></li>
								</ul>
							</nav>

							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-home"
									role="tabpanel" aria-labelledby="nav-home-tab">
									<%--                첫번째 탭의 테이블                --%>
									<table class="table" cellspacing="0">
										<thead>
											<tr>
												<th>이름</th>
												<th>지원서</th>
												<th>합 · 불합</th>
												<%-- <c:forEach var="apList" items="${applyList}">
												<c:choose>
												<c:when test="${apList.partnerApplyState != '진행중'}">
												 --%>
												<th>결과 변경</th>
												<%-- </c:when>
												</c:choose>
												</c:forEach>
											 --%>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="apList" items="${applyList}">
												<tr align="center">
													<td>${apList.memberVO.userName}</td>
													<td><a class="info" data-toggle="modal"
														href="#myModal"
														onclick="getResumeInfo('${apList.partnerApplyResumeID}','${apList.memberVO.userId}');">
															<i class="fas fa-search"></i>
													</a></td>
													<c:choose>
														<c:when test="${apList.partnerApplyState == '진행중'}">
															<td><a style="text-decoration: underline" href="#"
																onclick="chk_passOrFail('${apList.memberVO.userId}','${apList.memberVO.userName}','${apList.partnerApplyPartnerID}');"><i
																	class="fas fa-user-check"></i></a></td>
															<td></td>
														</c:when>
														<c:when test="${apList.partnerApplyState == '합격   '}">
															<td style="color: blue;">${apList.partnerApplyState}</td>
															<td><a style="text-decoration: underline" href="#"
																onclick="chk_reset('${apList.memberVO.userId}','${apList.memberVO.userName}','${apList.partnerApplyPartnerID}');"><i
																	class="fas fa-user-edit"></i></a>
														</c:when>
														<c:otherwise>
															<td style="color: red;">${apList.partnerApplyState}</td>
															<td><a style="text-decoration: underline" href="#"
																onclick="chk_reset('${apList.memberVO.userId}','${apList.memberVO.userName}','${apList.partnerApplyPartnerID}');"><i
																	class="fas fa-user-edit"></i></a>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="nav-profile" role="tabpanel"
									aria-labelledby="nav-profile-tab">
									<%--                두번째 탭의 테이블                --%>
									<table class="table" cellspacing="0">
										<thead>
											<tr>
												<th>이름</th>
												<th>이력서</th>
												<th>채용제안</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="sugList" items="${suggestionList}">
												<tr>
													<td>${sugList.userName}</td>
													<td><a class="info" data-toggle="modal"
														href="#myModal"
														onclick="getResumeInfo('${sugList.resumeVO.resumeID}','${sugList.userId}');">
															<i class="fas fa-search"></i>
													</a></td>

													<c:choose>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionAcception == null}">
															<td><a style="text-decoration: underline" href="#"
																onclick="suggestToUser('${sugList.userId}','${partner.partnerLicenseNum}','${sugList.userName}');return false;"><i
																	class="fas fa-hands-helping"></i></a></td>
														</c:when>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionAcception == '수락'}">
															<td style="color: blue;">${sugList.suggestionVO.partnerSuggestionAcception}</td>
														</c:when>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionAcception == '대기'}">
															<td style="color: green;">${sugList.suggestionVO.partnerSuggestionAcception}</td>
														</c:when>
														<c:otherwise>
															<td style="color: red;">${sugList.suggestionVO.partnerSuggestionAcception}</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when
															test="${sugList.suggestionVO.partnerSuggestionPartnerD != null }">
															<td><a style="text-decoration: underline" href="#"
																onclick="deleteSuggestion('${sugList.userId}','${partner.partnerLicenseNum}');"><i
																	class="fas fa-user-times"></i></a></td>
														</c:when>
														<c:otherwise>
															<td></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>