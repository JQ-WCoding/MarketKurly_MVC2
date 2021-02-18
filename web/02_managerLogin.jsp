<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="02_managerLogin.js"></script>

<style>
    ul li {
        list-style: none;
    }
</style>

<c:if test="${empty sessionScope.id}">
    <ul>
        <li>
            아이디 <input type="email" id="id" name="id" placeholder="ID 입력창">
            비밀번호 <input type="password" id="pw" name="pw" placeholder="6~16자 숫자/문자">
            <button id="login">로그인</button>
        </li>
    </ul>
</c:if>

<c:if test="${!empty sessionScope.id}">
    <ul>
        <li>관리자님 접속 중
            <button id="logout">로그아웃</button>
        </li>
    </ul>
</c:if>
