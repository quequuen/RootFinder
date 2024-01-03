<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/RootFinder.js"></script>
</head>
<body>
<%
   int i=0;
   int e=0;
   int n=0;
   int s=0;
   int t=0;
   int f=0;
   int p=0;
   int j=0;
   
   String mbti="";
   // I/E 결과
   String num1 = request.getParameter("num1");
   String num2 = request.getParameter("num2");
   String num3 = request.getParameter("num3");
   
   if(num1.equals("i"))
   {
      i++;
   }else{
      e++;
   }
   
   if(num2.equals("i"))
   {
      i++;
   }else{
      e++;
   }
   
   if(num3.equals("i"))
   {
      i++;
   }else{
      e++;
   }
   
   // N/S 결과
   String num4 = request.getParameter("num4");
   String num5 = request.getParameter("num5");
   String num6 = request.getParameter("num6");
   
   if(num4.equals("n"))
   {
      n++;
   }else{
      s++;
   }
   
   if(num5.equals("n"))
   {
      n++;
   }else{
      s++;
   }
   
   if(num6.equals("n"))
   {
      n++;
   }else{
      s++;
   }
   
   //T/F 결과
   
   String num7 = request.getParameter("num7");
   String num8 = request.getParameter("num8");
   String num9 = request.getParameter("num9");
   
   if(num7.equals("t"))
   {
      t++;
   }else{
      f++;
   }
   
   if(num8.equals("t"))
   {
      t++;
   }else{
      f++;
   }
   
   if(num9.equals("t"))
   {
      t++;
   }else{
      f++;
   }
   
   
   //J/P 결과
   String num10 = request.getParameter("num10");
   String num11 = request.getParameter("num11");
   String num12 = request.getParameter("num12");
   
   if(num10.equals("j"))
   {
      j++;
   }else{
      p++;
   }
   
   if(num11.equals("j"))
   {
      j++;
   }else{
      p++;
   }
   
   if(num12.equals("j"))
   {
      j++;
   }else{
      p++;
   }
   
   if(i>e)
   {
      mbti+="I";
   }else{
      mbti+="E";
   }
   
   if(n>s)
   {
      mbti+="N";
   }else{
      mbti+="S";
   }
      
   if(t>f)
   {
      mbti+="T";
   }else{
      mbti+="F";
   }
   
   if(j>p)
   {
      mbti+="J";
   }else{
      mbti+="P";
   }
%>
<form name="frm">
	당신의 MBTI는 <%=mbti%>입니다.
	<br>
	<a href='javascript:history.go(-1)'>다시 검사하기</a>
	<input type="button" class = "cancel" value="이 mbti로 등록" onclick="submitMbti('<%=mbti%>')">
</form>	

</body>
</html>