<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/18
  Time: 5:34 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>아이디 찾기</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<form method="post" action="${sessionScope.contextPath}/findMemberIdPro.do" accept-charset="UTF-8">
    <table>
        <tr>
            <td>
                <h2>아이디 찾기</h2>
            </td>
        </tr>
        <tr>
            <td>
                <font size="1"><b>이름</b></font>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="name" placeholder="고객님의 이름을 입력해주세요">
            </td>
        </tr>
        <tr>
            <td>
                <font size="1"><b>이메일</b></font>
            </td>
        </tr>
        <tr>
            <td>
                <input type="email" name="email"
                       placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
            </td>
        </tr>
        <tr>
            <td>
                <font size="1"><b> </b></font>
            </td>
        </tr>
        <tr>
            <td>
                <input type="image" src="img/check.PNG" name="submit" value="submit">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
