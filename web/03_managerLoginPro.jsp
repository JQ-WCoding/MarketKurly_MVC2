<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${requestScope.check == 1}">
<%--    session.setAttribut 형태 --%>
    <c:set var="id" value="${requestScope.id}" scope="session"/>
</c:if>

<p id="check">${requestScope.check}
