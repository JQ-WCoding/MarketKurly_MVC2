var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(document).ready(function() {
    $("#signIn").click(function () {
        $("#contents").load("18_join.jsp");
    });
});