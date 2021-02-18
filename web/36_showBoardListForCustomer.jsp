<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/showBoardList.css">
</head>
<body>

<h2>고객센터</h2>

<hr class="hrBoard">

<br>

<table class="tableSet">
    <tr class="trBoard">
        <th class="tdNumber">번호</th>
        <th class="tdTitle">제목</th>
        <th class="tdWriter">작성자</th>
        <th class="tdRegDate">작성일</th>
        <th class="tdReadCount">조회수</th>
    </tr>
    <c:set var="number" value="${number}"/>
    <c:forEach var="board" items="${boardList}">
        <%--			본인 작성 글만 확인 가능 // 관리자 댓글도 확인 가능 --%>
            <tr class="trBoard">
                <td class="tdInNumber">${number }</td>
                <c:set var="number" value="${number - 1}"/>
                <td class="tdInTitle">
                    <c:if test="${board.re_step > 1}">
                        <c:forEach var="j" begin="0" end="${board.re_step}">
                            &nbsp;
                        </c:forEach>
                    </c:if>
                    <a href="${contextPath}/showBoardContentForCustomer.do?num=${board.num}"
                       style="text-decoration: none">
                            ${board.title}
                    </a>
                </td>
                <td class="tdInWriter">${board.writer}</td>
                <td class="tdInRegDate">${board.reg_date}</td>
                <td class="tdInReadCount">${board.readcount}</td>
            </tr>
    </c:forEach>
</table>

<table>
    <tr height="30">
        <td width="910" align="right">
            <input type="button" value="글쓰기" onclick="location.href='${contextPath}/boardWriteForCustomer.do'">
        </td>
    </tr>
</table>
<p>

    <c:if test="${count > 0}">
    <c:if test="${startPage > clickablePageSize}">
    <a href="${contextPath}/showBoardListForCustomer.do?curPageNum=${startPage - clickablePageSize}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
    <a href="${contextPath}/showBoardListForCustomer.do?curPageNum=${i}">[${i}]</a>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
    <a href="${contextPath}/showBoardListForCustomer.do?curPageNum=${startPage + clickablePageSize}">[다음]</a>
    </c:if>
    </c:if>
</body>
</html>