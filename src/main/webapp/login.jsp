<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css" />
<script type="text/javascript" src="script/RootFinder.js"></script>
</head>

<body>
	<%
		try{
			String result = (String)request.getAttribute("logincheck");
			System.out.println("result : "+result);
			if(result.equals("no")){
	%>
	<script>alert("해당 계정이 존재하지 않습니다.")</script>
	<%
			} else if(result.equals("nopwd"))
			{
			%>
	<script>alert("비밀번호가 일치하지 않습니다.")</script>
			
			<%			
				}
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
	%>
	<div class="login_main">
        <form action="RootFinderServlet" method="post" name="frm" class="form1">
        <input type="hidden" name="command" value="login_do">
        <input type="hidden" name="code" value="${param.code }">

        <input type="hidden" name="where" value="${param.where }"> 
        
            <div id="login">
			    <div id="login_header">
				    <div class="loginlb">
					    <h3>로그인</h3>
				    </div>
			    </div>
			    <div class="form">
			        <div class="input">
				        <table class="table">
				            <tr class="id_pass">
				                <td width="110" height="50">아이디</td>
				                <td><input type="text" class="input1" name="id" size="20"></td>
				            </tr>
                            <tr class="id_pass">
				                <td width="110" height="50">비밀번호</td>
				                <td><input type="password"class="input1" name="pwd" size="20"></td>
                            </tr>
                        </table>
				    </div>
				    <div class="forgot">
                        <a href="#" class="link">Forgot your password?</a>
                    </div>
				    <div class="btn">
			            <input type="submit" value="로그인" onclick="return loginCheck()"/>
			        </div>
                </div> 
		    </div>
            <div class="joinlb">
                <div class="position">
                    <div class="center">
                        <input type="button" value="회원가입" onclick="location.href='RootFinderServlet?command=join_view'"/>
                    </div>
                </div>
            </div>
	    </form>
    </div>
</body>
</html>