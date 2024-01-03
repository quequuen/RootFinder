<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty loginUser}">
  <script>alert("해당 계정이 존재하지 않습니다.")</script>
  <input type="hidden" name="command" value="login_view">
  <jsp:forward page="RootFinderServlet"></jsp:forward>
  </c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 등록</title>
<script type="text/javascript" src="script/RootFinder.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
            	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
            }
        }).open();
    }
</script>
		

<meta charset="EUC-KR">
<%
int lastday = (int)session.getAttribute("lastday");        // 세션에서 day 받아오기.
String title = (String)session.getAttribute("title");
%>
<title>여행 일정 설명</title>
</head>
<body>
	<form action="RootFinderServlet?command=root_insert" method="post" name="frm" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${loginUser.id}">
		<input type="hidden" name="pwd" value="${loginUser.pwd}">
		
		코스를 대표할 이미지를 등록해 주세요! <input type="file" name="main_img">
		<br>
		코스의 대표 주소를 입력해 주세요!<input type="text" id="sample6_address" name="main_addr" placeholder="주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
		<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
		
		<br>
		<h2><%=lastday%>일 간의 여행 어떠셨나요? 일정에 대한 자세한 설명을 적어주세요</h2>
		<hr>
		<textarea name="content" rows="20" cols="80"></textarea>
		<input type="submit" value="일정 등록!">
	</form>
</body>
</html>