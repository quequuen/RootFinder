
<%@page import="java.util.Date"%>
<%@page import="com.RootFinder.dto.CoseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="rootHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.frm {
	margin: 0 auto;
}
</style>
  
<style type="text/css">

.title {
	width: 1200px ;
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

.title td > p {
	font-size: 3em;
	font-weight: bold;
	line-height: 100px;
	margin: 0;
	padding: 10px;
	text-align: right;
}

.schedule th {
	background-color: black;
}

.schedule th > p {
	width: 195px;
	line-height: 70px;
	text-align: center;
	font-size: 1.5em;
	color: white;
	font-weight: bold;
}

.schedule .price_sum p {
	text-align: left;
}

.schedule .day {
	border: 1px solid black;
}

.schedule .tr{
border: 1px solid black;
} 

</style> 
</head>
<body>
	<div id="wrap">
		<div class="title" style="font-size: 14px;">
			<% String title = request.getAttribute("title").toString(); 
				System.out.println(title);
			%>
				<p><%= title %></p>
		</div>
		
		<form name="frm" method="post" class="frm">
		<input type="hidden" name="code" value="${param.code }">
			<table class="schedule" style="margin-top:50px;">
				<tr style=" color:white; font-size:15px; text-align:center;">
					<th><p>날짜</p></th>
					<th><p>일정</p></th>
					<th><p>상세주소</p></th>
					<th><p>경비</p></th>
				</tr>


				<%
				ArrayList<CoseDTO> coseList = (ArrayList)request.getAttribute("coseList");
				CoseDTO one = new CoseDTO();
				coseList.add(one);
				
				String day = "Day1";
				int total_price_sum = 0;
				
				int num=0;     //coseList에서 해당 day값만 가져올 수 있게 반복문의 초기값을 따로 만들어주기
				
				
				for (int i = 0; i < coseList.size(); i++) {
					int j = 0;
					int daycnt=0;
					for(j=0;j<coseList.size();j++){
						if(day.equals(coseList.get(j).getDay())){     //coseList에서 해당 day값만 가져올 수 있게 day의 개수를 구해  
							daycnt++;									//초기값인 num부터 daycnt까지 해당하는 정보 가져옴 
						}
					}
					if (!day.equals(coseList.get(i).getDay())) {		
				%>
				<tr class="tr" style ="font-size:15px; text-align:center;">
			
					<td><p><%=day%></p>		 <!-- coseList에 있는 day값 중복되지 않게 뿌려주기  -->
					<%
					Date cosedate=null;
					
					try{
						
						if(day.equals(coseList.get(i-1).getDay())){
							for(j=num;j<daycnt+num;j++){
								cosedate = coseList.get(j).getCose_date();		
							}
						}
						
					}catch(Exception e)
					{
						System.out.println(e.getMessage());
					}
					
					%>
					<p>(<%=cosedate %>)</p>
					</td>  		
						<td width="395px">
							<ul>		<!-- td안에 리스트를 뿌려 day에 관한 정보 다 가져옴  -->
								
								<%
								String starttime;
								String endtime;
								String place_name;
								String addr;
								String price;
								
								if(day.equals(coseList.get(i-1).getDay())){		//현재 day와 CoseList의 현재 인데스의 바로 전 day값이 
									int index=1;								// 일치할 때만 값을 뿌려주기 (한번만 뿌릴 수 있게 함 )		
								for (j=num;j<daycnt+num;j++) {
									place_name = coseList.get(j).getPlaceName();
									starttime = coseList.get(j).getStarttime();
									endtime = coseList.get(j).getEndtime();
								%>
								<li><%=index%>. (<%=starttime %>~<%=endtime %>) <%=place_name %></li>
									<%
									index++;
								}
								index=1;
								}
									%>
								
							</ul>
						</td>
						<td width="395px">
							<ul>
								<%
								if(day.equals(coseList.get(i-1).getDay())){
								for (j=num;j <daycnt+num;j++) {
									addr = coseList.get(j).getAddr();
								%>
								<li><%=addr %></li>
									<%
									
								}
								}
									%>
								
							</ul>
						</td>
						<td width="195px" align="right"><ul>
								<%
								if(day.equals(coseList.get(i-1).getDay())){
								for (j=num;j<daycnt+num;j++) {
									price = coseList.get(j).getPrice();
									int price_sum = Integer.parseInt(coseList.get(j).getPrice());
									total_price_sum = total_price_sum + price_sum;
								%>
								<li><%=price %> 원</li>
									<%
								System.out.println(j);
								
								}
								}
									%>
								
								
							</ul></td>
					<%
					num = num + daycnt; //day가 다음값으로 증가할 때 초기값인 num도 증
					day = coseList.get(i).getDay();
					}
			}
			%>
				</tr>
				<tr style ="font-style:bold; font-size:20px; text-align:center;"><td><p>총비용</p></td><td colspan="3" align="right"><%=total_price_sum %> 원</tr>

			</table>
		</form>
	</div>
<div class="detail_blank" style="height: 100px;">
	</div>
	<%@ include file="../footer.jsp"%>
