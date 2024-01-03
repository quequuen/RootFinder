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
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        $( "#startDate" ).datepicker({
            changeMonth: true, 
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달', 
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dateFormat: "yy-mm-dd",
            maxDate: 999, // 선택할 수 있는 최소 날짜 (0: 오늘 이후 날짜 선택 불가)
            onClose: function( selectedDate ) {    
                // 시작일(startDate) datepicker가 닫힐 때
                // 선택한 날짜로 시작일의 value 값을 변경
                $("#startDate").val(selectedDate);
                // 종료일(endDate)의 선택할 수 있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#endDate").datepicker( "option", "minDate", selectedDate );
            }    
        });
        
        $( "#endDate" ).datepicker({
            changeMonth: true, 
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달', 
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dateFormat: "yy-mm-dd",
            maxDate: 999, // 선택할 수 있는 최대 날짜 (0: 오늘 이후 날짜 선택 불가)
            onClose: function( selectedDate ) {    
                // 종료일(endDate) datepicker가 닫힐 때
                // 선택한 날짜로 종료일의 value 값을 변경
                $("#endDate").val(selectedDate);
                // 시작일(startDate)의 선택할 수 있는 최대 날짜(maxDate)를 선택한 종료일로 지정
                $("#startDate").datepicker( "option", "maxDate", selectedDate );
            }    
        });    
    });
</script>
</head>
<body>
<div id="wrap" align="center">
    <h2>코스 등록 일정!</h2>
    <form action="RootFinderServlet?command=root_write_form" method="post" name="frm">
        <div id="wrap" align="center">
            <input type="hidden" name="id" value="${loginUser.id}">
            <input type="text" name="title" value="" placeholder="코스 제목" size="60"><br>
            <!-- startDate 입력란을 text로 변경하고 선택한 날짜를 입력란에 표시 -->
            <input type="text" id="startDate" name="startDate" value="" placeholder="출발일">
            <!-- endDate 입력란을 text로 변경하고 선택한 날짜를 입력란에 표시 -->
            <input type="text" id="endDate" name="endDate" value="" placeholder="복귀일">
            <input type="submit" value="코스 등록 폼으로">
        </div>
    </form>
</div>
</body>
</html>