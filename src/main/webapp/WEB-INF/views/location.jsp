<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-04-05
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/config/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <style>

        .mapContiner {
            font-family: 'Noto Sans KR', sans-serif;
            width: 80%;
            margin-left: 10%;
        }

        .lnb {
            display: block;
            border-bottom: 1px solid #eeeeee;
            padding: 20px 0 0;
        }

        .lnb > ul {
            list-style: none;
            padding: 0;
            text-align: left;
        }

        .lnb > ul > li {
            display: inline-block;
            margin-left: 9px;
            padding-left: 15px;
            margin-left: 9px;
        }

        a:link, a:visited, a:hover {
            color: black;
            text-decoration: none;
        }

        .mapIntro {
            margin-top: 50px;
            text-align: center;
            font-size: 34px;
            font-weight: 450;
        }

        .sub_visual {
            font-family: 'Noto Sans KR', sans-serif;
            width: 100%;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("${pageContext.request.contextPath}/resources/image/sub_visual/location.jpg");
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
    <span style="color: white;">오시는 길</span>
</div>
<div class="mapContiner">
    <div class="lnb">
        <ul>
            <li><a href="${pageContext.request.contextPath}/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a href="${pageContext.request.contextPath}/location.do">오시는 길</a></li>
        </ul>
    </div>
    <div class="mapIntro">
        오시는 길 안내
    </div>
    <div class="container">
        <div class="row">

            <div class="col" style="width:500px;height:400px;background: url("${pageContext.request.contextPath}/resources/image/map/mappic.jpg");">
        </div>
        <div class="col" id="map" style="width:500px;height:400px;"></div>

    </div>
    <div>
        <p>
            지하철 - 2호선 방배역 1번 출구 우리은행 왼쪽 방향으로 나와 도보로 약 10분 거리
            <br>
            간선버스 - 142번, 363번, 461번, 641번
            지선버스 - 4319번
        </p>
    </div>
</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%= map_api_key %>"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        // 서울 서초구 효령로 174 - 37.481961, 127.003104
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
