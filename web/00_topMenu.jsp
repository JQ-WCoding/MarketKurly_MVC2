<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="contextPath" scope="request" type="java.lang.String"/>

<style>
    #status a {
        font-size: 0.8em;
        text-decoration: none;
    }
</style>

<script
        src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">
</script>

<script src="00_topMenu.js"></script>

<%-- 비로그인 상태 시 --%>
<c:if test="${empty sessionScope.id}">
    <div id="status">
            <%--        <a id="signIn" href="00_topMenu.js">회원가입</a>--%>
            <%--        두가지 방법 사용 --%>
        <button id="signIn" style="cursor: pointer; background-color: white; border: none">회원가입</button>
        <img alt="top" src="img/top.jpg"> &nbsp;

        <a href="${contextPath}/login.do">로그인</a>&nbsp;
    </div>
</c:if>

<%-- 로그인 상태 시--%>
<c:if test="${!empty sessionScope.id}">
    <div id="status">
        <a href="#"> ${sessionScope.id}님</a> &nbsp;
        <img alt="top" src="img/top.jpg"> &nbsp;
        <a href="${contextPath}/logout.do">로그아웃</a>&nbsp;
        <img alt="top" src="img/top.jpg"> &nbsp;
        <a href="${contextPath}/cartInfo.do">장바구니</a>&nbsp;
        <img alt="top" src="img/top.jpg"> &nbsp;
        <a href="${contextPath}/checkMyOrderList.do">구매내역</a>&nbsp;
        <img alt="top" src="img/top.jpg"> &nbsp;
            <%--        고객센터 -> 문의 게시판 --%>
        <a href="${contextPath}/showBoardListForCustomer.do">고객센터</a>&nbsp;
    </div>
</c:if>
