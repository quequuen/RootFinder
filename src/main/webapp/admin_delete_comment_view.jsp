<%@page import="com.RootFinder.dto.CoseCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function comment_delete_check(){
	var cdr_num = document.querySelector("input[name='cdr_num']").value;
	if(cdr_num==0){
		var confirmVal = confirm("해당 댓글을 삭제하시면 해당 댓글의 대댓글들도 모두 삭제됩니다. \n그래도 삭제하시겠습니까?");
		if(confirmVal==true){
			alert("삭제 완료");
			document.frm.action= "RootFinderServlet?command=admin_delete_comment_action";
			document.frm.submit();
		}else{
			alert("삭제 취소");
		return false;
		}
	}else{
		var confirmVal = confirm("삭제하시겠습니까?");
		if(confirmVal==true){
			alert("삭제 완료");
			document.frm.action= "RootFinderServlet?command=admin_delete_comment_action";
			document.frm.submit();
		}else{
			alert("삭제 취소");
		return false;
		}
	}
		
}

</script>
</head>
<body>
<h1>관리자_댓글 삭제 화면</h1>
<%
String code;
int prt_num, cdr_num;

CoseCommentDTO  commentDTO = (CoseCommentDTO)request.getAttribute("commentList");
code = commentDTO.getCode();
prt_num = commentDTO.getPrt_num();
cdr_num = commentDTO.getCdr_num();
System.out.println(prt_num);
System.out.println(cdr_num);
%>
<form name="frm" method="post">
<input type="hidden" name="code" value="<%=code%>">
<input type="hidden" name="prt_num" value="<%=prt_num%>">
<input type="hidden" name="cdr_num" value="<%=cdr_num%>">
<table>
<tr>
<td>CODE</td>
<td>${commentList.code}</td>
</tr>
<tr>
<td>ID</td>
<td>${commentList.id}</td>
</tr>
<tr>
<td>작성일</td>
<td>${commentList.comment_write_time}</td>
</tr>
<tr>
<td>내용</td>
<td>${commentList.comment_text }</td>
</tr>
<tr>
<td><input type="submit" value="삭제" onclick="comment_delete_check()"></td>
<td><input type="button" value="취소" onclick="history.back()"></td>
</tr>
</table>
</form>
</body>
</html>
</body>
</html>