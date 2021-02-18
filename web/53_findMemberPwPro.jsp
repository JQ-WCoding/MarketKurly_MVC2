<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/18
  Time: 6:12 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${requestScope.pw ne null}">
        <script>
            alert("회원님의 패스워드는 ${requestScope.pw}입니다.");
            location.href = "${contextPath}/index.do";
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("해당하는 회원정보가 존재하지 않습니다.");
            history.go(-1);
        </script>
    </c:otherwise>
</c:choose>

