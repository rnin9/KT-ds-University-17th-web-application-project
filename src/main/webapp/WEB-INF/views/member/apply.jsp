<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<%--<%= sf.format(nowTime) %>--%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="nowddate" value="${sf.format(nowTime)}"/>
<!DOCTYPE html>
<html>
<head>
<%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>--%>


    <title>협력사 지원</title>
    <script>
        function getPartnerInfo(info) {
            // document.getElementById("partner_info").innerHTML = info.innerHTML;
            <%--swal({--%>
            <%--    text: `${obj.partnerInformation}`,--%>
            <%--});--%>
            $("#partner_info").text(info);
            // $("#myModal").modal('show');
        }
    </script>
    <script>
        function chk_apply (a,b,c) {
            <%--                                            <%System.out.println("11111");%>--%>
            console.log('아아아아아아아ㅏㅏㅏㅏㅏㅏㅏ');
           <%--console.log(${member.resume});--%>
           <%--console.log(${member.userId});--%>

            let id = '${member.userId}';
            <%--let p = '${member.approvalStatus}';--%>
            let r = '${member.resume}'.toString();

            if('${member.resume}' === "Y") {

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
                    mode : "cors",
                    headers: {
                        "Content-Type": "application/json",
                        "accept": "application/json"
                    },
                    body : JSON.stringify({
                        partnerApplyUserID : b,
                        partnerApplyPartnerID : c
                    })
                })
                    .then(res => {
                        console.log(res)
                        if(res.status == '500') {
                            swal("중복 지원.", "중복 지원.", "info");
                        } else {
                            swal("지원 완료.", "지원 완료.", "success");
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
<%--    <!-- Modal -->--%>
<%--    <div class="modal fade" id="myModal" role="dialog">--%>
<%--        <div class="modal-dialog">--%>

<%--            <!-- Modal content-->--%>
<%--            <div class="modal-content">--%>
<%--&lt;%&ndash;                <div class="modal-header">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="button" class="close" data-dismiss="modal">×</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <h4 class="modal-title">기업 정보</h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title">기업 정보</h5>--%>
<%--&lt;%&ndash;                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"></button>&ndash;%&gt;--%>
<%--                    <button type="button" class="close" data-dismiss="modal">×</button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--&lt;%&ndash;                    <p>Some text in the modal.</p>&ndash;%&gt;--%>
<%--                    <p id="partner_info"></p>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
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
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" data-toggle="tab" href="#nav-home">지원 가능</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#nav-profile">지원 완료</a>
                            </li>
                        </ul>
                    </nav>

                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            <table class="table" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>기업명</th>
                                    <th>마감 날짜</th>
                                    <th>지원하기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="recruit" items="${recruitsList}" >
                                    <tr align="center">
                                        <td><a class="info" data-toggle="modal" href="#myModal">${recruit.partnerName}</a></td>
<%--                                        <td><a class="info" data-toggle="modal" href="#myModal" onclick="getPartnerInfo(${recruit.partnerInformation});">${recruit.partnerName}</a></td>--%>
<%--                                        <td><a data-toggle="modal" href="#myModal" onclick="getPartnerInfo(${recruit.partnerInformation});">${recruit.partnerName}</a></td>--%>
                                        <td>${recruit.partnerApplyFinishDate}</td>
<%--                                        <td>${recruit.partnerApplyFinishDate}</td>--%>
                                        <td><a href="#" onclick="chk_apply('${member.resume}', '${member.userId}', '${recruit.partnerLicenseNum}');return false;">지원하기</a></td>
<%--                                        ${date}&partnerApplyState='진행중'"--%>
                                    </tr>


                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">기업 정보</h5>
                                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>${recruit.partnerInformation}</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <table class="table" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>기업명</th>
                                    <th>지원 날짜</th>
                                    <th>지원 상태</th>
                                </tr>
                                </thead>
                                <tbody>
<%--                                <tr>--%>
<%--                                    <td><a href="#">협력사1</a></td>--%>
<%--                                    <td>20200408</td>--%>
<%--                                    <td>진행중</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td><a href="#">협력사2</a></td>--%>
<%--                                    <td>20200408</td>--%>
<%--                                    <td>진행중</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td><a href="#">협력사3</a></td>--%>
<%--                                    <td>20200408</td>--%>
<%--                                    <td>진행중</td>--%>
<%--                                </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>

</body>
</html>
