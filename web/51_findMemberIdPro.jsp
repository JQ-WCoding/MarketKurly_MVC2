<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/18
  Time: 5:44 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 찾기</title>
</head>
<body>
<c:choose>
    <c:when test="${requestScope.checkId ne null}">
        <script>
            alert("회원님의 아이디는 ${requestScope.checkId}입니다.");
            location.href = "${contexpath}/index.do";
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("해당하는 회원정보가 존재하지 않습니다.");
            history.go(-1);
        </script>
    </c:otherwise>
</c:choose>
</body>
</html>
