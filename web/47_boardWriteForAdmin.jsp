<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/17
  Time: 4:36 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form method="post" action="${contextPath}/boardWriteForAdmin.do?num=${requestScope.num}">
    <table border="1" style="border-collapse:collapse;">
        <tr height="50">
            <c:set var="writer" value="${sessionScope.id}"/>
            <th width="200" align="center">작성자</th>
            <td width="400">
                <input type="text" value="${writer}" readonly>
            </td>
        </tr>
        <tr height="50">
            <c:set var="title" value="${requestScope.title}"/>
            <th width="200" align="center">제목</th>
            <td width="400">
                <input type="text" value="re: ${title}" readonly name="title">
            </td>
        </tr>
        <tr height="150">
            <th width="200" align="center">글내용</th>
            <td width="400">
                <textarea cols="50" rows="10" name="content"></textarea>
            </td>
        </tr>
        <tr height="50">
            <th width="200" align="center">패스워드</th>
            <td width="400">
                <input type="password" name="pw">
            </td>
        </tr>
    </table>
    <br>
    <input type="hidden" name="writer" value="${writer}">

    <input type="submit" value="글쓰기">&nbsp;
    <input type="reset" value="다시쓰기">
</form>
