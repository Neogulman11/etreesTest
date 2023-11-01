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
							<input type="button" value="�ߺ�Ȯ��" onclick="idCheck()">
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
			alert("���̵� �Է����ּ���.");
			return;
		}
		
		if (userId.includes(" ")) {
			alert("ID�� ������ ������ �� �����ϴ�.");
			return false;
		}

		$j.ajax({
			type: "post",
			url: "/board/userInfo/id-check.do",
			data: {
				"userId": userId
			},
			success: function(res) {
				console.log("��û����", res);
				if (res == "ok") {
					console.log(userId);
					alert("��� ������ ID�Դϴ�.");
					idChecked = true; // ���̵� �ߺ� Ȯ�� �Ϸ�
					document.getElementById("userId").removeAttribute("readonly");
					document.getElementById("joinButton").disabled = false;
				} else {
					alert("�̹� ��� ���� ID�Դϴ�.");
					idChecked = false; // ���̵� �ߺ� Ȯ�� ����
				}
			},
			error: function(err) {
				console.log("�����߻�", err);
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
			alert("���̵� �Է����ּ���.");
			return false;
		}
		if (userId.includes(" ")) {
			alert("ID�� ������ ������ �� �����ϴ�.");
			return false;
		}

		if (!idChecked) {
			alert("���̵� �ߺ� �˻縦 �������ּ���.");
			return false;
		}
		
		if (userPw.length === 0) {
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}

		if (userPw.length < 6 || userPw.length > 12) {
			alert("��й�ȣ�� 6�ڸ����� 12�ڸ� ���̿��� �մϴ�.");
			return false;
		}
		
		if (userPw.includes(" ")) {
			alert("PW�� ������ ������ �� �����ϴ�.");
			return false;
		}

		if (userPw !== userPwCheck) {
			alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
			return false;
		}

		if (userName.length === 0) {
			alert("�̸��� �Է����ּ���.");
			return false;
		}
		
		if (userName.includes(" ")) {
			alert("�̸��� ������ ������ �� �����ϴ�.");
			return false;
		}

		if (userPhone2.length !== 4 || userPhone3.length !== 4) {
			alert("��ȭ��ȣ�� ����4�ڸ��� �ԷµǾ�� �մϴ�.");
			return false;
		}
		
		if (userPhone2.includes(" ") || userPhone3.includes(" ")) {
			alert("�޴��� ��ȣ�� ������ ������ �� �����ϴ�.");
			return false;
		}

		if (userAddr1.length !== 0 && !/\d+-\d+/.test(userAddr1)) {
			alert("�ּҴ� xxx-xxx �������� �ԷµǾ�� �մϴ�.");
			return false;
		}
		
		if (userAddr1.includes(" ")) {
			alert("�ּҿ� ������ ������ �� �����ϴ�.");
			return false;
		}
		
		if (userAddr2.includes(" ")) {
			alert("�ּҿ� ������ ������ �� �����ϴ�.");
			return false;
		}

		return true; 
	}
</script>
</html>
