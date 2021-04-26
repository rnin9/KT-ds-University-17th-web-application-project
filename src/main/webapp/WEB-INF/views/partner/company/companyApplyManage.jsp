<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<style>
</style>
<script>
        $(document).ready(function () {
            let activeTab = sessionStorage.getItem('activeTab');

            // 지원 상태 별로 색 설정
            $("span:contains('진행중')").css({color: "green"});
            $("span:contains('불합격')").css({color: "blue"});
            $("span:contains('합격')").css({color: "red"});

            // 새로고침 후 탭 상태 보존
            $('#myTab a[href="' + activeTab + '"]').trigger('click');
        });

        // 모달 body text 설정
        
        function getResumeInfo(resumeID) {
        	console.log(resumeID);
   
        	 fetch("${contextPath}/partner/getResumeByID.do", {
                  method: "GET",
                  mode: "cors",
                  headers: {
                      "Content-Type": "application/json",
                      "accept": "application/json"
                  },
                  body: JSON.stringify({
                      partnerApplyResumeID: resumeID
                  })
              })
                  .then(res => {
                	  console.log(res);
            		/* 
                	  $("#modal_title").text(name);
                      $("#partner_info").text(info);
                      $("#partner_addr").text(addr);
                      $("#partner_email").text(email);
                      $("#partner_headcnt").text(headcnt);
                      $("#partner_purl").text(purl); */
                  })
                  .catch(e => console.log(e));
            }

        // 탭 클릭 시 session에 현재 탭 값 저장
        function tabtab(h) {
            sessionStorage.setItem('activeTab', h);
            console.log('href   yyyy' + h);
        }

        // 지원 삭제 함수
        function deleteApplication(partnerApplyPartnerID) {
            const id = '${member.userId}';
            fetch("${contextPath}/member/deleteApplication.do", {
                method: "POST",
                mode: "cors",
                headers: {
                    "Content-Type": "application/json",
                    "accept": "application/json"
                },
                body: JSON.stringify({
                    partnerApplyUserID: '${member.userId}',
                    partnerApplyPartnerID: partnerApplyPartnerID
                })
            })
                .then(res => {
                    console.log(res);

                    swal("지원 삭제 완료.", "지원 삭제 완료.", "success");
                    setTimeout(function () { // 0.9초뒤 실행
                        location.reload(); // 새로고침 -> list 다시 불러옴
                    }, 900);

                })
                .catch(e => console.log(e));
        }

        // 지원 함수
        function chk_apply(a, b, c) {

            // 사용자의 이력서가 등록 되어있다면
            if ('${member.resume}' === "Y") {

                fetch("${contextPath}/member/userApplyPartner.do", {
                    method: "POST",
                    mode: "cors",
                    headers: {
                        "Content-Type": "application/json",
                        "accept": "application/json"
                    },
                    body: JSON.stringify({
                        partnerApplyUserID: b,
                        partnerApplyPartnerID: c
                    })
                })
                    .then(res => {
                        if (res.status == '500') {
                            // mybatis 오류 시 500 error
                            swal("중복 지원.", "중복 지원.", "info");
                        } else {
                            swal("지원 완료.", "지원 완료.", "success");
                            setTimeout(function () { // 0.9초뒤 실행
                                location.reload(); // 새로고침 -> list 다시 불러옴
                            }, 900);
                        }
                    })
                    .catch(e => console.log(e));

            //이력서가 없다면
            } else {
                swal("등록 된 이력서 없음.", "이력서가 필요합니다.", "warning");
            }
        }
    </script>
<body>
<div id="applyContents">
    <div class="sub_visual">
        <span style="color: white;">협력사 지원</span>
    </div>
    <div class="container">

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-dialog-scrollable">

                <!-- Modal content-->
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="modal_title"></h5>
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="partnerInfoModalBody" style="text-align: left">
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
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
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
                                <li class="nav-item">
                                    <a id="firstNav" href="#nav-home" data-toggle="tab" onclick="tabtab('#nav-home')"
                                       class="nav-link active">지원 목록</a>
                                </li>
                                <li class="nav-item">
                                    <a id="secondNav" href="#nav-profile" data-toggle="tab"
                                       onclick="tabtab('#nav-profile')" class="nav-link">채용 제안</a>
                                </li>
                            </ul>
                        </nav>

                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                 aria-labelledby="nav-home-tab">
                                <%--                첫번째 탭의 테이블                --%>
                                <table class="table" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>이름</th>
                                        <th>지원서</th>
                                        <th>채용제안</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="apList" items="${applyList}">
                                        <tr align="center">
                                      	  <td>${apList}</td>
                                         	<td>${apList.memberVO.userName}</td>
                                         	<td><a title="기업정보 보기" style="text-decoration: underline" class="info"
                                                   data-toggle="modal" href="#myModal"
                                                   onclick="getResumeInfo('${apList.partnerApplyResumeID}');"><i class="far fa-id-card"></i></a>
                                            </td>
                                           
                                            <td><a style="text-decoration: underline" href="#"
                                                   onclick="chk_apply('${member.resume}', '${member.userId}', '${recruit.partnerLicenseNum}');return false;">지원하기</a>
                                            </td>
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
                                        <th>기업명</th>
                                        <th>지원 날짜</th>
                                        <th>지원 상태</th>
                                        <th>삭제하기</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="application" items="${applicationList}">
                                        <tr>
                                            <td>${application.partnerName}</td>
                                            <td>${application.partnerApplyDate}</td>
                                            <td><span>${application.partnerApplyState}</span></td>
                                            <td><a style="text-decoration: underline" href="#"
                                                   onclick="deleteApplication('${application.partnerApplyResumeID}');return false;">지원서
                                                삭제</a>
                                            </td>
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

