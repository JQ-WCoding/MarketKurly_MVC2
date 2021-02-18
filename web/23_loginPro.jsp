<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${check eq 1}">
    <%--		session에 id값 저장--%>
    <c:set var="id" value="${id}" scope="session"/>
    <script>
        location.href = '${contextPath}/index.do';
    </script>
</c:if>

<c:if test="${check ne 1}">
    <script>
        alert("아이디와 패스워드를 확인해주세요.");
        history.go(-1);
    </script>
</c:if>
