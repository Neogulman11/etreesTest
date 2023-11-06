<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SignUp</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {
	
	    $j("#joinButton").on("click", function(e) {
	        e.preventDefault();
	
	        if (validateForm()) {
	            if (idChecked) {
	                const formData = $j('.signupForm :input');
					const param = formData.serialize();
	                
					$j.ajax({
					    type: "POST",
					    url: "/board/userInfo/SignUpAction.do",
					    data: param,
					    dataType: "json", 
					    success: function(data) {
					        if (data.success === "success") {
					            alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
					            window.location.href = "/board/userLogIn.do";
					        } else {
					            alert("ȸ�������� �����Ͽ����ϴ�.");
					        }
					    },
					    error: function(jqXHR, textStatus, errorThrown) {
					        console.error("AJAX ����: " + textStatus, errorThrown);
					        alert("������ ��� �� ������ �߻��߽��ϴ�.");
					    }
					});
	            } else {
	                alert("���̵� �ߺ� Ȯ���� �������ּ���.");
	            }
	        }
	    });
	});
</script>
<body>
<table align="center">
	<tr>
		<td align="left">
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
	<tr>
		<td>
			<form class="signupForm" id="signupForm" >
				<table border ="1"  width="440">
					<tr>
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
							<input id="userPwCheck" type="password" size="25"> 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						name
						</td>
						<td width="500">
							<input name="userName" id="userName" type="text" size="25" maxlength="4" > 
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						phone
						</td>
						<td width="400">
							<select name="userPhone1" id="userPhone1">
								<c:forEach var="comcode" items="${comcode}">
						            <option value="${comcode.codeId}">${comcode.codeName}</option>
					            </c:forEach>
					        </select>
							- <input name="userPhone2" id="userPhone2" type="text" size="5" maxlength="4"> 
							- <input name="userPhone3" id="userPhone3" type="text" size="5" maxlength="4">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						postNo
						</td>
						<td width="400">
							<input name="userAddr1" id="userAddr1" type="text" size="25" maxlength="6"> 
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
					<a id="joinButton">join</a>
				</div>
			</form>
		</td>
	</tr>
</table>
</body>
<script  type="text/javascript">


	let idChecked = false; 

	const idCheck = () => {
		const userId = document.getElementById("userId");

		if (userId.value.length === 0) {
			alert("���̵� �Է����ּ���.");
			userId.focus();
			return;
		}
		
		if (userId.value.includes(" ")) {
			alert("ID�� ������ ������ �� �����ϴ�.");
			userId.focus();
			return false;
		}
		

		if (!/^[a-zA-Z0-9]+$/.test(userId.value)) {
			alert("ID�� ������ ���ڸ� ��밡���մϴ�.");
			userId.focus();
			return false;
		}
		
		if (userId.value.length > 15) {
			alert("ID�� �ִ� 15�ڸ� �����������ϴ�.");
			userPw.focus();
			return false;
		}
		

		$j.ajax({
			type: "post",
			url: "/board/userInfo/id-check.do",
			data: {
				"userId": userId.value
			},
			success: function(res) {
				console.log("��û����", res);
				if (res == "ok") {
					console.log(userId.value);
					alert("��� ������ ID�Դϴ�.");
					idChecked = true; // ���̵� �ߺ� Ȯ�� �Ϸ�
					document.getElementById("joinButton").disabled = false;
				} else {
					alert("�̹� ��� ���� ID�Դϴ�.");
					userId.focus();
					idChecked = false; // ���̵� �ߺ� Ȯ�� ����
				}
			},
			error: function(err) {
				console.log("�����߻�", err);
			}
		});
	}

	const validateForm = () => {
		const userId = document.getElementById("userId");
		const userPw = document.getElementById("userPw");
		const userPwCheck = document.getElementById("userPwCheck");
		const userName = document.getElementById("userName");
		const userPhone2 = document.getElementById("userPhone2");
		const userPhone3 = document.getElementById("userPhone3");
		const userAddr1 = document.getElementById("userAddr1");
		const userAddr2 = document.getElementById("userAddr2");

		if (userId.value.length === 0) {
			alert("���̵� �Է����ּ���.");
			userId.focus();
			return false;
		}
		
		if (!idChecked) {
			alert("���̵� �ߺ� �˻縦 �������ּ���.");
			userId.focus();
			return false;
		}
		
		// userPw ��ȿ���˻�
		if (userPw.value.length === 0) {
			alert("��й�ȣ�� �Է����ּ���.");
			userPw.focus();
			return false;
		}

		if (userPw.value.length < 6 || userPw.value.length > 12) {
			alert("��й�ȣ�� 6�ڸ����� 12�ڸ� ���̿��� �մϴ�.");
			userPw.focus();
			return false;
		}
		
		if (userPw.value.includes(" ")) {
			alert("PW�� ������ ������ �� �����ϴ�.");
			userPw.focus();
			return false;
		}
		
		// userPwCheck ��ȿ���˻�
		if (userPwCheck.value.length === 0) {
			alert("pwcheck���� pw�� �Է����ּ���.");
			userPwCheck.focus();
			return false;
		}

		if (userPw.value !== userPwCheck.value) {
			alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
			userPwCheck.focus();
			return false;
		}

		// userName ��ȿ���˻�
		if (userName.value.length === 0) {
			alert("�̸��� �Է����ּ���.");
			userName.focus();
			return false;
		}
		
		if (/^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]*$/.test(userName.value)) {
		    alert("�̸��� �ѱ۸� ����Ҽ��ֽ��ϴ�.");
		    userName.focus();
		    return false;
		}
		
		if (/^[��-����-��]*$/.test(userName.value)) {
		    alert("�̸��� ���������� �ۼ����� �ʾҽ��ϴ�.");
		    userName.focus();
		    return false;
		}
		
		if (userName.value.includes(" ")) {
			alert("�̸��� ������ ������ �� �����ϴ�.");
			userName.focus();
			return false;
		}
		
		// userPhone ��ȿ���˻�
		if (userPhone2.value.length === 0) {
			alert("��ȭ��ȣ�� �Է����ּ���.");
			userPhone2.focus();
			return false;
		}
		
		if (!/^[0-9]*$/.test(userPhone2.value)) {
		    alert("��ȭ��ȣ�� ���ڸ� ��밡���մϴ�.");
		    userPhone2.focus();
		    return false;
		}
		
		if (userPhone3.value.length === 0) {
			alert("��ȭ��ȣ�� �Է����ּ���.");
			userPhone3.focus();
			return false;
		}
		
		if (!/^[0-9]*$/.test(userPhone3.value)) {
		    alert("��ȭ��ȣ�� ���ڸ� ��밡���մϴ�.");
		    userPhone3.focus();
		    return false;
		}
		
		if (userPhone2.value.length !== 4) {
			alert("��ȭ��ȣ�� ����4�ڸ��� �ԷµǾ�� �մϴ�.");
			userPhone2.focus();
			return false;
		}

		if (userPhone3.value.length !== 4) {
			alert("��ȭ��ȣ�� ����4�ڸ��� �ԷµǾ�� �մϴ�.");
			userPhone3.focus();
			return false;
		}
		
		if (userPhone2.value.includes(" ")) {
			alert("�޴��� ��ȣ�� ������ ������ �� �����ϴ�.");
			userPhone2.focus();
			return false;
		}
		
		if (userPhone2.value.includes(" ")) {
			alert("�޴��� ��ȣ�� ������ ������ �� �����ϴ�.");
			userPhone3.focus();
			return false;
		}

		// userAddr ��ȿ���˻�
		if (!/^[0-9-]*$/.test(userAddr1.value)) {
		    alert("postNo���� ���ڸ� ��밡���մϴ�.");
		    userAddr1.focus();
		    return false;
		}
		
		if (userAddr1.value.length !== 0 && !/^\d{3}-\d{3}$/.test(userAddr1.value)) {
		    alert("�ּҴ� xxx-xxx �������� �ԷµǾ�� �մϴ�");
		    userAddr1.focus();
		    return false;
		}
		
		if (userAddr1.value.includes(" ")) {
			alert("�ּҿ� ������ ������ �� �����ϴ�.");
			userAddr1.focus();
			return false;
		}
		
		if (userAddr2.value.includes(" ")) {
			alert("�ּҿ� ������ ������ �� �����ϴ�.");
			return false;
		}

		return true; 
	}
	
	document.getElementById("userId").addEventListener("input", function() {
	    let inputValue = this.value;

	    let cleanedValue = inputValue.replace(/[^a-zA-Z0-9]/g, "");

	    this.value = cleanedValue;
	});
	
	
	document.getElementById("userName").addEventListener("input", function() {
	    let inputValue = this.value;

	    let cleanedValue = inputValue.replace(/[a-zA-Z0-9{}[\]\/?.,;:|)*~!^\\-_+<>@#$%&='"]/g, "");

	    this.value = cleanedValue;
	});
	
	document.getElementById("userPhone2").addEventListener("input", function() {
	    let inputValue = this.value;

	    let cleanedValue = inputValue.replace(/\D/g, "");

	    this.value = cleanedValue;
	});
	
	document.getElementById("userPhone3").addEventListener("input", function() {
	    let inputValue = this.value;

	    let cleanedValue = inputValue.replace(/\D/g, "");

	    this.value = cleanedValue;
	});

	
	document.getElementById("userAddr1").addEventListener("input", function() {
	    let inputValue = this.value;

	    let numericValue = inputValue.replace(/\D/g, "");
	    
	    let formattedValue = numericValue.replace(/(\d{3})(\d{3})/, "$1-$2");

	    this.value = formattedValue;
	});
	
	
	
	
</script>
</html>