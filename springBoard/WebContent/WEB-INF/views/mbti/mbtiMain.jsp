<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
</head>
<body>
	<div align="center">
		<h2>성격유형검사</h2>
		<button id="startBt" onclick="testStart()">시작하기</button>
	</div>
	
</body>
<script>
	function testStart()  {
		window.location.href = "/mbti/mbtiTest.do";
		sessionStorage.clear();
	}
</script>
</html>