<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/16
  Time: 5:07 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminShowBoardContent</title>
</head>
<body>
<table border="1" style="border-collapse:collapse;">
    <tr height="40">
        <td align="center" width="120"> 글번호</td>
        <td align="center" width="180">${board.num}</td>
        <td align="center" width="120"> 조회수</td>
        <td align="center" width="180">${board.readcount}</td>
    </tr>
    <tr height="40">
        <td align="center" width="120"> 작성자</td>
        <td align="center" width="180"> ${board.writer}</td>
        <td align="center" width="120"> 작성일</td>
        <td align="center" width="180"> ${board.reg_date}</td>
    </tr>
    <tr height="40">
        <td align="center" width="120"> 제목</td>
        <td align="center" colspan="3"> ${board.title}</td>
    </tr>
    <tr height="80">
        <td align="center" width="120"> 글 내용</td>
        <td align="center" colspan="3"> ${board.content}</td>
    </tr>
<%--    답글은 관리자만 작성 가능 / 삭제하기 --%>
    <tr height="40">
        <td align="center" colspan="4">
<%--            관리자만 사용 가능 --%>
                <input type="button" value="답장하기"
                       onclick="location.href='${contextPath}/adminBoardReply.do?num=${board.num}'">
<%--            관리자와 사용자의 부분이 동일함 --%>
                <input type="button" value="삭제하기"
                       onclick="location.href='${contextPath}/boardDeleteForAdmin.do?num=${board.num}'">
            <input type="button" value="목록보기" onclick="location.href='${contextPath}/showBoardListForCustomer.do'">
        </td>
    </tr>
</table>
</body>
</html>
