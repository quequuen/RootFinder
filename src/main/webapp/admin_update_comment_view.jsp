<%@page import="com.RootFinder.dto.CoseCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function comment_update_check(){
	var confirmVal = confirm("수정하시겠습니까?");
	
	if(confirmVal==true){
		alert("수정 완료");
		document.frm.action= "RootFinderServlet?command=admin_update_comment_action";
		document.frm.submit();
	}else{
		alert("수정 취소");
	return false;
	}	
}

</script>
</head>
<body>
<h1>관리자_댓글 수정 화면</h1>
<%
String code;
int prt_num, cdr_num;

CoseCommentDTO commentDTO = (CoseCommentDTO)request.getAttribute("commentList");
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
<td><input type="text" name="code" value="${commentList.code}" readonly></td>
</tr>
<tr>
<td>ID</td>
<td><input type="text" name="id" value="${commentList.id}" readonly></td>
</tr>
<tr>
<td>작성일</td>
<td><input type="text" name="comment_write_time" value="${commentList.comment_write_time}" readonly></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="3" cols="60" name="comment_text" style="resize:none;">${commentList.comment_text }</textarea></td>
</tr>
<tr>
<td><input type="submit" value="수정" onclick="comment_update_check()"></td>
<td><input type="button" value="취소" onclick="history.back()"></td>
</tr>
</table>
</form>
</body>
</html>