<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
	});
	/* consol.log(boardList); */
	
	

</script>
<body>
<table  align="center">
	<tr>
		<td>
			<a href="/board/userLogIn.do">login</a>
			<a href="/board/userSignUp.do">join</a>	
			<a style="float: right;">total : ${totalCnt}</a>

		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				
				<c:forEach items="${boardList}" var="list">
				
					<tr>
						<td align="center">
							${list.comcodevo.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<form name="filterbox" accept-charset="UTF-8">
		<tr>
			<td>
				<label><input type="checkbox" name="filter" onclick='selectAll(this)'>전체</label>
				<c:forEach  items="${comcode}" var="comcode">
		            <label><input type="checkbox" name="filter" value="${comcode.codeId}">${comcode.codeName}</label>
	            </c:forEach>
	            <button type="submit" id="filterButton" value="조회">조회</button>
			</td>
		</tr>
	</form>
</table>	
</body>
<script type="text/javascript">
	
	// ajax로 선택된 checkbox 값 서버로 보내기
	var $j = jQuery.noConflict();

	$j(document).ready(function() {
	    $j("#filterButton").click(function() {
	        var filters = [];
	        $j("input[type='checkbox']:checked").each(function() {
	            filters.push($j(this).val());
	        });
	        
	        $j.ajax({
	            type: "GET",  
	            url: "/board/boardList.do",
	            data: { filter: filters },
	            dataType: "html",
	            success: function(data) {
	                $j("#boardTable").html(data);
	                console.log(data);
	            },
	            error: function() {
	                alert("Ajax 요청 실패");
	            }
	        });
	    });
	});
	
	// 전체 선택
	function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('filter');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
</script>
</html>