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
    <title>채용공고 관리</title>

    <style>
        .container {
            font-family: 'Noto Sans KR', sans-serif;
            width: 80%;
            margin-left: 10%;
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
            text-align: center;
            color: #555;
            width: 100%;
            margin: auto;
            line-height: 40px;
        }

        .table_partnerList thead > tr > th {
            border-top: 1px solid #e4e4e4;
            border-bottom: 1px solid #e4e4e4;
            background-color: #f8f8f8;
            text-align: center;
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
            text-align: center;
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

        deleteJobOpening = () => {
            console.log('111111111');
            const cnt = $("input[name='cb']:checked").length;
            // $('#myModal').modal('show');
            if (cnt === 0) {
                swal("선택한거없음..", "선택한거없음.", "warning");
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

    <div class="rightButtonGroup">
        <div class="serarchSubject">
            <input type="text" class="form-control" placeholder="기업명">
            <button type="submit" class="btn btn-success">검색</button>
        </div>
        <br>
        <br>

        <%--        <div class="buttonGroups">--%>
        <%--            <button type="button" class="btn" onClick="location.href='${contextPath}/partner/partnerForm.do'">등록--%>
        <%--            </button>--%>
        <%--            <button type="button" class="btn">삭제</button>--%>
        <%--        </div>--%>
    </div>


    <div class="bottom">
        <div class="bottom-left">
            <select id="cntSelectBox" name="cntSelectBox"
                    onchange="changeSelectBox(${pagination.currentPage},${pagination.cntPerPage},${pagination.pageSize});"
                    class="form-control" style="width: 100px;">
                <option value="10"
                        <c:if test="${pagination.cntPerPage == '10'}">selected</c:if>>10개씩
                </option>
                <option value="20"
                        <c:if test="${pagination.cntPerPage == '20'}">selected</c:if>>20개씩
                </option>
                <option value="30"
                        <c:if test="${pagination.cntPerPage == '30'}">selected</c:if>>30개씩
                </option>
            </select>
        </div>
    </div>
    <table class="table_partnerList">
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
            <tr align="center">
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
    <!--paginate -->
    <div class="paginate">
        <div class="paging">
            <a class="direction prev" href="javascript:void(0);"
               onclick="movePage(1,${pagination.cntPerPage},${pagination.pageSize});">
                &lt;&lt; </a> <a class="direction prev"
                                 href="javascript:void(0);"
                                 onclick="movePage(${pagination.currentPage}<c:if
                                         test="${pagination.hasPreviousPage == true}">-1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
            &lt; </a>

            <c:forEach begin="${pagination.firstPage}"
                       end="${pagination.lastPage}" var="idx">
                <a
                        style="color:
                            <c:out value="${pagination.currentPage == idx ? '#cc0000; font-weight:700; margin-bottom: 2px;' : ''}"/> "
                        href="javascript:void(0);"
                        onclick="movePage(${idx},${pagination.cntPerPage},${pagination.pageSize});"><c:out
                        value="${idx}"/></a>
            </c:forEach>
            <a class="direction next" href="javascript:void(0);"
               onclick="movePage(${pagination.currentPage}<c:if
                       test="${pagination.hasNextPage == true}">+1</c:if>,${pagination.cntPerPage},${pagination.pageSize});">
                &gt; </a> <a class="direction next" href="javascript:void(0);"
                             onclick="movePage(${pagination.totalRecordCount},${pagination.cntPerPage},${pagination.pageSize});">
            &gt;&gt; </a>
        </div>
    </div>
    <!-- /paginate -->
</div>
</div>
</div>
<script>
    //10,20,30개씩 selectBox 클릭 이벤트
    function changeSelectBox(currentPage, cntPerPage, pageSize) {
        var selectValue = $("#cntSelectBox").children("option:selected").val();
        movePage(currentPage, selectValue, pageSize);

    }

    //페이지 이동
    function movePage(currentPage, cntPerPage, pageSize) {
        var url = "${pageContext.request.contextPath}/partner/jobOpeningPost.do";
        url = url + "?currentPage=" + currentPage;
        url = url + "&cntPerPage=" + cntPerPage;
        url = url + "&pageSize=" + pageSize;

        location.href = url;
    }

</script>
</div>
</body>
</html>
