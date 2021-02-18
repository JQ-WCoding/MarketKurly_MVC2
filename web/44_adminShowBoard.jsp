<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/16
  Time: 5:03 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>고객센터</h2>
<hr size="1" color="purple" width="300">
<br>
<table border="1" style="border-collapse: collapse;">
    <tr height="30">
        <th width="50" align="center">번호</th>
        <th width="400" align="center">제목</th>
        <th width="200" align="center">작성자</th>
        <th width="200" align="center">작성일</th>
        <th width="50" align="center">조회수</th>
    </tr>

    <c:set var="number" value="${number}"/>
    <c:forEach var="board" items="${boardList}">
        <tr height="30">
            <td width="50" align="center">${number}</td>
                <%--            number-- --%>
            <c:set var="number" value="${number - 1}"/>
            <td width="400" align="left">
                <c:if test="${board.re_step > 1}">
                    <%--                    0 ~ re_step이 끝부붙까지 반복--%>
                    <c:forEach var="j" begin="0" end="${board.re_step}">
                        &nbsp;
                    </c:forEach>
                </c:if>
                    <%--                본문으로 이동 --%>
                <a href="${contextPath}/adminShowBoardContent.do?num=${board.num}"
                   style="text-decoration: none">
                        ${board.title}
                </a>
            </td>
            <td width="200" align="center">${board.writer}</td>
            <td width="200" align="center">${board.reg_date}</td>
            <td width="50" align="center">${board.readcount}</td>
        </tr>
    </c:forEach>
</table>

<%-- 페이징 처리 --%>
<p>
    <c:if test="${count > 0}">
        <c:if test="${startPage > clickablePageSize}">
            <a href="${contextPath}/adminShowBoard.do?curPageNum=${startPage - clickablePageSize}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="${contextPath}/adminShowBoard.do?curPageNum=${i}">[${i}]</a>
        </c:forEach>
        <c:if test="${endPage < pageCount}">
            <a href="${contextPath}/adminShowBoard.do?curPageNum=${startPage + clickablePageSize}">[다음]</a>
        </c:if>
    </c:if>
</p>


