<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>


<head>
<style>
.container .membership .mbticheck{
	border:none;
	background-color:#fff;
	color:red;
}

.container .membership .mbticheck:hover{
	color:blue;
}

</style>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="script/RootFinder.js"></script>
<link rel="stylesheet" href="./css/join.css" />
</head>
<body>
	<div>
		<div class="container">
			<div class="membership">
				<h2>회원가입</h2>
				<p>'*' 표시 항목은 필수 입력 항목입니다.</p>
				<form action="RootFinderServlet" method="post" name="frm">
				<input type="hidden" name="command" value="join_do">
					<table>

						<tr>
							<td>아이디</td>
							<td><input type="text" name="userid" class="text_box"
								size="20"> * <input type="hidden" name="reid" size="20">
								<input type="button" class="overlap" value="중복체크"
								onclick="idCheck()"></td>
						</tr>
						<tr>
							<td>사용자명</td>
							<td><input type="text" name="name" class="text_box"
								size="20"> <input type="hidden" name="reid2" size="20">
								* <input type="button" class="overlap" value="중복체크"
								onclick="nicknameCheck()"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" class="text_box"
								size="20"> *</td>
						</tr>
						<tr height="30">
							<td width="80">비밀번호 확인</td>
							<td><input type="password" name="pwd_check" class="text_box"
								size="20"></td>
						</tr>
						<tr class="birth_container">
							<td class="birth1">주민등록번호</td>
							<td><input type="text" class="birth" name="userNum_front"
								style="width: 60px"> - <input type="text" class="birth2"
								name="userNum_back" style="width: 10px">******</td>
						</tr>

						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" size="20"
								class="text_box"></td>
						</tr>
						<tr>
							<td>MBTI :</td>
							<td><input type="text" class="mbti_text" id="mbtitext"
								name="mbtiresult" readonly> <select name="mbti"
								id="mbti1" class="mbti_choose"
								onchange="selectMBTIBox(this.value)">
									<option>선택</option>
									<option value="ISTJ">ISTJ</option>
									<option value="ISFJ">ISFJ</option>
									<option value="INFJ">INFJ</option>
									<option value="ISTJ">INTJ</option>
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
							</select> <input type="button" onclick="mbtiCheck()" class="mbticheck" value="MBTI를 모를경우 클릭" ></td>
						</tr>
						<tr>
							<td>전화 번호</td>
							<td><input type="text" name="phone" class="text_box"
								size="20"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								class="login_button" value="확인"  onclick="return joinCheck()">
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
								class="login_button" value="취소"></td>
						</tr>
						<tr>
							<td colspan="2">${message }</td>
						</tr>
					</table>

				</form>
			</div>
		</div>
	</div>
</body>
</html>