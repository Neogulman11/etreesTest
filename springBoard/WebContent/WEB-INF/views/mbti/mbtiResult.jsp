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
    <div align="center">
        <h2>당신의 유형은</h2>
		<p><%= resultData %></p>
        <div align="center">
			<button id="startBt" onclick="reStart()">처음으로</button>
		</div>
    </div>
</body>
<script type="text/javascript">
	function reStart()  {
		window.location.href = "/mbti/mbtiMain.do";	
	}
	
</script>
</html>