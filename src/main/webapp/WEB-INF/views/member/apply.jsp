<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>--%>


    <title>협력사 지원</title>
    <script>
        function getPartnerInfo() {
            $.ajax({
                type: "POST",
                url: "${contextPath}/member/apply.do",
                success:
            })
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
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
<%--                <div class="modal-header">--%>
<%--                    <button type="button" class="close" data-dismiss="modal">×</button>--%>
<%--                    <h4 class="modal-title">기업 정보</h4>--%>
<%--                </div>--%>
                <div class="modal-header">
                    <h5 class="modal-title">기업 정보</h5>
<%--                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <p>Some text in the modal.</p>
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
                                        <td><a data-toggle="modal" href="#myModal" onclick="getPartnerInfo();">${recruit.partnerName}</a></td>
                                        <td>${recruit.partnerInformation}</td>
                                        <td>${recruit.partnerApplyFinishDate}</td>
                                    </tr>
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
                                <tr>
                                    <td><a href="#">협력사1</a></td>
                                    <td>20200408</td>
                                    <td>진행중</td>
                                </tr>
                                <tr>
                                    <td><a href="#">협력사2</a></td>
                                    <td>20200408</td>
                                    <td>진행중</td>
                                </tr>
                                <tr>
                                    <td><a href="#">협력사3</a></td>
                                    <td>20200408</td>
                                    <td>진행중</td>
                                </tr>
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
