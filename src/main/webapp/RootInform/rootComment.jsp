<%@page import="com.RootFinder.dao.UserDAO"%>
<%@page import="com.RootFinder.dto.CoseCommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.RootFinder.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>
<%@ include file="rootHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

.inputComment {
	width: 980px;
}

.loginUser_nickname {
	text-align: left;
	margin-bottom: 10px;
}

.btn {
	width: 50px;
	height: 25px;
	float: right;
}

.count {
	border: none;
}

.count:focus {
	outline: none;
	background-color: white;
}

.commentCountView {
	width: 980px;
}

.commentCountView>p {
	float: left;
}

.commentView {
	width: 980px;
}

.re_comment img {
	float: left;
}
</style>
<script type="text/javascript">
	function comment_check() {
		if (document.frm.inputComment.value.length == 0) {
			alert("댓글 내용을 작성해주세요 ");
		} else {
			document.frm.action = "RootFinderServlet?command=root_comment_action&comment=parent";
			document.frm.submit();
		}
	}
	
	function re_comment_check(prt_num,cdr_num){
		console.log(prt_num,cdr_num);
	    var reCommentTextarea = document.querySelector("textarea[name='inputReComment_" + prt_num + "']").value;
	    var result = "RootFinderServlet?command=root_comment_action&comment=child&prt_num="+prt_num+"&cdr_num="+cdr_num;
		if(reCommentTextarea.length == 0){
			alert("댓글 내용을 작성해주세요");
		} else{
			document.frm.action = result;
			document.frm.submit();
		}
		
	}	
	
	
</script>
	
	
	

</head>
<body>
	<div id="wrap">
		<form name="frm" method="post">
			<input type="hidden" name="code" value="${param.code }">
			<div class="title"  style="font-size: 14px; margin-bottom:10px;">
				<%
				String title = request.getAttribute("title").toString();
				%>
				<p><%=title%></p> 

			</div>

			<div class="commentAll" align="center"  style="font-size: 15px; margin-bottom:10px;">
				<div class="inputComment" align="center" style="margin:10px;">
					<div class="loginUser_nickname">
						<p>${loginUser.username }</p>
					</div>
					<input type="hidden" name="id" value="${loginUser.id}">
					<textarea rows="5" cols="120" name="inputComment"
						placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제됩니다 :) "
						style="resize: none; margin: 10px;"></textarea>
					<br> <br> <input class="btn" type="button" value="등록"
						onclick="comment_check()">
				</div>
				<br>
				<br>
				<div class="commentCountView" align="left" style="margin: 30px;">
					<p>댓글</p>
					<p>${commentCount }</p>
					<br>
					<br>
					<%
					ArrayList<CoseCommentDTO> commentList = (ArrayList)request.getAttribute("commentList");
					String username, comment_write_time, comment_text;
					int prt_num, cdr_num=0;
					UserDAO userDAO = UserDAO.getInstance();
					for(int i=0;i<commentList.size();i++){
						if(commentList.get(i).getCdr_num()==0){
							username = userDAO.getUserNameById(commentList.get(i).getId());
							comment_write_time = commentList.get(i).getComment_write_time();
							comment_text = commentList.get(i).getComment_text();
							prt_num =commentList.get(i).getPrt_num();
							for(int j=0;j<commentList.size();j++){
								if(commentList.get(i).getPrt_num()==commentList.get(j).getPrt_num()){
									cdr_num++;
								}
							}
					%>
						<hr>
									<div class="comment" style="margin: 30px;">
										<p><%=username %></p>
										<p class="commentDate"><%=comment_write_time %></p>W
										<p><%=comment_text %></p>
										<br> 
										<%--'댓글달기' 버튼을 누르면 re_comment_check()에 prt_num(부모 댓글의 번호)와 cdr_num(자식 댓글의 갯수==새 자식 댓글의 번호)
										를 같이 넘김 --%>
										<input type="button" value="댓글달기" onclick="re_comment_check(<%=prt_num%>,<%=cdr_num%>)">
										<textarea rows="3" cols="120" class="inputReComment_<%=prt_num %>"
											name="inputReComment_<%=prt_num%>"
											placeholder="주제와 무관한 댓글이나 악플은 경고조치 없이 삭제됩니다 :) "
											style="resize: none"></textarea>
											
									</div>	
					<% 		
						}else{
							username = userDAO.getUserNameById(commentList.get(i).getId());
							comment_write_time = commentList.get(i).getComment_write_time();
							comment_text = commentList.get(i).getComment_text();
					%>
									<div class="re_comment" style="margin: 30px;">
										<hr>
										<img src="image/enter.png" style="width: 50px">
										<p><%=username %></p>
										<p class="commentDate"><%=comment_write_time %></p>
										<p><%=comment_text %></p>
									</div>
					
					<%
						
						}
					}
					
					%>
					<hr>
				</div>
			</div>
		</form>
	</div>
<%@ include file="../footer.jsp"%>