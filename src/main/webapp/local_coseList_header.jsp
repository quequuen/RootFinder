<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<Style>
.sub_header{
position:relative;
text-align:center;
display: block;
font-size: 20px;
height: 600px;
}

.sub_header h1{
margin-top: 40px;
margin-bottom: 10px;
}

.sub_header>a{
position:absolute;
top:100px;
left:20px;
   font-size: 20px; 
}
.sub_header>.cose_list li {
   list-style: none;
   float: left;
   margin-left:70px;
   padding-right: 12px;
   
}
.sub_header>.cose_list a{
text-decoration: none;
}
</Style>

</head>
<body>
<div class="sub_header">

<a href="mainpage_after_login.jsp">����ȭ������</a>
<h1>������ ���� �ڽ� ��õ</h1>

<ul>
	<li><a href="RootFinderServlet?command=local_cose_view&local=��õ/���">��õ/���</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=���">���</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=����/�泲">����/�泲</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=����/����">����/����</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=�뱸/���">�뱸/���</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=�λ�/�泲">�λ�/�泲</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
</ul>
	</div>
<br>
<hr>
