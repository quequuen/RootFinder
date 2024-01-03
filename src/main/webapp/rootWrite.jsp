<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<style>
div {
   width: 100%;
   height: 100%;
   border: 1px solid #003458;
}

div.left {
   width: 30%;
   height: 100%;
   float: left;
   box-sizing: border-box;
   background: #8977ad;
}

div.right {
   width: 70%;
   height: 30%;
   float: right;
   box-sizing: border-box;
   background: #ece6cc;
}

.button-container {
   text-align: center;
   margin-top: 20px; /* Adjust the margin-top as needed for spacing */
   padding-bottom: 20px; /* Adjust padding as needed for spacing */
   clear: both; /* Clear any floats within the container */
}
</style>
<script type="text/javascript" src="script/RootFinder.js"></script>
<script>
   var cloneCount = 1; // 복제된 테이블 개수를 저장하는 변수

   function cloneTable() {
      // 원본 테이블 요소를 가져옵니다.
      var originalTable = document.getElementById("originalTable");
      // 테이블을 복제합니다.
      var clonedTable = originalTable.cloneNode(true);
      // 복제된 테이블의 id 값을 설정합니다.
      clonedTable.id = "clonedTable_" + cloneCount;

      // 복제된 테이블 내부의 모든 input 요소를 가져옵니다.
      var inputElements = clonedTable.querySelectorAll('input');
      inputElements.forEach(function(input) {
         input.value = ""; // value를 빈 문자열로 설정
         var currentName = input.getAttribute('name');
         if (currentName) {
            // 현재 name 속성 값을 가져옵니다.
            // 예: img_1, place_1, addr_1, price_1, ...
            var nameParts = currentName.split('_');
            var baseName = nameParts[0]; // name의 기본 부분 (img, place, addr, price 등)
            var index = cloneCount + 1; // 현재 복제된 테이블 수에 1을 더해 인덱스 설정
            
            // 새로운 name 값을 설정합니다.
            input.setAttribute('name', baseName + '_' + index);
         }
      });


      // 복제된 테이블을 새로운 위치에 추가합니다.
      document.getElementById("tableContainer").appendChild(clonedTable);
      var buttonContainer = document.querySelector(".button-container");
      buttonContainer.parentNode.removeChild(buttonContainer); // 버튼을 현재 위치에서 제거합니다.
      clonedTable.parentNode.appendChild(buttonContainer); // 버튼을 새로 생성된 테이블 아래로 추가합니다.
      
      cloneCount++; // 복제된 테이블 개수를 증가시킵니다.
      document.getElementById("lasttable").value = cloneCount;
   }

   function resetPage() {
      // 복제된 테이블 컨테이너를 가져옵니다.
      var tableContainer = document.getElementById("tableContainer");

      // 모든 clonedTable을 찾습니다.
      var clonedTables = tableContainer
            .querySelectorAll("[id^='clonedTable_']");

      // 복제된 테이블을 제거합니다.
      clonedTables.forEach(function(clonedTable) {
         tableContainer.removeChild(clonedTable);
      });

      cloneCount = 1; // 복제된 테이블 개수 초기화
      document.getElementById("lasttable").value = cloneCount;
   }
   function resetPage() {
      // 복제된 테이블 컨테이너를 가져옵니다.
      var tableContainer = document.getElementById("tableContainer");

      // 모든 clonedTable을 찾습니다.
      var clonedTables = tableContainer
            .querySelectorAll("table[id='clonedTable']");

      // 복제된 테이블을 제거합니다.
      clonedTables.forEach(function(clonedTable) {
         tableContainer.removeChild(clonedTable);
      });
   }
</script>
<%

int day = (int)session.getAttribute("day");                        // 세션에서 day 받아오기
int lastday = (int)session.getAttribute("lastday");        // 세션에서 day 받아오기.
String title = (String)session.getAttribute("title");
%>
</head>
<body>

   <div id="wrap" align="center">
      <h1>코스 등록</h1>
      <form action="RootFinderServlet?command=root_write" method="post" name="frm" enctype="multipart/form-data">
         <input type="hidden" name="id" id="userid" value="${loginUser.id}"> <!-- value를 후에 받아올 값으로 변경 완성되면 바꿀것 -->
         <input type="hidden" name="lasttable" id="lasttable" value="1">
         <input type="hidden" name="title" id="title" value="<%=title%>">
         <input type="hidden" name="lastday" id="title" value="<%=lastday%>">
         <input type="hidden" name="day" id="title" value="<%=day%>">
         <h2>Day<%=day%></h2>
         
         <div>
            <div class="left">
               <c:forEach var="i" begin="1" end="<%=lastday%>"><!-- lastday를 후에 받아온값으로 변경 -->
                  <h2>
                     Day
                     <c:out value="${i}" />
                  </h2>
               </c:forEach>
            </div>
            <div class="right" id="tableContainer">
               <table id="originalTable">
                  <tr>
                     <td><input type="file" name="img_1" accept="image/*"
                        placeholder="이미지 업로드" onchange="imageChange(this);"></td>
                     <td>
                        <table>
                           <tr>
                              <th>장소명</th>
                              <td><input type="text" name="place_1" id="place_1"
                                 size="80"></td>
                           </tr>
                           <tr>
                              <th>상세 주소</th>
                              <td><input type="text" name="addr_1" size="80"></td>
                           </tr>
                           <tr>
                              <th>경비</th>
                              <td><input type="text" name="price_1" size="80"></td>
                           </tr>
                           <tr>
                              <th>시간</th>
                              <td><input type="text" name="starttime_1" size="5">:
                                 <input type="text" name="starttimemin_1" size="5">~ <input
                                 type="text" name="endtime_1" size="5">: <input
                                 type="text" name="endtimemin_1" size="5"></td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
               <div class="button-container">
                  <input type="button" id="nextButton" value="다음"
                     onclick="cloneTable();"><br> <br> <br>

                  <!-- 다음 테이블 추가 -->
                  <input type="submit" value="등록" > 
                  <input type="reset" value="다시 작성" onclick="resetPage()"> <!-- 복제된 테이블 까지 제거 -->
               </div>
            </div>
         </div>
      </form>
   </div>
</body>
</html>
