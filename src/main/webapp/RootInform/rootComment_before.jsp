<%@page import="com.RootFinder.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ include file="../header.jsp"%>
    <%@ include file="rootHeader.jsp" %>
<script type="text/javascript" src="../script/RootFinder.js"></script>
<style type="text/css">
* {
	padding: 0;
	margin: 0 auto;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

#wrap {
	width: 1200px;
	margin: 0 auto;
}
</style>
<style type="text/css">
.title {
	width: 1200px;
	height: 100px;
	margin: 0 auto;
	padding: 0;
	text-align: center;
}

.title>p {
	font-size: 3em;
	font-weight: bold;
	line-height: 100px;
	margin: 0;
	padding: 0;
	text-align: right;
}

.textarea{
color: gray;
}

.textarea:hover{
color: blue;
text-decoration: underline;
}

.commentCountView{
	width: 980px;
}

.commentCountView >p {
	float:left;
}

.commentView{
	width: 980px;
}

.re_comment img {
	float: left;
}
</style>
</head>
<body>

<div id="wrap">
<form name="frm" method="post" action="RootFinderServlet?command=root_comment_input">
		<input type="hidden" name="code" value="${param.code }">
		<div class="title" style="margin: 20px; font-size:15px;">
				<% String title = (String)request.getAttribute("title"); %>
				<p><%= title %></p>

			</div>
			
			<div class="commentWrap">
			<div class="login" align="center">
			<textarea class="textarea"rows="5" cols="120" placeholder="로그인 후 댓글 작성 가능합니다 :)" readonly onclick="location.href='RootFinderServlet?command=login_view&where=comment&code=${param.code}'" style="resize:none">로그인 후 사용 가능합니다 :)</textarea>
			</div>
			<br><br>
				<div class="commentCountView" align="left" style="margin: 30px; font-size:15px;">
				<p>댓글 </p><p>${commentCount }</p>
				<br><br>
				</div>
				<div class="commentView" align="left" style="margin: 30px; font-size:15px;">
				<c:forEach items="${commentList }" var="comment">
							<c:choose>
								<c:when test="${comment.cdr_num==0 }">
									<hr>
									<div class="comment">
										<p>${comment.id }</p>
										<p class="commentDate">${comment.comment_write_time }</p>
										<p>${comment.comment_text }</p>
										<br> 
										<textarea class="textarea"rows="3" cols="120" placeholder="로그인 후 댓글 작성 가능합니다 :)" readonly onclick="location.href='RootFinderServlet?command=login_view&where=comment&code=${param.code}'" style="resize:none">로그인 후 사용 가능합니다 :)</textarea>
									</div>
								</c:when>
								<c:otherwise>
									<div class="re_comment">
										<hr>
										<img src="image/enter.png" style="width: 50px">
										<p>${comment.id }</p>
										<p class="commentDate">${comment.comment_write_time }</p>
										<p>${comment.comment_text }</p>
									</div>
								</c:otherwise>
							</c:choose>
				</c:forEach>
				</div>
			</div>
</form>
</div>

<%@ include file="../footer.jsp"%>