<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        a {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: purple;
        }

        #auth {
            /* 오른쪽에서 10px 상단에서 30px 간격을 유지하는 레이아웃으로 강제고정(absolute) */
            position: absolute;
            right: 10px;
            top: 30px;
        }
    </style>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="00_index.js"></script>
</head>
<body>
<%-- Header --------------------------------------------------------------------------------------- --%>
<%-- 로고 버튼을 누르면 do 페이지로 이동(본 사이트 제대로 시작) --%>
<div align="center">
    <a href="${requestScope.contextPath}/index.do">
        <img src="${requestScope.contextPath}/img/logo.png" height="80">
    </a>
    <%-- 관리자 페이지로 접속했을 때 --%>
    <c:if test="${requestScope.type == 0}">
        <div id="auth">
            <jsp:include page="02_managerLogin.jsp"/>
        </div>
        <table>
            <tr height="50">
                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/managerMain.do"><b>관리자 메인</b></a>
                    </font>
                </td>
                <td width="10" align="center">
                    <img alt="top" src="img/top.jpg">
                </td>
                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/addNewItem.do"><b>신상품등록</b></a>
                    </font>
                </td>
                <td width="10" align="center">
                    <img alt="top" src="img/top.jpg">
                </td>
                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/itemListForManager.do"><b>상품수정/삭제</b></a>
                    </font>
                </td>
                <td width="10" align="center">
                    <img alt="top" src="img/top.jpg">
                </td>
                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/checkOrderList.do"><b>주문현황</b></a>
                    </font>
                </td>
                <td width="10" align="center">
                    <img alt="top" src="img/top.jpg">
                </td>
                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/adminShowBoardList.do"><b>Q&A</b></a>
                    </font>
                </td>
            </tr>
        </table>
    </c:if>

    <%-- 사용자 페이지로 접속했을 때 --%>
    <c:if test="${requestScope.type == 1}">
        <div id="auth">
            <jsp:include page="00_topMenu.jsp"/>
        </div>
        <table>
            <tr height="50">
                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/showAllItem.do" id="showAll"><b>전체상품 보기</b></a>
                    </font>
                </td>
                <td width="10" align="center">
                    <img alt="top" src="img/top.jpg">
                </td>

                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath }/showNewItem.do"><b>신상품</b></a>
                    </font>
                </td>
                <td width="10" align="center">
                    <img alt="top" src="img/top.jpg">
                </td>

                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/showBestItem.do"><b>베스트</b></a>
                    </font>
                </td>
                <td width="10" align="center">
                    <img alt="top" src="img/top.jpg">
                </td>
                <td width="180" align="center">
                    <font size="3" color="black">
                        <a href="${requestScope.contextPath}/showDiscountedItem.do"><b>알뜰쇼핑</b></a>
                    </font>
                </td>
                <td>
                    <input type="text" id="searchItem" placeholder="물품 찾기" required="required" style="width: 242px; height: 36px; line-height: 16px; padding: 0 60px 0 14px">
                    <button id="searchItemIcon"><img src="img/findcate.png" alt="검색버튼" style="width: 30px; height: 30px; display: block"></button>
                </td>
                <td>
                    <a href="31_cartInfo.jsp" ><img src="img/cart.png" alt="카트 이미지" style="width: 35px; display: block; height: 36px"></a>
                </td>
            </tr>
        </table>
    </c:if>

    <%-- Center (Contents) --------------------------------------------------------------------------------------- --%>
    <%--    contents 페이지 불러오기 --%>
    <div id="contents">
<%--        <jsp:include page="${requestScope.cont}"/>--%>
    </div>
    <%-- Footer --------------------------------------------------------------------------------------- --%>
    <hr color="lightgray" size="1">

    <table>
        <tr height="50">
            <td align="center" width="50">
                <img alt="bottom(1)" src="img/bottom(1).png" width="40" height="40">
            </td>
            <td width="250">
                <font size="1" color="gray">
                    [인증범위]마켓컬리 쇼핑몰 서비스 개발ㆍ운영<br>
                    [유효기간]2019.04.01~2022.03.31
                </font>
            </td>
            <td align="center" width="50">
                <img alt="bottom(3)" src="img/bottom(3).png" width="40" height="40">
            </td>
            <td width="250">
                <font size="1" color="gray">
                    개인정보보호 우수 웹사이트<br>
                    개인정보처리시스템 인증(ePRIVACY PLUS)
                </font>
            </td>
            <td align="center" width="150">
                <img alt="bottom(2)" src="img/bottom(2).png" width="150">
            </td>
            <td width="350">
                <font size="1" color="gray">
                    고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한 <br/>
                    토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
                </font>
            </td>
        </tr>
    </table>
</div>
</body>
</html>















