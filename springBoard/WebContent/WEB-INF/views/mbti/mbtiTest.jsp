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
    <div align="center" >
        <c:forEach items="${boardList}" var="board">
            <fieldset>
                <a align="center">${board.boardComment}</a> <br>
                <div>
	                <a>동의</a>
	                <input type="radio" name="selectedRadio_${board.boardNum}" id="${board.boardType}" value="1">
                    <input type="radio" name="selectedRadio_${board.boardNum}" id="${board.boardType}" value="2">
                    <input type="radio" name="selectedRadio_${board.boardNum}" id="${board.boardType}" value="3">
                    <input type="radio" name="selectedRadio_${board.boardNum}" id="${board.boardType}" value="4">
                    <input type="radio" name="selectedRadio_${board.boardNum}" id="${board.boardType}" value="5">
                    <input type="radio" name="selectedRadio_${board.boardNum}" id="${board.boardType}" value="6">
                    <input type="radio" name="selectedRadio_${board.boardNum}" id="${board.boardType}" value="7">
	                <a>비동의</a>
                </div>
            </fieldset>
        </c:forEach>
        <c:if test="${totalCnt > currentPage.pageNo * 5}">
		    <form action="/mbti/mbtiTest.do" method="GET">
		        <input type="hidden" name="pageNo" id="pageNo" value="${currentPage.pageNo}" />
		        <input type="submit" value="다음" onclick="nextSubmit()" />
    		</form>	
		</c:if>
		
		<c:if test="${currentPage.pageNo * 5 >= totalCnt}">
		    <button id="submitButton" >제출하기</button>
		</c:if>

    </div>
</body>
<script type="text/javascript">

	function nextSubmit() {
        var radioButtons = document.querySelectorAll('input[type="radio"]:checked');
        if (radioButtons.length < 5) {
            alert("선택되지 않은 항목이 있습니다.");
            event.preventDefault();
        } else {
        	radioButtons.forEach(function (radioButton) {
        		var selectedValue = parseInt(radioButton.value);
                var boardType = radioButton.id;

                var score = 0;

                if (selectedValue === 1) {
                    score = 3;
                } else if (selectedValue === 2) {
                    score = 2;
                } else if (selectedValue === 3) {
                    score = 1;
                } else if (selectedValue === 4) {
                    score = 0;
                } else if (selectedValue === 5) {
                    score = 1;
                } else if (selectedValue === 6) {
                    score = 2;
                } else if (selectedValue === 7) {
                    score = 3;
                }

                var charToUse = selectedValue <= 3 ? boardType.charAt(0) : boardType.charAt(1);

                var sessionKey = charToUse;
                var sessionValue = sessionStorage.getItem(sessionKey) || "0";
                sessionValue = parseInt(sessionValue) + score;
                sessionStorage.setItem(sessionKey, sessionValue.toString());
            });

            var pageNoInput = document.getElementById("pageNo");
            var currentPage = parseInt(pageNoInput.value);
            pageNoInput.value = currentPage + 1;

            var currentURL = window.location.href;
            var newURL = currentURL.replace(/pageNo=\d+/, "pageNo=" + (currentPage + 1));
            window.location.href = newURL;
        }
    }
	
	$j("#submitButton").click(function() {
	    var radioButtons = document.querySelectorAll('input[type="radio"]:checked');
	    if (radioButtons.length < 5) {
	        alert("선택되지 않은 항목이 있습니다.");
	        event.preventDefault();
	    } else {
	        radioButtons.forEach(function (radioButton) {
	        	var selectedValue = parseInt(radioButton.value);
                var boardType = radioButton.id;

                var score = 0;

                if (selectedValue === 1) {
                    score = 3;
                } else if (selectedValue === 2) {
                    score = 2;
                } else if (selectedValue === 3) {
                    score = 1;
                } else if (selectedValue === 4) {
                    score = 0;
                } else if (selectedValue === 5) {
                    score = 1;
                } else if (selectedValue === 6) {
                    score = 2;
                } else if (selectedValue === 7) {
                    score = 3;
                }

                var charToUse = selectedValue <= 3 ? boardType.charAt(0) : boardType.charAt(1);

                var sessionKey = charToUse;
                var sessionValue = sessionStorage.getItem(sessionKey) || "0";
                sessionValue = parseInt(sessionValue) + score;
                sessionStorage.setItem(sessionKey, sessionValue.toString());

            });

	        var sessionData = {};

	        for (var i = 0; i < sessionStorage.length; i++) {
	            var key = sessionStorage.key(i);
	            var value = sessionStorage.getItem(key);
	            sessionData[key] = value;
	        }

	        $j.ajax({
	            type: "POST",
	            url: "/mbti/mbtiResult.do",
	            data: JSON.stringify(sessionData),
	            contentType: "application/json",
	            dataType: "json",
	            success: function(response) {
	            	var result = response.resultData;

	                window.location.href = "mbtiResult.do"; 
	            },
	            error: function(xhr, textStatus, errorThrown) {

	            }
	        });
	    }
	});

	
</script>
</html>