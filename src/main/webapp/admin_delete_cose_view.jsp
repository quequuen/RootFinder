<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
table, tr, td, th{
	border: solid 1px rgba(0,0,0,1);
	border-collapse: collapse;
	padding-left: 15px;
	padding-right: 15px;
}

</style>
<body>
<h1>코스 삭제 페이지</h1>
<form action="RootFinderServlet?command=admin_cose_update" method="post" name="frm" enctype="multipart/form-data">
<table>
	<tr>
		<th>DAY</th>
		<th>장소명</th>	
		<th>날짜</th>
		<th colspan="2">시간대</th>
		<th>주소</th>
		<th >이미지</th>	
	</tr>
	<c:forEach items="${admin_cose_list}" var="admin_cose_list" varStatus="status">
		<tr>
		<td>${admin_cose_list.day}</td>
		<td>${admin_cose_list.placeName}</td>
        <td><fmt:formatDate value="${admin_cose_list.cose_date}" pattern="yyyy-MM-dd" /></td>
		<td colspan="2">${admin_cose_list.starttime} ~ ${admin_cose_list.endtime}</td>
		<td>${admin_cose_list.addr}</td>
		<td colspan="2"><img style="width:50px; height:50px" src="./image/${admin_cose_list.img}"></td>
		</tr>
	</c:forEach>
</table>

<%
	String content = request.getAttribute("content").toString();
%>

		<h3>코스 소감</h3>
		<textarea  ><%=content%></textarea>	
<br>
<h2>정말 이 코스를 삭제 하시겠습니까?</h2>
<input type="submit" value="삭제">
<input type="button" value="취소">

</form>
</body>
</html>