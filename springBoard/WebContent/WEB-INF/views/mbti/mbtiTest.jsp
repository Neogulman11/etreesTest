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
	                <input type="radio" name="selectedRadio_${board.boardNum}" value="3">
                    <input type="radio" name="selectedRadio_${board.boardNum}" value="2">
                    <input type="radio" name="selectedRadio_${board.boardNum}" value="1">
                    <input type="radio" name="selectedRadio_${board.boardNum}" value="0">
                    <input type="radio" name="selectedRadio_${board.boardNum}" value="-1">
                    <input type="radio" name="selectedRadio_${board.boardNum}" value="-2">
                    <input type="radio" name="selectedRadio_${board.boardNum}" value="-3">
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
		    <button id="submitButton" onclick="updateSessionOnSubmit('${board.boardType}')">제출하기</button>
		</c:if>

		<c:forEach items="${boardList}" var="board">
		    <c:out value="${board.boardType}" />
		</c:forEach>
    </div>
</body>
<script type="text/javascript">
	function updateSessionOnSubmit(boardType) {
	    var radioButtons = document.querySelectorAll('input[type="radio"]:checked');
	    var selectedValue = 0;
	
	    radioButtons.forEach(function (radioButton) {
	        selectedValue += parseInt(radioButton.value);
	    });
	
	    sessionStorage.setItem('boardType_' + boardType, selectedValue.toString());
	}
	
	function nextSubmit() {
        var radioButtons = document.querySelectorAll('input[type="radio"]:checked');
        if (radioButtons.length < 5) {
            alert("선택되지 않은 항목이 있습니다.");
            event.preventDefault();
        } else {
            var pageNoInput = document.getElementById("pageNo");
            var currentPage = parseInt(pageNoInput.value);
            pageNoInput.value = currentPage + 1;
            
            var currentURL = window.location.href;
            var newURL = currentURL.replace(/pageNo=\d+/, "pageNo=" + (currentPage + 1));
            window.location.href = newURL;
            
            
        }
    }
	
    $j("#submitButton").click(function() {
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
            success: function(response) {
                var result = JSON.parse(response);

                // 페이지 리다이렉션
                window.location.href = "mbtiResult.do"; 
            },
            error: function(xhr, textStatus, errorThrown) {
                // 오류 처리를 수행할 수 있습니다.
            }
        });
    });
	
</script>
</html>