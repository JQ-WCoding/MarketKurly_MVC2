var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(document).ready(function () {
    $("#searchItemIcon").click(function () {
        var query = {
            item: $("#searchItem").val()
        };
        $.ajax({
            type: "POST",
            url: contextPath + "/searchItemPro.do",
            data: query,
            success: function (data) {

                var str = '<p id="check">';
                // location
                var loc = data.indexOf(str);
                var len = str.length;

                var check = data.substr(loc + len, 2);

                alert(check)

                if (check === "0") {
                    alert("검색어를 확인해주세요.");
                    $("#searchItem").val("");
                } else {
                    location.href = contextPath + "/showOneItem.do?item_num=" + check;
                }
            }
        })
    })
});