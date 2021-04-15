<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js" />--%>
    <%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <%--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
    <%--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>--%>


    <title>협력사 지원</title>
    <style>
        /*.fouc {*/
        /*    display: none;*/
        /*}*/
    </style>
    <%--    <script>--%>


    <%--            &lt;%&ndash;let hash = window.location.hash;&ndash;%&gt;--%>

    <%--            &lt;%&ndash;if (hash == '' || hash == null) {&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    window.location = "#nav-home";&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    hash = window.location.hash;&ndash;%&gt;--%>
    <%--            &lt;%&ndash;}&ndash;%&gt;--%>

    <%--            &lt;%&ndash;console.log('ddddddddddddddddddddddd');&ndash;%&gt;--%>
    <%--            &lt;%&ndash;console.log(hash);&ndash;%&gt;--%>

    <%--            &lt;%&ndash;$('a[data-toggle="tab"]').cilck(function () {&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    window.location.hash =&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    ${this}.&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    arrt("href").substr(1);&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    console.log('wwwwwwwwwwwwwwwwwwwwww');&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    console.log(hash);&ndash;%&gt;--%>
    <%--            &lt;%&ndash;});&ndash;%&gt;--%>
    <%--            &lt;%&ndash;$('myTab a').on('shown.bs.tab', function(){&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    alert("showwwwww?");&ndash;%&gt;--%>
    <%--            &lt;%&ndash;    $(".fouc").show();&ndash;%&gt;--%>
    <%--            &lt;%&ndash;})&ndash;%&gt;--%>


    <%--            function getPartnerInfo(info) {--%>
    <%--                // document.getElementById("partner_info").innerHTML = info.innerHTML;--%>
    <%--                &lt;%&ndash;swal({&ndash;%&gt;--%>
    <%--                &lt;%&ndash;    text: `${obj.partnerInformation}`,&ndash;%&gt;--%>
    <%--                &lt;%&ndash;});&ndash;%&gt;--%>
    <%--                $("#partner_info").text(info);--%>
    <%--                // $("#myModal").modal('show');--%>
    <%--            }--%>
    <%--    </script>--%>
    <script>
        $(document).ready(function () {
            //     console.log('heeeeerrrreeeeeee');
            //     console.log(activeTab);
            // $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            //     localStorage.setItem('activeTab', $(e.target).attr('href'));
            //     console.log(activeTab + "yeeeeeeeeeee");
            // });
            let activeTab = localStorage.getItem('activeTab');
            // console.log('eeeeerrrrrrrrrrhhhh');
            // console.log(activeTab);
            // if (activeTab) {
            //     console.log(activeTab + 'oooooooooooooooooo');
            //     // $('.nav-tabs [href="' + activeTab + '"]').tab("show");
            //     // $('#myTab a[href="' + activeTab + '"]').tab('show');
            //     // $(activeTab).tab("show");
            //     // $('ul.nav-tabs li:eq(1)').tab('show');
            //     // $('.nav-tabs a[href="#nav-profile"]').tab('show');
            //     // $('#myTab a[href="' + activeTab + '"]').trigger('click');
            //     console.log('.nav-tabs a[href="' + activeTab + '"]');
            // }
            $("span:contains('진행중')").css({color:"green"});
            $("span:contains('불합격')").css({color:"blue"});
            $("span:contains('합격')").css({color:"red"});
            $('#myTab a[href="' + activeTab + '"]').trigger('click');

        });


        // if(activeTab == "#nav-profile"){
        //     console.log('gㅏ................');
        //     $("#firstNav").attr('class', 'nav-link');
        //     $("#secondNav").attr('class', 'nav-link active');
        // }

        // ${recruit.partnerAddress}', ${recruit.partnerEmail}, '${recruit.partnerHeadCount}', '${recruit.partnerURL}

        function getPartnerInfo(name, info, addr, email, headcnt, purl) {
            // document.getElementById("partner_info").innerHTML = info.innerHTML;
            <%--swal({--%>
            <%--    text: `${obj.partnerInformation}`,--%>
            <%--});--%>
            $("#modal_title").text(name);
            $("#partner_info").text(info);
            $("#partner_addr").text(addr);
            $("#partner_email").text(email);
            $("#partner_headcnt").text(headcnt);
            $("#partner_purl").text(purl);
            // console.log(info + 'rrrrrr' + addr + 'rrrrrr' + email + 'rrrrrr' + headcnt + 'rrrrrr' + purl);
            // $("#myModal").modal('show');
        }

        function tabtab(h) {
            localStorage.setItem('activeTab', h);
            console.log('href   yyyy' + h);
        }

        function deleteApplication(partnerApplyPartnerID) {
            const id = '${member.userId}';
            console.log(partnerApplyPartnerID + 'yeeeeeeeeeee' + id);
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
                    setTimeout(function () {
                        console.log('Works!');
                        location.reload();
                        // if(activeTab == "#nav-profile"){
                        //     $("#firstNav").attr('class', 'nav-link');
                        //     $("#secondNav").attr('class', 'nav-link active');
                        // }
                        // $('#myTab a[href="' + activeTab + '"]').trigger('click');
                    }, 900);

                    <%--$("#container").load("${contextPath}/member/apply.do", function () {--%>
                    <%--    console.log("success");--%>
                    <%--});--%>

                })
                .catch(e => console.log(e));
        }

        function chk_apply(a, b, c) {
            <%--                                            <%System.out.println("11111");%>--%>
            console.log('아아아아아아아ㅏㅏㅏㅏㅏㅏㅏ');
            <%--console.log(${member.resume});--%>
            <%--console.log(${member.userId});--%>


            let id = '${member.userId}';
            <%--let p = '${member.approvalStatus}';--%>
            let r = '${member.resume}'.toString();

            if ('${member.resume}' === "Y") {

                <%--console.log(${nowdate});--%>
                // const url = "${contextPath}/member/userApplyPartner.do";
                <%--const url = "${contextPath}/member/userApplyPartner.do";--%>
                <%--const body = {--%>
                //     'partnerApplyUserID' : b,
                //     'partnerApplyPartnerID' : c
                <%--}--%>
                // const option = {
                //     method: "POST",
                //     mode : "cors",
                //     headers: {
                //         "Content-Type": "application/json",
                //         "accept": "application/json"
                //     },
                //     body : JSON.stringify(body)
                // }
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
                        console.log(res)
                        if (res.status == '500') {
                            swal("중복 지원.", "중복 지원.", "info");
                        } else {
                            swal("지원 완료.", "지원 완료.", "success");
                            setTimeout(function () {
                                console.log('Works!');
                                location.reload();
                                // $('#myTab a[href="' + activeTab + '"]').trigger('click');
                            }, 900);


                            <%--$("#container").load("${contextPath}/member/apply.do", function () {--%>
                            <%--    console.log("success");--%>
                            <%--});--%>
                        }
                    })
                    .catch(e => console.log(e));


                // fetch(url, option)
                //     .then((response) => {
                //         console.log("??");
                //         console.log(response);
                //         swal("지원 완료.", "지원 완료.", "success");
                //     })
                //     .catch(e => console.log(e));
                <%--location.href = "${contextPath}/member/userApplyPartner.do?partnerApplyUserID="+b+"&partnerApplyPartnerID="+c--%>
                <%--location.href = "${contextPath}/member/userApplyPartner.do?partnerApplyUserID="+b;--%>
            } else {
                swal("등록 된 이력서 없음.", "이력서가 필요합니다.", "warning");
            }
            /*
            *
            * fetch()
            * .then(response => {
            *
            * }).then.catch
            *
            * */
        }
    </script>
    <style>
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
    </style>
</head>
<body>
<div id="applyContents">
    <div class="sub_visual">
        <span style="color: white;">협력사 지원</span>
    </div>
    <div class="container">
        <div class="lnb">
            <ul>
                <li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
                <li style="color: grey; font-weight: bold;">〉</li>
                <li class="on"><a href="${pageContext.request.contextPath}/member/apply.do">협력사 지원</a></li>
            </ul>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-dialog-scrollable">

                <!-- Modal content-->
                <div class="modal-content">
                    <%--                <div class="modal-header">--%>
                    <%--                    <button type="button" class="close" data-dismiss="modal">×</button>--%>
                    <%--                    <h4 class="modal-title">기업 정보</h4>--%>
                    <%--                </div>--%>
                    <div class="modal-header">
                        <h5 class="modal-title" id="modal_title"></h5>
                        <%--                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body">
                        <%--                    <p>Some text in the modal.</p>--%>
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
        <%--    <div class="modal" id="myModal" tabindex="-1">--%>
        <%--        <div class="modal-dialog">--%>
        <%--            <div class="modal-content">--%>
        <%--                <div class="modal-header">--%>
        <%--                    <h5 class="modal-title">Modal title</h5>--%>
        <%--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
        <%--                </div>--%>
        <%--                <div class="modal-body">--%>
        <%--                    <p>Modal body text goes here.</p>--%>
        <%--                </div>--%>
        <%--                <div class="modal-footer">--%>
        <%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--    </div>--%>

        <section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav style="margin-top: 100px;">
                            <%--                        <div class="nav nav-tabs" id="nav-tab">--%>
                            <%--                            <a class="nav-item" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">전체</a>--%>
                            <%--                            <a class="nav-item" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">진행중</a>--%>
                            <%--                            <a class="nav-item" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">마감</a>--%>
                            <%--                        </div>--%>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a id="firstNav" href="#nav-home" data-toggle="tab" onclick="tabtab('#nav-home')"
                                       class="nav-link active">지원 가능</a>
                                </li>
                                <li class="nav-item">
                                    <a id="secondNav" href="#nav-profile" data-toggle="tab"
                                       onclick="tabtab('#nav-profile')" class="nav-link">지원 완료</a>
                                </li>
                            </ul>
                        </nav>
                        <%--                        <c:when test="${localStorage.getItem('activeTab') == '#nav-profile'}">--%>

                        <%--                        </c:when>--%>

                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                 aria-labelledby="nav-home-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>기업명</th>
                                        <th>마감 날짜</th>
                                        <th>지원하기</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="recruit" items="${recruitsList}">
                                        <tr align="center">
                                                <%--                                            <td><a title="기업 정보 보기" style="text-decoration: underline" class="info" data-toggle="modal"--%>
                                                <%--                                                   href="#myModal">${recruit.partnerName}</a></td>--%>
                                                <%--                                        <td><a class="info" data-toggle="modal" href="#myModal" onclick="getPartnerInfo(${recruit.partnerInformation});">${recruit.partnerName}</a></td>--%>
                                            <td><a title="기업정보 보기" style="text-decoration: underline" class="info"
                                                   data-toggle="modal" href="#myModal"
                                                   onclick="getPartnerInfo('${recruit.partnerName}', '${recruit.partnerInformation}', '${recruit.partnerAddress}', '${recruit.partnerEmail}', '${recruit.partnerHeadCount}', '${recruit.partnerURL}');">${recruit.partnerName}</a>
                                            </td>
                                            <td>${recruit.partnerApplyFinishDate}</td>
                                                <%--                                        <td>${recruit.partnerApplyFinishDate}</td>--%>
                                            <td><a style="text-decoration: underline" href="#"
                                                   onclick="chk_apply('${member.resume}', '${member.userId}', '${recruit.partnerLicenseNum}');return false;">지원하기</a>
                                            </td>
                                                <%--                                        ${date}&partnerApplyState='진행중'"--%>
                                        </tr>


                                        <%--                                        <!-- Modal -->--%>
                                        <%--                                        <div class="modal fade" id="myModal" role="dialog">--%>
                                        <%--                                            <div class="modal-dialog">--%>

                                        <%--                                                <!-- Modal content-->--%>
                                        <%--                                                <div class="modal-content">--%>
                                        <%--                                                    <div class="modal-header">--%>
                                        <%--                                                        <h5 class="modal-title">기업 정보</h5>--%>
                                        <%--                                                        <button type="button" class="close" data-dismiss="modal">×--%>
                                        <%--                                                        </button>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                    <div class="modal-body">--%>
                                        <%--                                                        <p>기업정보: ${recruit.partnerInformation}</p>--%>
                                        <%--                                                        <p>주소: ${recruit.partnerAddress}</p>--%>
                                        <%--                                                        <p>이메일: ${recruit.partnerEmail}</p>--%>
                                        <%--                                                        <p>인원 규모: ${recruit.partnerHeadCount}</p>--%>
                                        <%--                                                        <p>사이트: ${recruit.partnerURL}</p>--%>

                                        <%--                                                    </div>--%>
                                        <%--                                                    <div class="modal-footer">--%>
                                        <%--                                                        <button type="button" class="btn btn-default"--%>
                                        <%--                                                                data-dismiss="modal">--%>
                                        <%--                                                            확인--%>
                                        <%--                                                        </button>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                 aria-labelledby="nav-profile-tab">
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
                                                <%--                                            <td>${application.PARTNRENAME}</td>--%>
                                            <td>${application.partnerApplyDate}</td>
                                                <%--                                            <td>${application.PARTNERAPPLYDATE}</td>--%>
                                            <td ><span>${application.partnerApplyState}</span></td>
                                                <%--                                            <td>${application.PARTNERAPPLYSTATE}</td>--%>
                                            <td><a style="text-decoration: underline" href="#"
                                                   onclick="deleteApplication('${application.partnerID}');return false;">지원서
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
