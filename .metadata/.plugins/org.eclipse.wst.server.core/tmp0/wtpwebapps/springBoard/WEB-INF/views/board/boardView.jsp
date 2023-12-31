<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
			<a href = "/board/${board.boardType}/${board.boardNum}/boardUpdate.do">수정</a>
	        <a href="/board/${board.boardType}/${board.boardNum}/boardDelete.do" id="deleteBt">삭제</a>
		</td>
	</tr>
</table>	
</body>
<script type="text/javascript">
$j(document).ready(function() {
    $j('#deleteBt').click(function(e) {
        e.preventDefault();

        if (confirm('정말로 삭제하시겠습니까?')) {
            var href = $j(this).attr('href');

            $j.ajax({
                type: 'GET',
                url: href,
                success: function(result) {
                    if (result.status === "success") {
                        alert(result.message);
                        window.location.href = '/board/boardList.do';
                    } else if (result.status === "error") {
                        alert(result.message);
                        window.location.href = '/board/boardList.do';
                    }
                },
                error: function() {
                    alert('서버와의 통신 중 오류가 발생했습니다.');
                }
            });
        }
    });
});
</script>
</html>