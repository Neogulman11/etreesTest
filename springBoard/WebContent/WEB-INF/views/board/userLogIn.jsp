<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LogIn</title>
</head>
<body>	
<table align="center">
	<form name="loginForm" >
		<tr>
			<td>
				<table id="boardTable" border = "1">
					<tr >
						<td width="100" align="center">
						id
						</td>
						<td width="200">
							<input name="userId" id="userId" type="text" size="20"> 			
						</td>
					</tr>
					<tr>
						<td width="100" align="center">
							pw
						</td>
						<td width="200">
							<input name="userPw" id="userPw" type="password" size="20"> 
						</td>
					</tr>
				</table>
				<div align="right">
					<a id="loginButton"  onclick="login()">login</a>
				</div>
			</td>
		</tr>
	</form>
</table>
</body>
<script>

	function login() {
	    var userId = document.getElementById('userId').value;
	    var userPw = document.getElementById('userPw').value;
	
	   
	    $j.ajax({
	        type: 'POST',
	        url: '/board/userLogIn.do',
	        data: {
	            userId: userId,
	            userPw: userPw
	        },
	        success: function(response) {
	            if (response === "loginPwerr") {
	                alert("비밀번호가 틀렸습니다.");
	            } else if (response === "loginIderr") {
	                alert("아이디가 틀렸습니다.");
	            } else {
	                window.location.href = "/board/boardList.do";
	            }
	        },
	        error: function() {
	            alert("서버 오류가 발생했습니다.");
	        }
	    });
	}
</script>
</html>