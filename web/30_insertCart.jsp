<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<c:choose>
    <c:when test="${sessionScope.id ne null}">
        <script>
            location.href = "${contextPath}/cartInfo.do";
        </script>
    </c:when>

    <c:otherwise>
        <script>
            alert("로그인 후 이용가능합니다");
            location.href = "${contextPath}/login.do";
        </script>
    </c:otherwise>
</c:choose>


