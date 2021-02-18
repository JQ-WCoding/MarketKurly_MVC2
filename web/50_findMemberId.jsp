<%--
  Created by IntelliJ IDEA.
  User: jun_q
  Date: 2021/02/18
  Time: 5:34 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="css/findMemebrId.css">

<%
    request.setCharacterEncoding("UTF-8");
%>
<form method="post" action="${sessionScope.contextPath}/findMemberIdPro.do" accept-charset="UTF-8">
    <table>
        <tr class="tr1">
            <td class="td1">
                <h2>아이디 찾기</h2>
            </td>
        </tr>
        <tr class="tr2">
            <td class="td2">
                <b class="bStyle">이름</b>
            </td>
        </tr>
        <tr class="tr3">
            <td class="td1">
                <input type="text" name="name" placeholder="고객님의 이름을 입력해주세요" class="input1" autofocus>
            </td>
        </tr>
        <tr class="tr2">
            <td class="td2">
                <b class="bStyle">이메일</b>
            </td>
        </tr>
        <tr class="tr3">
            <td class="td1">
                <input type="email" name="email"
                       placeholder="가입 시 등록하신 이메일 주소를 입력해주세요" class="input1">
            </td>
        </tr>
        <tr class="tr2">
            <td class="td2">
                <font size="1"><b> </b></font>
            </td>
        </tr>
        <tr class="tr3">
            <td class="td2">
                <input type="image" src="img/check.PNG" name="submit" value="submit" class="input2">
            </td>
        </tr>
    </table>
</form>

