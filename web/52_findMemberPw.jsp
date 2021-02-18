<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/18
  Time: 6:10 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 찾기</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<form method="post" action="${sessionScope.contextPath}/findMemberPwPro.do" accept-charset="UTF-8">
    <table>
        <tr class="tr1">
            <td class="td1">
                <h2>비밀번호 찾기</h2>
            </td>
        </tr>
        <tr class="tr2">
            <td class="td2">
                <font size="1"><b>이름</b></font>
            </td>
        </tr>
        <tr class="tr3">
            <td class="td1">
                <input type="text" name="name" class="input">
            </td>
        </tr>
        <tr class="tr2">
            <td class="td2">
                <font size="1"><b>아이디</b></font>
            </td>
        </tr>
        <tr class="tr3">
            <td class="td1">
                <input type="text" name="id" class="input">
            </td>
        </tr>
        <tr class="tr2">
            <td width="300">
                <font size="1"><b>이메일</b></font>
            </td>
        </tr>
        <tr class="tr3">
            <td class="td1">
                <input type="email" name="email" class="input">
            </td>
        </tr>
        <tr class="tr2">
            <td class="td2">
                <font size="1"><b> </b></font>
            </td>
        </tr>
        <tr class="tr3">
            <td class="td2">
                <input type="image" src="img/find.PNG" name="submit" value="submit" style="width:310px;">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
