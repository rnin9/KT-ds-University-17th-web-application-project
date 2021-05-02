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
    <title>채용공고 등록</title>

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>
          
          <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
          
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

    <link id="bsdp-css"
          href="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker3.min.css"
          rel="stylesheet">
    <script
            src="https://unpkg.com/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <style>
        button {
            float: right;
            margin-right: 10px;
        }

        .container {
        	font-family: 'Noto Sans KR', sans-serif;
            display: flex;
            flex-wrap: wrap;
            width: 80%;
            justify-content: space-around;
            flex-direction: column;
            padding-bottom: 200px;
            margin-left: 15%;
        }

        .well-searchbox label {
            color: #555;
            width: 20%;
            margin: 10px;
            text-align: right;
        }

        .table_partnerList thead > tr > th {
            border-top: 1px solid #e4e4e4;
            border-bottom: 1px solid #e4e4e4;
            background-color: #f8f8f8;
        }


        #datepicker {
            width: 207px;
            padding: 10px 20px;
            display: inline-block;
            border: 1px solid #c8c8c0;
            box-sizing: border-box;
            margin-left: 8px;
            margin-right: 10px;
            line-height: 15px;
            border-radius: 3px;
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
        let date;
        let formatted;
        const url = "${contextPath}/partner/postJobOpening.do";
        let valueArr;

        $(document).ready(() => {

            <!--date picker-->
            $("#datepicker").datepicker({
                viewMode: 'years',
                format: "yyyymmdd",
                language: "ko",
                startView: 1,
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });

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


            // Execute when modal is closed
            $('#myModal').on('hide.bs.modal', function (e) {

                date = $("#datepicker").data("datepicker").getDate();
                // window['postJobOpening2']();

            });

        });

        // Post job opening fnuction
        postJobOpening = () => {
            const cnt = $("input[name='cb']:checked").length;
            if (cnt === 0) {
                swal("선택된 항목이 없습니다.", "공고를 선택하세요.", "warning");
                return;
            } else {
                $("#modalLink").attr("href", "#myModal");
            }
        }

        postJobOpening2 = () => {
            if (date == null || date.length < 6) {
                swal("올바른 날짜를 선택하세요.", "", "info");
                return;
            } else {
                formatted = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                valueArr = [];
                valueArr.push(formatted);
                $("input[name='cb']:checked").each(function (i) {
                    valueArr.push($(this).val());
                });
                Swal.fire({
                    title: '선택한 날짜로 등록 합니다.',
                    text: formatted,
                    icon: 'info',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '등록',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: url,
                            type: 'POST',
                            traditional: true,
                            data: {
                                valueArr: valueArr
                            },
                            success: (data) => {

                                console.log(formatted);

                                Swal.fire("공고 등록 성공.", "공고가 등록되었습니다.", "success");
                                setTimeout(() => { // execute after 0.9sec
                                    location.reload();
                                }, 900);
                            },
                            error: (data) => {
                                console.log("fail");
                            }
                        });
                    }
                })
                formatted = '';
            }
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
</head>
<body>
<div class="container">

    <!-- Modal for date picker -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-dialog-scrollable">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal_title">공고 마감 날짜 선택</h5>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <div class="partnerInfoModalBody" style="text-align: left">
                        <label class="title" id="c1">공고 마감 날짜</label> <input type="text"
                                                                             name="birth" class="birth" id="datepicker">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="postJobOpening2();">확인
                    </button>
                </div>
            </div>

        </div>
    </div>

    <div class="pageIntro">채용공고 등록</div>

    <table class="table_" id="myTable" style="border-bottom: 1px solid #96988f;" rules="groups">
        <thead>
        <tr align="center">
            <td><input type="checkbox" name="check-all"
                       onclick='selectAll(this)'/></td>
            <td><b>기업명</b></td>
            <td><b>이메일</b></td>
            <td><b>전화번호</b></td>
            <td><b>사업자등록번호</b></td>
        </tr>
        </thead>

        <tbody id="ajaxTable">
        <c:forEach var="partner" items="${partnerApplyNList}">
            <tr>
                <td><input type="checkbox" name="cb" value="${partner.partnerLicenseNum}"
                           onclick='checkSelectAll(this)'/></td>
                <td><a title="기업정보 보기" style="text-decoration: underline" class="info"
                       onClick="location.href='${contextPath}/partner/detailInfoPartner.do?partnerLicenseNum=${partner.partnerLicenseNum}'">${partner.partnerName}</a>
                </td>
                <td>${partner.partnerEmail}</td>
                <td>${partner.partnerPhoneNumber}</td>
                <td>${partner.partnerLicenseNum}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin-top: 40px; padding-bottom: 150px;">
        <button type="button" class="btn btn-outline-danger" id="modalLink" data-toggle="modal" href="#" onclick="postJobOpening()">
            공고 등록
        </button>
    </div>

</div>
</body>
</html>
