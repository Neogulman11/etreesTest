<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <div align="center" style="padding: 100px">
        <c:forEach items="${boardList}" var="board">
            <div>
                <td align="center">${board.boardComment}</td> <br>
                <a>����</a>
                <input type="radio" name="selectedRadio" value="3">
                <input type="radio" name="selectedRadio" value="2">
                <input type="radio" name="selectedRadio" value="1">
                <input type="radio" name="selectedRadio" value="0">
                <input type="radio" name="selectedRadio" value="-1">
                <input type="radio" name="selectedRadio" value="-2">
                <input type="radio" name="selectedRadio" value="-3">
                <a>����</a>
                </div>
        </c:forEach>

        <c:choose>
                <c:when test="${hasNextPage}">
                    <a href="/mbti/mbtiTest.do?page=${currentPage + 1}">[다음]</a>
                </c:when>
                <c:otherwise>
                    <a href="/mbti/mbtiResult.do">[제출하기]</a>
                </c:otherwise>
            </c:choose>
    </div>

</body>
</html>