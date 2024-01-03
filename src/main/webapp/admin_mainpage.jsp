<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_header.jsp" %>
<style>
table, tr, td, th{
	border: solid 1px rgba(0,0,0,1);
	border-collapse: collapse;
	padding-left: 15px;
	padding-right: 15px;
}

</style>

<div id="wrap" style="position:relative; padding-top:100px;">
<article>
<br>
	
	<div class="one_page" style=" padding-top: 80px; background: #f6f6f6; width: 100%; padding-bottom: 400px;">
	
		<section id="admin">
			<div class="admin_user_div" style="width: 1150px; margin: 0 auto; position: relative;">
				<div class="text" style="color: #363636;
				  font-size: 24px;
				  font-weight: bold;
				  width: 100%;
				  text-align: center;
				  height: 92px;">
				  
					<h3>ȸ�� ����</h3>
				
					<table style="margin: 0 auto;"  id="user">
						
						<tr style="font-size: 15px;">
							
						
							<th>   </th>
							<th>�̸�</th>
							<th>ID</th>
							<th>EMAIL</th>
							<th>����</th>
							<th>����</th>
							<th>MBTI</th>
							<th colspan="2">����/Ż��</th>
							
						</tr>
						
						<c:forEach items="${allUserInf}" var="allUserInf" varStatus="status">							
							<tr>
								<td>${status.count}</td>
								<td>${allUserInf.username}</td>
								<td><a href="#">${allUserInf.id}</a></td>
								<td>${allUserInf.email}</td>
								<td>${allUserInf.gender}</td>
								<td>${allUserInf.birth}</td>
								<td>${allUserInf.mbti}</td>
								<td><a href="RootFinderServlet?command=admin_update_userinf_view&id=${allUserInf.id}">����</a></td>
								<td><a href="RootFinderServlet?command=admin_delete_userinf_view&id=${allUserInf.id}">Ż��</a></td>
							</tr>

						</c:forEach>
						
					</table>
				</div>
			</div>
		</section>
	</div>
	
	
	<div class="two_page" style=" padding-top: 30px; background: #f6f6f6; width: 100%; padding-bottom: 400px;">
		<section id="admin">
		
			<div class="admin_user_div" style="width: 1150px; margin: 0 auto; position: relative;">
				<div class="text" style="color: #363636;
				  font-size: 24px;
				  font-weight: bold;
				  width: 100%;
				  text-align: center;
				  height: 92px;">
				  
					<h3>�ڽ� ����</h3>
					
					<table style="margin: 0 auto;">
						
						<tr style="font-size: 15px;">
							<a id="cose"></a>
							<th>   </th>
							<th>�ڽ� �ڵ�</th>
							<th>����</th>
							<th>�ּ�</th>
							<th>��� ����ڸ�</th>
							<th>��� ����� ID</th>
							<th colspan="2">����/����</th>
						</tr>
						
						<c:forEach items="${allCoseList}" var="allCoseList" varStatus="status">							
							<tr>
								<td>${status.count}</td>
								<td><a href="#">${allCoseList.code}</a></td>
								<td>${allCoseList.title}</td>
								<td>${allCoseList.main_addr}</td>
								
								<!--����ڸ��� �������� ���� �޼ҵ�  -->
										<%
   											// EL�� ����Ͽ� ���� ���� ������ ����
										   CoseListDTO coseList = (CoseListDTO)pageContext.getAttribute("allCoseList");
										   CoseDAO cdao = CoseDAO.getInstance();
										   String username = cdao.getUsernameByCode(coseList.getCode());
										   String userId = cdao.getIdByCode(coseList.getCode());
										%>
								<td><%=username %></td>
								<td><%=userId %></td>
								<td><a href="RootFinderServlet?command=admin_update_cose_view&code=${allCoseList.code}">����</a></td>
								<td><a href="RootFinderServlet?command=admin_delete_cose_view&code=${allCoseList.code}">����</a></td>
								
							</tr>

						</c:forEach>	
					</table>
				</div>
			</div>
		</section>
	</div>
							
<div class="three_page" style=" padding-top: 30px; background: #f6f6f6; width: 100%; padding-bottom: 400px;">
		<section id="admin">
		<a name="commnet"></a>
			<div class="admin_comment_div" style="width: 1150px; margin: 0 auto; position: relative;">
				<div class="text" style="color: #363636;
				  font-size: 24px;
				  font-weight: bold;
				  width: 100%;
				  text-align: center;
				  height: 92px;">
				  
					<h3>��� ����</h3>
					<table style="margin: 0 auto;">
						
						<tr style="font-size: 15px;">
						<a id="comment"></a>
							<th>   </th>
							<th>�ڽ� �ڵ�</th>
							<th>����� ID</th>
							<th>��� �ۼ� �ð�</th>
							<th>����</th>
							<th colspan="2">����/����</th>
						</tr>
						
						<c:forEach items="${allCommentList}" var="allCommentList" varStatus="status">							
							<tr>
								<td>${status.count}</td>
								<td><a href="#">${allCommentList.code}</a></td>
								<td>${allCommentList.id}</td>
								<td>${allCommentList.comment_write_time}</td>
								<td>${allCommentList.comment_text}</td>
								<td><a href="RootFinderServlet?command=admin_update_comment_view&code=${allCommentList.code}&prt_num=${allCommentList.prt_num}&cdr_num=${allCommentList.cdr_num}">����</a></td>
								<td><a href="RootFinderServlet?command=admin_delete_comment_view&code=${allCommentList.code}&prt_num=${allCommentList.prt_num}&cdr_num=${allCommentList.cdr_num}">����</a></td>
								
							</tr>

						</c:forEach>	
					</table>
				</div>
			</div>
		</section>
	</div>
							
</article>
</div>

<%@ include file="../footer.jsp" %>

