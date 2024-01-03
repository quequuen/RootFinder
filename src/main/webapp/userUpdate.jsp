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
<h2>회원 정보 수정</h2>
<form action="userUpdate.do" method="post" name="frm">
<table>
<tr>
<td>이름 </td>
<td><input type="text" name="name" value="${uDto.username }" size="20" readonly></td>
</tr>
<tr>
<td>아이디 </td>
<td><input type="text" name="userid" value="${uDto.id }" size="20" readonly></td>
</tr>
<tr>
<td>비밀번호 </td>
<td><input type="password" name="pwd" value="${uDto.pwd }" size="20"></td>
</tr>
<tr>
<td>비밀번호 확인 </td>
<td><input type="password" name="pwd_check" value="${uDto.pwd }" size="20"></td>
</tr>
<tr>
<td>이메일 </td>
<td><input type="text" name="email" value="${uDto.email }" size="20"></td>
</tr>
<tr>
<td>mbti </td>
<td><input type="text" name="mbti" value="${uDto.mbti }" size="20"></td>
</tr>
<tr>
<td>전화번호 </td>
<td><input type="text" name="phone" value="${uDto.phone }" size="20"></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="확인" onclick="retrun joinCheck()">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="취소">
</td>
</tr>

</table>

</form>
</body>
</html>