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
			<form action="/board/MemberSignUp.do" method="post" id="signupForm">
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
							<input name="userPw" id="userPw" type="password" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						pw check
						</td>
						<td width="400">
							<input name="userPwCheck" id="userPwCheck" type="password" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						name
						</td>
						<td width="500">
							<input name="userName" id="userName" type="text" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						phone
						</td>
						<td width="400">
							<select name="userPhone1" id="userPwCheck">
								<c:forEach var="comcode" items="${comcode}">
						            <option value="${comcode.codeId}">${comcode.codeName}</option>
					            </c:forEach>
					        </select>
							- <input name="userPhone2" id="userPhone2" type="text" size="5"> 
							- <input name="userPhone3" id="userPhone3" type="text" size="5">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						postNo
						</td>
						<td width="400">
							<input name="userAddr1" id="userAddr1" type="text" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						address
						</td>
						<td width="400">
							<input name="userAddr2" id="userAddr2" type="text" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						company
						</td>
						<td width="400">
							<input name="userCompany" id="userCompany" type="text" size="25"> 
						</td>
					</tr>	
				</table>
				<div align="right">
					<a id="joinButton" onclick="if (validateForm()) { document.getElementById('signupForm').submit(); }">join</a>
				</div>
			</form>
		</td>
	</tr>
</table>
</body>
<script>
	let idChecked = false; 

	const idCheck = () => {
		const userId = document.getElementById("userId").value;

		if (userId.length === 0) {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if (userId.includes(" ")) {
			alert("ID에 공백을 포함할 수 없습니다.");
			return false;
		}

		$j.ajax({
			type: "post",
			url: "/board/userInfo/id-check.do",
			data: {
				"userId": userId
			},
			success: function(res) {
				console.log("요청성공", res);
				if (res == "ok") {
					console.log(userId);
					alert("사용 가능한 ID입니다.");
					idChecked = true; // 아이디 중복 확인 완료
					document.getElementById("userId").removeAttribute("readonly");
					document.getElementById("joinButton").disabled = false;
				} else {
					alert("이미 사용 중인 ID입니다.");
					idChecked = false; // 아이디 중복 확인 실패
				}
			},
			error: function(err) {
				console.log("에러발생", err);
			}
		});
	}

	const validateForm = () => {
		const userId = document.getElementById("userId").value;
		const userPw = document.getElementById("userPw").value;
		const userPwCheck = document.getElementById("userPwCheck").value;
		const userName = document.getElementById("userName").value;
		const userPhone2 = document.getElementById("userPhone2").value;
		const userPhone3 = document.getElementById("userPhone3").value;
		const userAddr1 = document.getElementById("userAddr1").value;
		const userAddr2 = document.getElementById("userAddr2").value;

		if (userId.length === 0) {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (userId.includes(" ")) {
			alert("ID에 공백을 포함할 수 없습니다.");
			return false;
		}

		if (!idChecked) {
			alert("아이디 중복 검사를 진행해주세요.");
			return false;
		}
		
		if (userPw.length === 0) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		if (userPw.length < 6 || userPw.length > 12) {
			alert("비밀번호는 6자리에서 12자리 사이여야 합니다.");
			return false;
		}
		
		if (userPw.includes(" ")) {
			alert("PW에 공백을 포함할 수 없습니다.");
			return false;
		}

		if (userPw !== userPwCheck) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			return false;
		}

		if (userName.length === 0) {
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if (userName.includes(" ")) {
			alert("이름에 공백을 포함할 수 없습니다.");
			return false;
		}

		if (userPhone2.length !== 4 || userPhone3.length !== 4) {
			alert("전화번호는 각각4자리로 입력되어야 합니다.");
			return false;
		}
		
		if (userPhone2.includes(" ") || userPhone3.includes(" ")) {
			alert("휴대폰 번호에 공백을 포함할 수 없습니다.");
			return false;
		}

		if (userAddr1.length !== 0 && !/\d+-\d+/.test(userAddr1)) {
			alert("주소는 xxx-xxx 형식으로 입력되어야 합니다.");
			return false;
		}
		
		if (userAddr1.includes(" ")) {
			alert("주소에 공백을 포함할 수 없습니다.");
			return false;
		}
		
		if (userAddr2.includes(" ")) {
			alert("주소에 공백을 포함할 수 없습니다.");
			return false;
		}

		return true; 
	}
</script>
</html>
