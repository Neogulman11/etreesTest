<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SignUp</title>
</head>
<body>
<table align="center">
	<tr>
		<td align="left">
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
	<tr>
		<td>
			<form action="/board/MemberSignUp.do" method="post">
				<table border ="1"  width="440">
					<tr >
						<td width="80" align="center">
						id
						</td>
						<td width="400">
							<input name="userId" id="userId" type="text" size="20"> 
							<input type="button" value="중복확인" onclick="idCheck()">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						pw
						</td>
						<td width="400">
							<input name="userPw" type="password" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						pw check
						</td>
						<td width="400">
							<input name="userPwCheck" type="password" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						name
						</td>
						<td width="500">
							<input name="userName" type="text" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						phone
						</td>
						<td width="400">
							<select name="userPhone1">
					            <option value="1">010</option>
					            <option value="2">011</option>
					            <option value="3">016</option>
					            <option value="4">017</option>
					            <option value="5">019</option>
					        </select>
							- <input name="userPhone2" type="text" size="5"> - <input name="userPhone3" type="text" size="5">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						postNo
						</td>
						<td width="400">
							<input name="userAddr1" type="text" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						address
						</td>
						<td width="400">
							<input name="userAddr2" type="text" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						company
						</td>
						<td width="400">
							<input name="userCompany" type="text" size="25"> 
						</td>
					</tr>	
				</table>
				<input align="right" type="submit" value="회원가입">
			</form>
		</td>
	</tr>
	
</table>
</body>
<script>

	const idCheck = () => {
		const id = document.getElementById("userId").value;
		
        $j.ajax({
            type: "post",
            url: "/board/userInfo/id-check.do",
            data: {
                "userId": id
            },
            success: function(res) {
                console.log("요청성공", res);
                if (res == "ok") {
                	console.log(id);
                	alert("사용 가능한 ID입니다.");
                } else {
                    alert("이미 사용 중인 ID입니다.");
                }
            },
            error: function(err) {
            	console.log(id);
                console.log("에러발생", err);
            }
        });
    }
</script>
</html>