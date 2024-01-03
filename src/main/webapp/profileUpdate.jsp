<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.RootFinder.dto.UserDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty loginUser}">
	<script>
		alert("해당 계정이 존재하지 않습니다.")
	</script>
	<input type="hidden" name="command" value="login_do">
	<jsp:forward page="RootFinderServlet"></jsp:forward>
</c:if>
<!DOCTYPE html>
<html>
<!-- 아이디, 나이, 성별 제외 전부 변경 가능 -->

<!-- ↓ 회원가입 필수 항목 ↓ -->
<!-- 아이디, 닉네임, 비밀번호 -->
<head>
<style>

.container .membership .mbticheck {
	border: none;
	background-color: #fff;
	color: red;
}

.container .membership .mbticheck:hover {
	color: blue;
}

.text_box {
	padding: 0px;
	border: 1px solid black;
	border-bottom: 1px solid #CFCFCF;
	width: 306px;
	height: 30px;
}

.mbti_choose {
	width: 100px;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-style: normal;
	font-weight: 200;
	font-size: 14px;
	line-height: 16px;
}

.mbti_text {
	padding: 0px;
	border: 1px solid black;
	border-bottom: 1px solid #CFCFCF;
	min-width: 120px;
	height: 30px;
}

#id, #age, #gender {
	color: #999999;
}

.overlap {
    background-color: white;
    border: 0.5px solid black;
}

.update_button{
    width: 100px;
    height: 50px;
    left: 725px;
    top: 875px;
    margin-top: 10px;
    background-color: #FFFFFF;
    color: black;
    border-radius: 8px;
    border: black solid 1px;
}
</style>
<%@ include file="../header.jsp" %>  
<%@ include file="myMenu.jsp" %> 
<meta charset="UTF-8">
<title>프로필 수정</title>
<script type="text/javascript" src="script/RootFinder.js"></script>
</head>
<body>

	
		<div class="container">
			<div class="membership">
				<h2>프로필 수정</h2>
				<p>'*' 표시 항목은 필수 입력 항목이며, 활성화된 항목만 변경 가능힙니다.</p>
				<form action="RootFinderServlet" method="post" name="frm">
					<input type="hidden" name="command" value="profile_update">
					<input type="hidden" name="pwd" value="${loginUser.pwd }">
					<input type="hidden" name="profile_img" value="${loginUser.profile_img}">
					<table>
						<tr>
							<td>아이디:</td>
							<td><input type="text" id="id" name="userid"
								class="text_box" size="20" value="${loginUser.id }" readonly>
							</td>
						</tr>
						<tr>
							<td>사용자명:</td>
							<td><input type="text" name="name" class="text_box"
								size="20" value="${loginUser.username }" required="required"
								placeholder="필수 입력"> * <input type="hidden"
								name="reid2" size="20"> <input type="button"
								class="overlap" value="중복체크" onclick="nicknameCheck()"></td>
						</tr>
						<tr>
							<td>기존 비밀번호:</td>
							<td><input type="password" name="oldPwd" class="text_box"
								size="20" required="required" placeholder="필수 입력"> *</td>
						</tr>
						<tr>
							<td>새 비밀번호:</td>
							<td><input type="password" name="newPwd1" class="text_box"
								size="20" placeholder="변경 시에만 입력"></td>
						</tr>
						<tr>
							<td>새 비밀번호 확인:</td>
							<td><input type="password" name="newPwd2" class="text_box"
								size="20" placeholder="변경 시에만 입력"></td>
						</tr>
						<tr>
							<td>나이:</td>
							<td><input type="text" class="text_box" id="age" name="age"
								style="width: 60px" value="${loginUser.birth }" readonly></td>
						</tr>
						<tr>
							<td>성별:</td>
							<td><input type="text" class="text_box" id="gender"
								name="gender" style="width: 60px" value="${loginUser.gender }"
								readonly></td>
						</tr>
						<tr>
							<td>이메일:</td>
							<td><input type="text" name="email" size="20"
								class="text_box" placeholder="예) rootfinder@gmail.com" 
								value="${loginUser.email }"></td>
						</tr>
						<tr>
							<td>MBTI :</td>
							<td><input type="text" class="mbti_text" id="mbtitext"
								name="mbtiresult" value="${loginUser.mbti }" > <select
								name="mbti" id="mbti1" class="mbti_choose"
								onchange="selectMBTIBox(this.value)">
									<option>선택</option>
									<option value="ISTJ">ISTJ</option>
									<option value="ISFJ">ISFJ</option>
									<option value="INFJ">INFJ</option>
									<option value="INTJ">INTJ</option>
									<option value="ISTP">ISTP</option>
									<option value="ISFP">ISFP</option>
									<option value="INFP">INFP</option>
									<option value="INTP">INTP</option>
									<option value="ESTP">ESTP</option>
									<option value="ENFP">ENFP</option>
									<option value="ESFP">ESFP</option>
									<option value="ENTP">ENTP</option>
									<option value="ESTJ">ESTJ</option>
									<option value="ESFJ">ESFJ</option>
									<option value="ENFJ">ENFJ</option>
									<option value="ENTJ">ENTJ</option>
							</select> <input type="button" onclick="mbtiCheck()" class="mbticheck"
								value="MBTI를 모를경우 클릭"></td>
						</tr>
						<tr>
							<!-- https://moo-you.tistory.com/439 -->
							<!-- https://gurtn.tistory.com/86 -->
							<td>전화번호:</td>
							<td><input type="text" name="phone" class="text_box"
								size="20" value="${loginUser.phone }"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								class="update_button" value="변경" onclick="return updateCheck()">
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
								class="update_button" value="취소"></td>
						</tr>
						<br>
						<tr>
							<td colspan="2">${message }</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
</body>
<%@ include file="../footer.jsp" %>
</html>