<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <title>채용공고</title>

    <script>
        $(document).ready(() => {
            let activeTab = sessionStorage.getItem('activeTab');

            // 지원 상태 별로 색 설정
            $("span:contains('진행중')").css({color: "limegreen"});
            $("span:contains('불합격')").css({color: "blue"});
            $("span:contains('합격')").css({color: "red"});

            // 새로고침 후 탭 상태 보존
            $('#myTab a[href="' + activeTab + '"]').trigger('click');

            $('#nav-home-table').DataTable({
                retrieve: true,
                language: {
                    info: '총 _TOTAL_ 개의 결과 중 _START_번 부터 _END_번',
                    sInfoFiltered: '',
                    infoEmpty: '',
                    emptyTable: '데이터가 없습니다.',
                    thousands: ',',
                    lengthMenu: '_MENU_ 개씩 보기',
                    loadingRecords: '데이터를 불러오는 중',
                    processing: '처리 중',
                    zeroRecords: '검색 결과 없음',
                    paginate: {
                        first: '처음',
                        last: '끝',
                        next: '다음',
                        previous: '이전'
                    },
                    search: '',
                    sSearchPlaceholder: '통합 검색',
                }
            });

            $('#nav-profile-table').DataTable({
                retrieve: true,
                language: {
                    info: '총 _TOTAL_ 개의 결과 중 _START_번 부터 _END_번',
                    sInfoFiltered: '',
                    infoEmpty: '',
                    emptyTable: '데이터가 없습니다.',
                    thousands: ',',
                    lengthMenu: '_MENU_ 개씩 보기',
                    loadingRecords: '데이터를 불러오는 중',
                    processing: '처리 중',
                    zeroRecords: '검색 결과 없음',
                    paginate: {
                        first: '처음',
                        last: '끝',
                        next: '다음',
                        previous: '이전'
                    },
                    search: '',
                    sSearchPlaceholder: '통합 검색',
                }
            });

            $('#nav-suggestion-table').DataTable({
                retrieve: true,
                language: {
                    info: '총 _TOTAL_ 개의 결과 중 _START_번 부터 _END_번',
                    sInfoFiltered: '',
                    infoEmpty: '',
                    emptyTable: '데이터가 없습니다.',
                    thousands: ',',
                    lengthMenu: '_MENU_ 개씩 보기',
                    loadingRecords: '데이터를 불러오는 중',
                    processing: '처리 중',
                    zeroRecords: '검색 결과 없음',
                    paginate: {
                        first: '처음',
                        last: '끝',
                        next: '다음',
                        previous: '이전'
                    },
                    search: '',
                    sSearchPlaceholder: '통합 검색',
                }
            });

        });

        // 모달 body text 설정
        getPartnerInfo = (name, info, addr, email, headcnt, purl) => {
            $("#modal_title").text(name);
            $("#partner_info").text(info);
            $("#partner_addr").text(addr);
            $("#partner_email").text(email);
            $("#partner_headcnt").text(headcnt);
            $("#partner_purl").text(purl);
        }

        // 탭 클릭 시 session에 현재 탭 값 저장
        tabtab = (h) => {
            sessionStorage.setItem('activeTab', h);
            // console.log('href   yyyy' + h);
        }

        // 지원 삭제 함수
        deleteApplication = (partnerApplyPartnerID) => {
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
                    // console.log(res);

                    swal("지원 삭제 완료.", "지원 삭제 완료.", "success");
                    setTimeout(() => { // 0.9초뒤 실행
                        location.reload(); // 새로고침 -> list 다시 불러옴
                    }, 900);

                })
                .catch(e => console.log(e));
        }

        // 지원 함수
        chk_apply = (a, b, c) => {

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
                            setTimeout(() => { // 0.9초뒤 실행
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

        deleteSuggestion = () => {
            const url = "${contextPath}/member/deleteSuggestion.do";
            let valueArr;
            const cnt = $("input[name='cb']:checked").length;
            if (cnt === 0) {
                swal("선택된 항목이 없습니다.", "삭제할 항목을 선택하세요.", "warning");
                return;
            } else {
                Swal.fire({
                    title: '받은 제안을 삭제하시겠습니까?',
                    text: "삭제하면 다시 복구할 수 없습니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '삭제',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.value) {
                        valueArr = [];
                        const userId = '${member.userId}';
                        valueArr.push(userId);
                        $("input[name='cb']:checked").each((i) => {
                            valueArr.push($(this).val());
                        });

                        $.ajax({
                            url: url,
                            type: 'POST',
                            traditional: true,
                            data: {
                                valueArr: valueArr
                            },
                            success: (data) => {

                                Swal.fire("삭제 성공.", "받은 제안이 삭제되었습니다.", "success");
                                setTimeout(() => { // 0.9초뒤 실행
                                    location.reload(); // 새로고침 -> list 다시 불러옴
                                }, 900);
                            },
                            error: (data) => {
                                // console.log("fail sd");
                            }
                        });
                    }
                })
            }
        }

        suggestionModal = (partnerID, name, date, description, acception) => {
            date = date.substr(0, 11);
            //console.log(table.row(this).data());
            $(".modal-body div span").text("");
            $("#suggestion_partner_id").text(partnerID);
            $("#suggestion_partner").text(name);
            $("#suggestion_date").text(date);
            $("#suggestion_description").text(description);
            if (acception === '수락' || acception === '거절') {
                // console.log('수락거절ㄹㄹㄹㄹ');
                $('#accept').attr('style', "display:none;");
                $('#reject').attr('style', "display:none;");
                $('#alreadyApply').attr('style', "display:'';");
            } else {
                // console.log('ㄴㄴㄴㄴㄴㄴㄴㄴ');
                $('#accept').attr('style', "display:'';");
                $('#reject').attr('style', "display:'';");
                $('#alreadyApply').attr('style', "display:none;");
            }
            $("#myModal2").modal("show");
        }

        suggestAccept = () => {
            let partnerID = document.getElementById("suggestion_partner_id").innerText;
            const userId = '${member.userId}';
            // console.log(partnerID);

            const url = "${contextPath}/member/acceptSuggestion.do";

            Swal.fire({
                title: '받은 제안을 수락하시겠습니까?',
                text: "",
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '수락',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.value) {

                    fetch(url, {
                        method: "POST",
                        mode: "cors",
                        headers: {
                            "Content-Type": "application/json",
                            "accept": "application/json"
                        },
                        body: JSON.stringify({
                            partnerID: partnerID,
                            userId: userId
                        })
                    })
                        .then(res => {
                            if (res.status == '500') {
                                // mybatis 오류 시 500 error
                                // console.log("failㅣㅣㅣㅣㅣ");
                            } else {
                                Swal.fire("제안 수락.", "받은 제안을 수락했습니다.", "success");
                                setTimeout(() => { // 0.9초뒤 실행
                                    location.reload(); // 새로고침 -> list 다시 불러옴
                                }, 900);
                            }
                        })
                }
            })
        }

        suggestReject = () => {
            let partnerID = document.getElementById("suggestion_partner_id").innerText;
            const userId = '${member.userId}';
            // console.log(partnerID);

            const url = "${contextPath}/member/rejectSuggestion.do";

            Swal.fire({
                title: '받은 제안을 거절하시겠습니까?',
                text: "",
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '거절',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.value) {

                    fetch(url, {
                        method: "POST",
                        mode: "cors",
                        headers: {
                            "Content-Type": "application/json",
                            "accept": "application/json"
                        },
                        body: JSON.stringify({
                            partnerID: partnerID,
                            userId: userId
                        })
                    })
                        .then(res => {
                            if (res.status == '500') {
                                // mybatis 오류 시 500 error
                                // console.log("failㅣㅣㅣㅣㅣ");
                            } else {
                                Swal.fire("제안 거절.", "받은 제안이 거절되었습니다.", "success");
                                setTimeout(() => { // 0.9초뒤 실행
                                    location.reload(); // 새로고침 -> list 다시 불러옴
                                }, 900);
                            }
                        })
                }
            })
        }

    </script>
    <script>
        checkSelectAll = (checkbox) => {
            const selectall
                = document.querySelector('input[name="check-all"]');
            if (checkbox.checked == false) {
                selectall.checked = false;
            }
        }

        selectAll = (selectAll) => {
            const checkboxes
                = document.getElementsByName('cb');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }
    </script>
    <style>

        .buttonGroups {
            float: right;
        }

        .btn {
            color: white;
            display: inline-block;
            font-weight: 400;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-color: tomato;
            border-color: rgba(247, 94, 94, 0.8);
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: .25rem;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        .container {
            font-family: 'Noto Sans KR', sans-serif;
            width: 80%;
            margin-left: 10%;
        }

        .sub_visual {
            font-family: 'Noto Sans KR', sans-serif;
            width: 100%;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${pageContext.request.contextPath}/resources/image/sub_visual/apply.jpg");
            border: 0;
            font-size: 32px;
            font-weight: 500;
            height: 190px;
            padding-top: 69px;
            background-position: 50% 50%;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .tableList {
            border-collapse: collapse;
            font-size: 14px;
            line-height: 2.2;
            margin-top: 40px;
            text-align: center;
            /* color: #555; */
            width: 100%;
            line-height: 40px;
        }


        .tableList thead {
            border-top: 1px solid #e4e4e4;
            border-bottom: 1px solid #e4e4e4;
            background-color: #f8f8f8;
            text-align: center;
        }

        .pageIntro {
            font-family: 'Noto Sans KR', sans-serif;
            margin-top: 50px;
            margin-bottom: 50px;
            text-align: left;
            font-size: 34px;
            font-weight: 450;
            background: url("${pageContext.request.contextPath}/resources/image/icon/ico_title_bar.png") no-repeat;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<div id="applyContents">
    <div class="sub_visual">
        <%--        <span style="color: white;">협력사 지원</span>--%>
    </div>
    <div class="container">
        <div class="lnb">
            <ul>
                <li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
                <li style="color: grey; font-weight: bold;">〉</li>
                <li class="on"><a href="${pageContext.request.contextPath}/member/apply.do">채용공고</a></li>
            </ul>
        </div>

        <div class="pageIntro">협력사 지원</div>

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

        <!-- Modal for tab3 -->
        <div class="modal fade" id="myModal2" role="dialog">
            <div class="modal-dialog modal-dialog-scrollable">

                <!-- Modal content-->
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="modal_title2"></h5>
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="suggestionModalBody" style="text-align: left">
                            <div class="row">
                                <div class="col-3" style="color: #444444; font-weight: bold">
                                    <p>협력사</p>
                                    <p>날짜</p>
                                    <p>내용</p>
                                </div>
                                <div class="col-8">
                                    <p id="suggestion_partner_id" style="display: none"></p>
                                    <p id="suggestion_partner"></p>
                                    <p id="suggestion_date"></p>
                                    <p id="suggestion_description"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="accept" onclick="suggestAccept()">수락</button>
                        <button type="button" class="btn btn-default" id="reject" onclick="suggestReject()">거절</button>
                        <a id="alreadyApply">이미 응답한 제안입니다.</a>
                        <%--                        <button type="button" class="btn btn-default" id="alreadyApply">이미 응답한 제안입니다.</button>--%>
                    </div>
                </div>

            </div>
        </div>

        <section id="tabs" class="project-tab">
            <div>
                <%--                <div class="row">--%>
                <%--                    <div class="col-md-12">--%>
                <nav style="margin-bottom: 40px;">

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a id="firstNav" href="#nav-home" data-toggle="tab" onclick="tabtab('#nav-home')"
                               class="nav-link active">지원 가능</a>
                        </li>
                        <li class="nav-item">
                            <a id="secondNav" href="#nav-profile" data-toggle="tab"
                               onclick="tabtab('#nav-profile')" class="nav-link">지원 완료</a>
                        </li>
                        <li class="nav-item">
                            <a id="thirdNav" href="#nav-suggestion" data-toggle="tab"
                               onclick="tabtab('#nav-suggestion')" class="nav-link">받은 제안</a>
                        </li>
                    </ul>
                </nav>


                <div class="tab-content" id="nav-tabContent">
                    <%--                첫번째 탭의 테이블                --%>
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                         aria-labelledby="nav-home-tab">
                        <table class="tableList" id="nav-home-table">
                            <thead>
                            <tr>
                                <td>기업명</td>
                                <td>마감 날짜</td>
                                <td>지원하기</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="recruit" items="${recruitsList}">
                                <tr align="center">
                                    <td><a title="기업정보 보기" style="text-decoration: underline" class="info"
                                           data-toggle="modal" href="#myModal"
                                           onclick="getPartnerInfo('${recruit.partnerName}', '${recruit.partnerInformation}', '${recruit.partnerAddress}', '${recruit.partnerEmail}', '${recruit.partnerHeadCount}', '${recruit.partnerURL}');">${recruit.partnerName}</a>
                                    </td>
                                    <td>${fn:substring(recruit.partnerApplyFinishDate, 0, 11)}</td>
                                    <td><a style="text-decoration: underline" href="#"
                                           onclick="chk_apply('${member.resume}', '${member.userId}', '${recruit.partnerLicenseNum}');return false;">지원하기</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <%--                두번째 탭의 테이블                --%>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                         aria-labelledby="nav-profile-tab">
                        <table class="tableList" id="nav-profile-table" style="width: 100%">
                            <thead>
                            <tr>
                                <td>기업명</td>
                                <td>지원 날짜</td>
                                <td>지원 상태</td>
                                <td>삭제하기</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="application" items="${applicationList}">
                                <tr>
                                    <td>${application.partnerName}</td>
                                    <td>${fn:substring(application.partnerApplyDate, 0, 11)}</td>
                                    <td><span>${application.partnerApplyState}</span></td>
                                    <td><a style="text-decoration: underline" href="#"
                                           onclick="deleteApplication('${application.partnerID}');return false;">지원서
                                        삭제</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <%--             세번째 탭의 테이블                   --%>
                    <div class="tab-pane fade" id="nav-suggestion" role="tabpanel"
                         aria-labelledby="nav-suggestion-tab">
                        <table class="tableList table-hover" id="nav-suggestion-table" style="width: 100%">
                            <thead>
                            <tr>
                                <td><input type="checkbox" name="check-all"
                                           onclick='selectAll(this)'/></td>
                                <td>기업명</td>
                                <td>내용</td>
                                <td>받은 날짜</td>
                                <td>상태</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="suggestion" items="${suggestionList}">
                                <tr onclick="suggestionModal('${suggestion.partnerID}', '${suggestion.partnerName}', '${suggestion.suggestionDate}', '${suggestion.suggestDescription}', '${suggestion.acception}');">
                                    <td onclick="event.cancelBubble=true"><input type="checkbox" name="cb"
                                                                                 value="${suggestion.partnerID}"
                                                                                 onclick='checkSelectAll(this)'/></td>
                                    <td>${suggestion.partnerName}</td>
                                    <td>${fn:substring(suggestion.suggestDescription, 0, 15)}...</td>
                                        <%--                                    <td style="display: none">${suggestion.suggestDescription}</td>--%>
                                    <td>${fn:substring(suggestion.suggestionDate, 0, 11)}</td>
                                    <td>${suggestion.acception}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="buttonGroups" style="margin-top: 40px; padding-bottom: 150px;">
                            <button type="button" class="btn" onclick="deleteSuggestion()">삭제</button>
                        </div>
                    </div>

                </div>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </section>
    </div>
</div>
</body>
</html>
