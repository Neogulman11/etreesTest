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
					            alert("회원가입이 완료되었습니다.");
					            window.location.href = "/board/userLogIn.do";
					        } else {
					            alert("회원가입이 실패하였습니다.");
					        }
					    },
					    error: function(jqXHR, textStatus, errorThrown) {
					        console.error("AJAX 오류: " + textStatus, errorThrown);
					        alert("서버와 통신 중 오류가 발생했습니다.");
					    }
					});
	            } else {
	                alert("아이디 중복 확인을 진행해주세요.");
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
			alert("아이디를 입력해주세요.");
			userId.focus();
			return;
		}
		
		if (userId.value.includes(" ")) {
			alert("ID에 공백을 포함할 수 없습니다.");
			userId.focus();
			return false;
		}
		

		if (!/^[a-zA-Z0-9]+$/.test(userId.value)) {
			alert("ID는 영문과 숫자만 사용가능합니다.");
			userId.focus();
			return false;
		}
		
		if (userId.value.length > 15) {
			alert("ID는 최대 15자를 넘을수없습니다.");
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
				console.log("요청성공", res);
				if (res == "ok") {
					console.log(userId.value);
					alert("사용 가능한 ID입니다.");
					idChecked = true; // 아이디 중복 확인 완료
					document.getElementById("joinButton").disabled = false;
				} else {
					alert("이미 사용 중인 ID입니다.");
					userId.focus();
					idChecked = false; // 아이디 중복 확인 실패
				}
			},
			error: function(err) {
				console.log("에러발생", err);
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
			alert("아이디를 입력해주세요.");
			userId.focus();
			return false;
		}
		
		if (!idChecked) {
			alert("아이디 중복 검사를 진행해주세요.");
			userId.focus();
			return false;
		}
		
		// userPw 유효성검사
		if (userPw.value.length === 0) {
			alert("비밀번호를 입력해주세요.");
			userPw.focus();
			return false;
		}

		if (userPw.value.length < 6 || userPw.value.length > 12) {
			alert("비밀번호는 6자리에서 12자리 사이여야 합니다.");
			userPw.focus();
			return false;
		}
		
		if (userPw.value.includes(" ")) {
			alert("PW에 공백을 포함할 수 없습니다.");
			userPw.focus();
			return false;
		}
		
		// userPwCheck 유효성검사
		if (userPwCheck.value.length === 0) {
			alert("pwcheck란에 pw를 입력해주세요.");
			userPwCheck.focus();
			return false;
		}

		if (userPw.value !== userPwCheck.value) {
			alert("비밀번호 확인이 일치하지 않습니다.");
			userPwCheck.focus();
			return false;
		}

		// userName 유효성검사
		if (userName.value.length === 0) {
			alert("이름을 입력해주세요.");
			userName.focus();
			return false;
		}
		
		if (/^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]*$/.test(userName.value)) {
		    alert("이름은 한글만 사용할수있습니다.");
		    userName.focus();
		    return false;
		}
		
		if (/^[ㄱ-ㅎㅏ-ㅣ]*$/.test(userName.value)) {
		    alert("이름이 정상적으로 작성되지 않았습니다.");
		    userName.focus();
		    return false;
		}
		
		if (userName.value.includes(" ")) {
			alert("이름에 공백을 포함할 수 없습니다.");
			userName.focus();
			return false;
		}
		
		// userPhone 유효성검사
		if (userPhone2.value.length === 0) {
			alert("전화번호를 입력해주세요.");
			userPhone2.focus();
			return false;
		}
		
		if (!/^[0-9]*$/.test(userPhone2.value)) {
		    alert("전화번호는 숫자만 사용가능합니다.");
		    userPhone2.focus();
		    return false;
		}
		
		if (userPhone3.value.length === 0) {
			alert("전화번호를 입력해주세요.");
			userPhone3.focus();
			return false;
		}
		
		if (!/^[0-9]*$/.test(userPhone3.value)) {
		    alert("전화번호는 숫자만 사용가능합니다.");
		    userPhone3.focus();
		    return false;
		}
		
		if (userPhone2.value.length !== 4) {
			alert("전화번호는 각각4자리로 입력되어야 합니다.");
			userPhone2.focus();
			return false;
		}

		if (userPhone3.value.length !== 4) {
			alert("전화번호는 각각4자리로 입력되어야 합니다.");
			userPhone3.focus();
			return false;
		}
		
		if (userPhone2.value.includes(" ")) {
			alert("휴대폰 번호에 공백을 포함할 수 없습니다.");
			userPhone2.focus();
			return false;
		}
		
		if (userPhone2.value.includes(" ")) {
			alert("휴대폰 번호에 공백을 포함할 수 없습니다.");
			userPhone3.focus();
			return false;
		}

		// userAddr 유효성검사
		if (!/^[0-9-]*$/.test(userAddr1.value)) {
		    alert("postNo에는 숫자만 사용가능합니다.");
		    userAddr1.focus();
		    return false;
		}
		
		if (userAddr1.value.length !== 0 && !/^\d{3}-\d{3}$/.test(userAddr1.value)) {
		    alert("주소는 xxx-xxx 형식으로 입력되어야 합니다");
		    userAddr1.focus();
		    return false;
		}
		
		if (userAddr1.value.includes(" ")) {
			alert("주소에 공백을 포함할 수 없습니다.");
			userAddr1.focus();
			return false;
		}
		
		if (userAddr2.value.includes(" ")) {
			alert("주소에 공백을 포함할 수 없습니다.");
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