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
<head>
<meta charset="UTF-8">
<title>프로필 사진 변경</title>
</head>
<body>
	<div class="container">
		<!-- d-flex: 안에 있는 div들이 block에서 inline 속성으로 바뀜 -->
		<div class="d-flex justify-content-center">
			<form action="RootFinderServlet?command=profileUploadProc"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
					<img id="img_wrap"
						onerror="this.src='./image/default_profile_image.jpg'"
						src="image/${loginUser.profile_img}"
						 width="200px"
						height="200px" /> 
						
					
				</div>

				<!-- form이 이 사이에 여백을 만들어줌 -->
				<div class="form-group bg-light">
					<!-- 언더바(_) 라이브러리 -->
					<input type="file" name="profile_img" id="image_preview" />
				</div>

				<input type="hidden" name="id" value="${loginUser.id}" />
				<div class="form-group">
<!-- 					<button class="btn btn-primary w-100">업로드</button>
 -->				
 				<input type="submit" value="변경">
 </div>
			</form>
		</div>
	</div>
	<script src="script/imgPreview.js"></script>
</body>
</html>