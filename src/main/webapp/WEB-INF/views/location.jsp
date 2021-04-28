<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/config/global.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <style>
        <%--    스르륵     --%>
        html {
            scroll-behavior: smooth;
        }

        .container {
            font-family: 'Noto Sans KR', sans-serif;
            width: 80%;
            /*scroll-behavior: smooth;*/
        }

        .container {
            font-family: 'Noto Sans KR', sans-serif;
            width: 80%;
        }

        .mapIntro {
            margin-top: 50px;
            text-align: left;
            font-size: 25px;
            font-weight: 600;
            padding-left: 30px;
            padding-top: 90px;
            padding-bottom: 50px;
            border-bottom: 1px solid #e0e0e0;
            letter-spacing: 5px;
        }

        .sub_visual {
            font-family: 'Noto Sans KR', sans-serif;
            width: 100%;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${contextPath}/resources/image/sub_visual/location.jpg");
            border: 0;
            font-size: 32px;
            font-weight: 500;
            height: 190px;
            padding-top: 69px;
            background-position: 50% 50%;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .pageIntro {
            font-family: 'Noto Sans KR', sans-serif;
            margin-top: 50px;
            text-align: left;
            font-size: 34px;
            font-weight: 450;
            background: url("${contextPath}/resources/image/icon/ico_title_bar.png") no-repeat;
            background-repeat: no-repeat;
        }

        .carouselImg {
            width: 100%;
        }

        .carousel-inner {
            height: 100%;
            min-width: 830px;
            position: relative;
            width: 100%;
            overflow: hidden;
            position: relative;
            position: relative;
        }

        .carousel-caption {
            top: 50%;
            transform: translateY(-50%);
            font-family: Chosunilbo_myungjo;
        }

        .carousel-caption {
            top: 50%;
            transform: translateY(-50%);
            font-family: Chosunilbo_myungjo;
        }

        .carousel-indicators > li {
            border-radius: 50%;
            width: 9px;
            height: 8px;
        }


    </style>

</head>
<body>
<div class="sub_visual">
</div>
<div class="container">

    <div class="lnb">
        <ul>
            <li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a
                    href="${pageContext.request.contextPath}/location.do">교육장 안내</a></li>
        </ul>
    </div>


    <div class="mapContainer" style="background-color: white">
        <div id="scrollClass" style="height: 25px"></div>
        <div  style="margin-top: 20px; text-align: left">
            <div></div>
        </div>
        <div class="pageIntro">강의실 안내</div>


        <!-- 캐러셀 시작 -->
        <div style="width: 70%; height: 70%; margin-left: 15%" id="carouselExampleIndicators"
             class="carousel slide custom-carousel" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0"
                    class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="carouselImg"
                         src="${contextPath}/resources/image/classroom/classroom1.jpg"
                         alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 style="font-weight: bold; text-shadow: 1px 1px 5px #000;"
                            class="animate__animated animate__fadeInDown">다양한 학습공간</h4>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="carouselImg"
                         src="${contextPath}/resources/image/classroom/classroom2.jpg"
                         alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 style="font-weight: bold; text-shadow: 1px 1px 5px #000;"
                            class="animate__animated animate__fadeInDown">편안한 생활공간</h4>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="carouselImg"
                         src="${contextPath}/resources/image/classroom/classroom3.jpg"
                         alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 style="font-weight: bold; text-shadow: 1px 1px 5px #000;"
                            class="animate__animated animate__fadeInDown">전문 실습공간</h4>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="carouselImg"
                         src="${contextPath}/resources/image/classroom/classroom4.jpg"
                         alt="Fourth slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 style="font-weight: bold; text-shadow: 1px 1px 5px #000;"
                            class="animate__animated animate__fadeInDown">다목적 회의실</h4>
                    </div>

                </div>
                <div class="carousel-item">
                    <img class="carouselImg"
                         src="${contextPath}/resources/image/classroom/classroom5.jpg"
                         alt="Fifth slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 style="font-weight: bold; text-shadow: 1px 1px 5px #000;"
                            class="animate__animated animate__fadeInDown">안락한 휴게시설</h4>
                    </div>
                </div>
            </div>

        </div>
        <!-- 캐러셀 종료 -->


        <div style="display: flex; justify-content: center; margin-top: 100px; padding-bottom: 150px">
            <%--      교육센터 안내도 이미지      --%>
            <img
                    src="${pageContext.request.contextPath}/resources/image/map/classinfo.jpg"
                    width="800" height="646">
        </div>

        <div id="scrollLocation" style="height: 25px"></div>
        <div class="pageIntro">오시는 길 안내</div>
        <div class="row" style="padding-top: 50px">
            <div class="col">
                <%--        약도 이미지        --%>
                <img
                        src="${pageContext.request.contextPath}/resources/image/map/mappic.jpg"
                        width="470px" height="400px">
                <div
                        style="display: flex; align-content: center; margin-top: 30px; margin-bottom: 50px">
                    <div
                            style="display: flex; justify-content: center; align-content: center; width: 60px; padding-bottom: 6px">
                        <img
                                src="${pageContext.request.contextPath}/resources/image/map/pin.jpg"
                                width="30px" height="30px">
                    </div>
                    (06707) 서울 서초구 효령로 176
                </div>
            </div>
            <div class="col">
                <%--        지도        --%>
                <div id="map"
                     style="display: flex; justify-content: center; align-content: center; width: 500px; height: 400px; min-width: 500px; max-width: 800px;">
                </div>
                <div
                        style="display: flex; align-content: center; margin-top: 30px; text-align: left">
                    <div
                            style="display: flex; justify-content: center; align-content: center; width: 60px; margin-top: 7px">
                        <img
                                src="${pageContext.request.contextPath}/resources/image/map/subway.jpg"
                                width="30px" height="30px">
                    </div>
                    2호선 방배역 1번 출구 우리은행 왼쪽 방향으로 나와 <br> 도보로 약 10분 거리
                </div>
                <div
                        style="display: flex; align-content: center; margin-top: 10px; text-align: left">
                    <div
                            style="display: flex; justify-content: center; align-content: center; width: 60px; margin-top: 7px">
                        <img
                                src="${pageContext.request.contextPath}/resources/image/map/bus.jpg"
                                width="30px" height="30px">
                    </div>
                    간선버스 142번, 363번, 461번, 641번 <br> 지선버스 4319번
                </div>
            </div>
        </div>
    </div>

</div>
</div>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=map_api_key%>"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        // 서울 서초구 효령로 174 (37.481961, 127.003104)
        center: new kakao.maps.LatLng(37.481961, 127.003104),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(37.481961, 127.003104);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
</script>

</body>
</html>
