<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script src="18_join.js"></script>
<%--	daum 우편번호 검색 api --%>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    .button {
        border:1px solid blueviolet;    /*---테두리 정의---*/
        background-Color:white;   /*--백그라운드 정의---*/
        font:12px 굴림;      /*--폰트 정의---*/
        font-weight:bold;   /*--폰트 굵기---*/
        color:blueviolet;    /*--폰트 색깔---*/
        width: 308px; height: 46px;
        cursor: pointer;
    }
</style>
<h1>회원가입</h1>
<hr width="700" color="black" size="3"/>
<br>
<table>
    <tr height="50">
        <th width="150">아이디</th>
        <td width="300" align="center">
            <input type="text" id="id" name="id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" style="width:300px; height:40px"
                   autofocus>
        </td>
        <td width="75">
            <button id="checkDoubleId" style="background : none; border: none; outline: none; flex: 1; cursor: pointer">
                <img src="img/checkDouble.PNG" alt="중복확인" style="width: 100px; height: 40px"></button>
        </td>
    </tr>
    <tr height="50">
        <th width="150">패스워드</th>
        <td width="300" align="left" colspan="2">
            <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" style="width:300px; height:40px">
        </td>
    </tr>
    <tr height="50">
        <th width="150">이름</th>
        <td width="300" align="left" colspan="2">
            <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" style="width:300px; height:40px">
        </td>
    </tr>
    <tr height="50">
        <th width="150">휴대폰</th>
        <td width="300" align="left" colspan="2">
            <input type="text" id="tel" name="tel" placeholder="(-)없이 입력" style="width:300px; height:40px">
        </td>
    </tr>

    <tr style="height: 50px;">
        <th width="150">우편번호</th>
        <td width="300" align="center">
            <input type="text" id="postcode" name="postcode" placeholder="우편번호를 입력해주세요"
                   style="width:300px; height:40px">
        </td>
    </tr>

    <tr height="50">
        <th width="150">주소</th>
        <td width="300" align="left" colspan="2">
            <input type="text" id="address" name="address" placeholder="주소를 입력해주세요"
                   style="width:300px; height:40px">
        </td>
    </tr>

    <tr style="height: 50px">
        <th width="150"></th>
        <td>
            <input type="button" onclick="execDaumPostcode()" value="주소 검색" id="DaumPostcode"
                   class="button"><br>
        </td>
    </tr>

    <tr height="50">
        <th width="150">이메일</th>
        <td width="300" align="center">
            <input type="email" id="email" name="email" placeholder="예:marketkurly@kurly.com"
                   style="width:300px; height:40px">
        </td>
        <td width="75">
            <button id="checkDoubleEmail"
                    style="background : none; border: none; outline: none; flex: 1; cursor: pointer"><img
                    src="img/checkDouble.PNG" alt="중복확인" style="width: 100px; height: 40px"></button>
        </td>
    </tr>
    <tr height="50">
        <td colspan="3" align="center">
            <br>
            <button id="join" style="background : none; border: none; outline: none; flex: 1; cursor: pointer"><img
                    src="img/join.PNG" alt="가입하기" style="width: 320px; height: 50px"></button>
        </td>
    </tr>
</table>
