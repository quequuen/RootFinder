<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/RootFinder.js"></script>
</head>
<body>
<h2>닉네임 중복 확인</h2>
<form action="RootFinderServlet" method="post" name="frm">
	<input type="hidden" name="command" value="nicknamecheck_do">
	사용자명 : <input type="text" name="name" value="${name}">
	<input type="submit" value="중복 체크">
	
	<br>
	<c:if test="${result == 1}">
		<script type="text/javascript">
			opener.document.frm.nickname.value="";
		</script>
		${name}는 이미 사용중인 닉네임 입니다.
	</c:if>
	<c:if test="${result == -1 }">
		${name}는 사용 가능한 닉네임 입니다.
		<input type="button" value="사용" class="cancel" onclick="nicknameok()">
	</c:if>
</form>
</body>
</html>