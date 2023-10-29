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
    <div>
        <h2>당신의 유형은</h2>
        <div align="center">
            <c:set var="eiValue" value="${session['EI']}" />
            <c:set var="ieValue" value="${session['IE']}" />
            <c:set var="snValue" value="${session['SN']}" />
            <c:set var="nsValue" value="${session['NS']}" />
            <c:set var="tfValue" value="${session['TF']}" />
            <c:set var="ftValue" value="${session['FT']}" />
            <c:set var="jpValue" value="${session['JP']}" />
            <c:set var="pjValue" value="${session['PJ']}" />

            <p>${eiValue > ieValue ? 'E' : 'I'}</p>
            <p>${snValue > nsValue ? 'S' : 'N'}</p>
            <p>${tfValue > ftValue ? 'T' : 'F'}</p>
            <p>${jpValue > pjValue ? 'J' : 'P'}</p>
        </div>
    </div>
</body>
</html>