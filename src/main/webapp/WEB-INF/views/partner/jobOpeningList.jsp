<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set>
<c:set var="ymd" value="<%=new java.util.Date()%>"/>
<%--<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>--%>

<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
	
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

    <title>채용공고 관리</title>

    <style>
        button {
            float: right;
            margin-right: 10px;
        }

        .container {
            margin-left: 15%;
            position: relative;
            font-family: 'Noto Sans KR', sans-serif;
            width: 80%;
        }

        .well-searchbox label {
            color: #555;
            width: 20%;
            margin: 10px;
            text-align: right;
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

        .buttonGroups {
            float: right;
        }

        .dataTables_wrapper {
            margin-top: 30px;
            display: inline-block;
            width: 100%;
        }

        table.dataTable thead th, table.dataTable thead td {
            padding: 10px 18px;
            border-bottom: 1px solid #96988f;
            background-color: #f8f8f8;
        }

        table.dataTable td {
            border-top: 1px solid lightgrey;
        }
    </style>
    <script>
        const url = "${contextPath}/partner/deleteJobOpening.do";
        let valueArr;

        $(document).ready(() => {
            $('#myTable').DataTable({

                language: {
                    info: '',
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

        // Job opening delete funcion
        deleteJobOpening = () => {
            const cnt = $("input[name='cb']:checked").length;
            if (cnt === 0) {
                swal("선택된 항목이 없습니다.", "공고를 선택하세요.", "warning");
                return;
            } else {
                Swal.fire({
                    title: '공고를 삭제하시겠습니까?',
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
                            success: (data) => {
                                Swal.fire("공고 삭제 성공.", "공고가 삭제되었습니다.", "success");
                                setTimeout(function () { // execute after 0.9sec
                                    location.reload();
                                }, 900);
                            },
                            error: (data) => {
                                console.log("fail");
                            }
                        });
                    }
                })
            }
        }

        // Set modal body text
        function getPartnerInfo(name, info, addr, email, headcnt, purl) {
            $("#modal_title").text(name);
            $("#partner_info").text(info);
            $("#partner_addr").text(addr);
            $("#partner_email").text(email);
            $("#partner_headcnt").text(headcnt);
            $("#partner_purl").text(purl);
        }
    </script>
    <script>
        // checkbox functions

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
</head>
<body>
<div class="container">

    <!-- Modal for partner info -->
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
                                <p>업종 · 업태</p>
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

    <div class="pageIntro">채용공고 관리</div>

    <table class="table_" id="myTable" style="border-bottom: 1px solid #96988f;">
        <thead>
        <tr>
            <td><input type="checkbox" name="check-all"
                       onclick='selectAll(this)'/></td>
            <td><b>기업명</b></td>
            <td><b>마감일</b></td>
            <td><b>지원자 수</b></td>
        </tr>
        </thead>

        <tbody id="ajaxTable">
        <c:forEach var="partner" items="${jobOpeningList}">
            <tr>
                <td><input type="checkbox" name="cb" value="${partner.partnerLicenseNum}"
                           onclick='checkSelectAll(this)'/></td>
                <td><a title="기업정보 보기" style="text-decoration: underline" class="info"
                       data-toggle="modal" href="#myModal"
                       onclick="getPartnerInfo('${partner.partnerName}', '${partner.partnerIndustryType}', '${partner.partnerAddress}', '${partner.partnerEmail}', '${partner.partnerHeadCount}', '${partner.partnerURL}');">${partner.partnerName}</a>
                </td>
                <c:set var="date" value="${fn:substring(partner.partnerApplyFinishDate, 0, 11)}"/>
                <c:if test="${date >= sysYear}">
                    <td>${date}</td>
                </c:if>
                <c:if test="${date < sysYear}">
                    <%--         Closed jobopenings are in red           --%>
                    <td><a style="color: #fc0038">${date}</a></td>
                </c:if>
                <td>${partner.applicationVO.applicantNum}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin-top: 40px; padding-bottom: 150px;">
        <button type="button" class="btn btn-outline-danger" onclick="deleteJobOpening()">삭제</button>
    </div>

</div>

</body>
</html>
