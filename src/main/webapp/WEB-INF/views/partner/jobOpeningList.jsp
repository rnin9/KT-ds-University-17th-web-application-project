<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <script src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

    <title>채용공고 관리</title>

    <style>
        .container {
            font-family: 'Noto Sans KR', sans-serif;
            width: 80%;
        }

        .well-searchbox label {
            color: #555;
            width: 20%;
            margin: 10px;
            text-align: right;
        }

        .serarchSubject {
            display: flex;
            flex-direction: row;
            width: 250px;
            float: right;
        }

        .table_partnerList {
            border-collapse: collapse;
            font-size: 14px;
            line-height: 2.2;
            margin-top: 12px;
            color: #555;
            width: 100%;
            margin: auto;
            line-height: 40px;
        }

        .table_partnerList thead > tr > th {
            border-top: 1px solid #e4e4e4;
            border-bottom: 1px solid #e4e4e4;
            background-color: #f8f8f8;
        }

        .form-control {
            width: 180px;
        }


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
    </style>
    <script>
        const url = "${contextPath}/partner/deleteJobOpening.do";
        let valueArr;

        $(document).ready(function () {
            $('#myTable').DataTable();
        });

        deleteJobOpening = () => {
            console.log('111111111');
            const cnt = $("input[name='cb']:checked").length;
            // $('#myModal').modal('show');
            if (cnt === 0) {
                swal("선택한거없음.", "선택한거없음.", "warning");
                return;
            } else {
                deleteJobOpening2();
            }
        }
        deleteJobOpening2 = () => {
            console.log('22222222');
            valueArr = [];
            $("input[name='cb']:checked").each(function (i) {
                valueArr.push($(this).val());
            });

            $.ajax({
                url: url,
                type: 'POST',
                traditional: true,
                data: {
                    valueArr: valueArr
                },
                success: function (data) {
                    console.log('3333333333');

                    // window.location.reload();
                    <%--$("#container").load("${contextPath}/course/courseList.do");--%>
                    swal("공고 삭제 성공.", "공고 삭제 성공.", "success");
                    setTimeout(function () { // 0.9초뒤 실행
                        location.reload(); // 새로고침 -> list 다시 불러옴
                    }, 900);
                },
                error: function (data) {
                    console.log("fail");
                }
            });

        }
    </script>
</head>
<body>
<div class="container">
    <div class="lnb">
        <ul>
            <li><a href="${contextPath}/main.do">홈</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a href="${contextPath}/partner/partnerList.do">협력사 관리</a></li>
            <li style="color: grey; font-weight: bold;">〉</li>
            <li class="on"><a href="${contextPath}/partner/jobOpeningList.do">채용공고 관리</a></li>
        </ul>
    </div>

    <table class="table_partnerList" id="myTable">
        <thead>
        <tr>
            <%--            <th><input type="checkbox"/></th>--%>
            <%--        <th width="100"><b>상태</b></th>--%>
            <th width="40"></th>
            <th width="200"><b>기업명</b></th>
            <th><b>마감일</b></th>
            <th><b>지원자 수</b></th>

        </tr>
        </thead>

        <tbody>
        <c:forEach var="partner" items="${jobOpeningList}">
            <tr>
                <td><input type="checkbox" name="cb" value="${partner.partnerLicenseNum}"/></td>
                <td>${partner.partnerName}</td>
                <td>${partner.partnerApplyFinishDate}</td>
                <td>${partner.applicationVO.applicantNum}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="buttonGroups">
        <button type="button" class="btn" onclick="deleteJobOpening()">삭제</button>
    </div>

</div>

</body>
</html>
