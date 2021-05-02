<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
            crossorigin="anonymous">

    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.css"/>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script type="text/javascript"
            src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/b-print-1.7.0/datatables.min.js"></script>

    <title>탈퇴 회원 관리</title>

    <style>
        a:link, a:visited, a:hover {
            color: black;
            text-decoration: none;
        }

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

        button {
            float: right;
            margin-right: 10px;
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

    <script type="text/javascript">
        $(document).ready(() => {
            $('#table_id').DataTable({
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
        let valueArr;
        const url = "${contextPath}/manageUser/deleteUser.do";

        deleteUser = () => {
            const cnt = $("input[name='cb']:checked").length;
            if (cnt === 0) {
                swal("선택된 항목이 없습니다.", "삭제할 회원을 선택하세요.", "warning");
                return;
            } else {
                Swal.fire({
                    title: '회원을 삭제하시겠습니까?',
                    text: '',
                    icon: 'info',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '삭제',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.value) {
                        valueArr = [];
                        console.log('11111111111111');
                        $("input[name='cb']:checked").each(function (i) {
                            console.log('2222222');
                            console.log($(this).val());
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
                                Swal.fire("회원 정보 삭제 완료.", "", "success");
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
    </script>
    <script>

    </script>
</head>
<body>
<div class="container">
    <div class="pageIntro">탈퇴 회원 관리</div>

    <table class="table_" id="table_id" style="border-bottom: 1px solid #96988f;">
        <thead>
        <tr align="center">
            <td><input type="checkbox" name="check-all"
                       onclick='selectAll(this)'/></td>
            <td><b>아이디</b></td>
            <td><b>비밀번호</b></td>
            <td><b>이름</b></td>
            <td><b>직무</b></td>
            <td><b>포지션</b></td>
            <td><b>성별</b></td>
            <td><b>전화번호</b></td>
            <td><b>생년월일</b></td>
        </tr>
        </thead>

        <tbody id="ajaxTable">
        <c:forEach var="user" items="${userWithdrawalList}">
            <c:if test="${user.userPosition != 'ADMIN' && user.userPosition != 'PARTNER'}">
                <tr class="item">
                    <td><input type="checkbox" name="cb" value="${user.userId}"
                               onclick='checkSelectAll(this)'/></td>
                    <td>${user.userId}</td>
                    <td>******</td>
                    <td>${user.userName}</td>
                    <td>${user.userMajor}</td>
                    <td>${user.userPosition}</td>
                    <td class="name">${user.userGender}</td>
                    <td>${user.userPhoneNumber}</td>
                    <td>${user.birth}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin-top: 40px; padding-bottom: 150px;">
        <button type="button" class="btn btn-outline-danger" onclick="deleteUser()">삭제</button>
    </div>

</div>

</body>
</html>
