<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>

    <meta charset=UTF-8">
    <title>회원 관리</title>

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

    <style>
        a:link, a:visited, a:hover {
            color: black;
            text-decoration: none;
        }

        .container {
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

        .dataTables_wrapper {
            margin-top: 30px;
            display: inline-block;
            width: 100%;
        }

        .dropdown-toggle {
            background-color: white;
            border: none;
            color: #1a0e0e;
            float: inherit;
        }
    </style>

</head>


<script type="text/javascript">
    function checkSelectAll(checkbox) {
        const selectall
            = document.querySelector('input[name="check-all"]');
        if (checkbox.checked == false) {
            selectall.checked = false;
        }

    }

    function selectAll(selectAll) {
        const checkboxes
            = document.getElementsByName('ab');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
    }
</script>
<script type="text/javascript">
    function filter() {

        var value = document.getElementById("value").value.toUpperCase();
        var item = document.getElementsByClassName("item");

        for (var i = 0; i < item.length; i++) {
            var name = item[i].getElementsByClassName("name");
            if (name[0].innerText.toUpperCase().indexOf(value) > -1) {
                item[i].style.display = "table-row";
            } else {
                item[i].style.display = "none";
            }
        }
    }
</script>
<script type="text/javascript">
    function enter() {
        // 엔터키의 코드는 13입니다.
        if (event.keyCode == 13) {
            filter()  // 실행할 이벤트
        }
    }
</script>
<script>
    function deleteCheck() {

        /*if (




        ${isLogOn == true}){*/
        var url = "/springEx/syllabus/deleteCheck.do";
        var cnt = $("input[name='ab']:checked").length;
        var valueArr = new Array();
        $("input[name='ab']:checked").each(function (i) {
            valueArr.push($(this).val());
        });
        if (cnt == 0) {
            Swal.fire("선택된 강의계획서가 없습니다.", "", "warning");
        } else {
            $.ajax({
                url: url,
                type: 'POST',
                traditional: true,
                data: {
                    valueArr: valueArr
                },
                success: function (data) {
                    console.log("success");
                    window.location.reload();
                    /*$("#container").load("




                    ${contextPath}/syllabus/syllabusList.do");*/
                },
                error: function (data) {
                    Swal.fire("선택한 강의계획서를 사용하는 강의가 있습니다.", "", "error");
                    console.log("fail");
                }
            })
        }
        /*}
        else{
            alert("로그인 후 시도해주세요.");
        }*/
    };
</script>
<script>
    function register() {
        location.href = '${contextPath}/syllabus/syllabusForm.do'
        /*if (




        ${isLogOn == true}){
			location.href='




        ${contextPath}/syllabus/syllabusForm.do'
		}
		else{
			alert("로그인 후 시도해주세요.");
		}*/
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#table_id').DataTable({
            dom: 'lBfrtip',
            buttons: ['excel'],

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
</script>
<script>
    // Reset password function
    resetPW = (userID) => {
        const url = "${contextPath}/manageUser/resetPW.do";

        Swal.fire({
            title: userID + '의 비밀번호를 초기화 하시겠습니까?',
            text: "'000000'으로 초기화 됩니다.",
            icon: 'info',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.value) {

                fetch(url, {
                    method: "POST",
                    mode: "cors",
                    headers: {
                        "Content-Type": "application/json",
                        "accept": "application/json"
                    },
                    body: JSON.stringify({
                        // partnerID: partnerID,
                        userID: userID
                    })
                })
                    .then(res => {
                        if (res.status == '500') {
                            // console.log("failㅣㅣㅣㅣㅣ");
                        } else {
                            Swal.fire("비밀번호 초기화 완료.", "", "success");
                            setTimeout(() => { // after 0.9 sec
                                location.reload();
                            }, 900);
                        }
                    })
            }
        })
    }

    // Modify position function
    positionModify = (curP, userID, newP) => {
        const url = "${contextPath}/manageUser/positionModify.do";

        Swal.fire({
            title: userID + '의 포지션을 변경 하시겠습니까?',
            text: curP + " -> " + newP,
            icon: 'info',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.value) {

                fetch(url, {
                    method: "POST",
                    mode: "cors",
                    headers: {
                        "Content-Type": "application/json",
                        "accept": "application/json"
                    },
                    body: JSON.stringify({
                        newPosition: newP,
                        userID: userID
                    })
                })
                    .then(res => {
                        if (res.status == '500') {
                            // console.log("failㅣㅣㅣㅣㅣ");
                        } else {
                            Swal.fire("포지션 변경 완료.", "", "success");
                            setTimeout(() => { // after 0.9 sec
                                location.reload();
                            }, 900);
                        }
                    })
            }
        })
    }
</script>
<body>
<div class="container">
    <div class="pageIntro">회원 관리</div>
    <table class="table_" id="table_id">
        <thead>
        <tr align="center">
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
        <c:forEach var="user" items="${userList}">
            <c:if test="${user.userPosition != 'ADMIN' && user.userPosition != 'PARTNER'}">
                <tr class="item">
                    <td>${user.userId}</td>
                    <td><a title="비밀번호 초기화" style="text-decoration: underline" href="#"
                           onclick="resetPW('${user.userId}');return false;">******</a></td>
                    <td>${user.userName}</td>
                    <td>${user.userMajor}</td>
                    <c:set var="position" value="${user.userPosition}"/>
                    <c:if test="${position == '채용예정자'}">
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                                        data-toggle="dropdown" aria-expanded="false">
                                        ${position}
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="#"
                                           onclick="positionModify('${position}', '${user.userId}', '일반회원')">일반회원</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#"
                                           onclick="positionModify('${position}', '${user.userId}', '재직자')">재직자</a></li>
                                </ul>
                            </div>
                        </td>

                    </c:if>
                    <c:if test="${position == '일반회원'}">
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2"
                                        data-toggle="dropdown" aria-expanded="false">
                                        ${position}
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                    <li><a class="dropdown-item" href="#"
                                           onclick="positionModify('${position}', '${user.userId}', '재직자')">재직자</a></li>
                                    <li><a class="dropdown-item" href="#"
                                           onclick="positionModify('${position}', '${user.userId}', '채용예정자')">채용예정자</a>
                                    </li>
                                </ul>
                            </div>
                        </td>

                    </c:if>
                    <c:if test="${position == '재직자'}">
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3"
                                        data-toggle="dropdown" aria-expanded="false">
                                        ${position}
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton3">
                                    <li><a class="dropdown-item" href="#"
                                           onclick="positionModify('${position}', '${user.userId}', '일반회원')">일반회원</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#"
                                           onclick="positionModify('${position}', '${user.userId}', '채용예정자')">채용예정자</a>
                                    </li>
                                </ul>
                            </div>
                        </td>

                    </c:if>
                    <td class="name">${user.userGender}</td>
                    <td>${user.userPhoneNumber}</td>
                    <td>${user.birth}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>