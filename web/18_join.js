/**
 * 18_join.js
 */
var contextPath = window.location.pathname.substring(0,
    window.location.pathname.indexOf("/", 2));
var status = true;
var checkId = false;
var checkEmail = false;

$(document).ready(function () {
    $("#checkDoubleId").click(function () {
        if ($("#id").val()) {
            $.ajax({
                type: "POST",
                url: contextPath + "/checkDoubleId.do",
                data: {
                    id: $("#id").val()
                },

                success: function (data) {
                    var str = '<p id="check">';
                    var loc = data.indexOf(str);
                    var len = str.length;
                    var check = data.substr(loc + len, 1);

                    if (check === "1") {
                        alert("중복된 아이디입니다.");
                        $("#id").val("");
                        $("#id").focus();
                        status = false;
                    } else {
                        alert("사용할 수 있는 아이디입니다.");
                        $("#pw").focus();
                        checkId = true;
                    }
                }
            });
        } else {
            alert("사용할 아이디를 입력하세요.");
            $("#id").focus();
        }
    });

    $("#checkDoubleEmail").click(function () {
        if ($("#email").val()) {
            $.ajax({
                type: "POST",
                url: contextPath + "/checkDoubleEmail.do",
                data: {
                    email: $("#email").val()
                },

                success: function (data) {
                    var str = '<p id="check">';
                    var loc = data.indexOf(str);
                    var len = str.length;
                    var check = data.substr(loc + len, 1);

                    if (check == "1") {
                        alert("중복된 이메일입니다");
                        $("#email").val("");
                        $("#email").focus();
                        status = false;
                    } else {
                        alert("사용할 수 있는 이메일입니다.");
                        checkEmail = true;
                    }
                }
            });
        } else {
            alert("사용할 이메일을 입력하세요.");
            $("#email").focus();
        }

    });

    $("#join").click(function () {
        checkInfo();

        if (status && checkEmail && checkId) {
            $.ajax({
                type: "post",
                url: contextPath + "/joinPro.do",
                data: {
                    id: $("#id").val(),
                    pw: $("#pw").val(),
                    name: $("#name").val(),
                    tel: $("#tel").val(),
                    postcode: $("#postcode").val(),
                    address: $("#address").val(),
                    email: $("#email").val()
                },

                success: function (data) {
                    alert("회원가입이 완료되었습니다.");
                    window.location.href = contextPath + "/index.do";
                },

                error: function (data) {
                    alert("error");
                }
            });

        }

    });

});

function checkInfo() {
    status = true;

    if (!$("#id").val()) {
        alert("아이디를 입력하세요.");
        $("#id").focus();
        status = false;
        return false;
    }

    if (!$("#pw").val()) {
        alert("비밀번호를 입력하세요.");
        $("#passwd").focus();
        status = false;
        return false;
    }

    if (!$("#name").val()) {
        alert("사용자 이름을 입력하세요.");
        $("#name").focus();
        status = false;
        return false;
    }

    if (!$("#tel").val()) {
        alert("전화번호를 입력하세요.");
        $("#tel").focus();
        status = false;
        return false;
    }

    if (!$("#address").val()) {
        alert("주소를 입력하세요.");
        $("#address").focus();
        status = false;
        return false;
    }

    if (!$("#email").val()) {
        alert("이메일을 입력하세요.");
        $("#email").focus();
        status = false;
        return false;
    }

    if (!$("#postcode").val()) {
        alert("우편번호를 입력하세요.");
        $("#postcode").focus();
        status = false;
        return false;
    }
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            // var extraRoadAddr = ''; // 참고 항목 변수
            //
            // // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            // if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            //     extraRoadAddr += data.bname;
            // }
            // // 건물명이 있고, 공동주택일 경우 추가한다.
            // if (data.buildingName !== '' && data.apartment === 'Y') {
            //     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            // }
            // // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            // if (extraRoadAddr !== '') {
            //     extraRoadAddr = ' (' + extraRoadAddr + ')';
            // }
            //
            // // 우편번호와 주소 정보를 해당 필드에 넣는다.
            // document.getElementById('sample4_postcode').value = data.zonecode;
            // document.getElementById("sample4_roadAddress").value = roadAddr;
            //
            // var guideTextBox = document.getElementById("guide");
            // // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            // if (data.autoRoadAddress) {
            //     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
            //     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
            //     guideTextBox.style.display = 'block';
            //
            // } else if (data.autoJibunAddress) {
            //     var expJibunAddr = data.autoJibunAddress;
            //     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
            //     guideTextBox.style.display = 'block';
            // } else {
            //     guideTextBox.innerHTML = '';
            //     guideTextBox.style.display = 'none';
            // }
            $("#address").val(roadAddr);
            $("#postcode").val(data.zonecode);
            console.log(data);
        }
    }).open();
}