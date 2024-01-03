<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/mbti_test.css" />
<script>
	function radioCheck() {

		if (document.frm.num1.value == "") {
			alert("1번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num2.value == "") {
			alert("2번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num3.value == "") {
			alert("3번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num4.value == "") {
			alert("4번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num5.value == "") {
			alert("5번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num6.value == "") {
			alert("6번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num7.value == "") {
			alert("7번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num8.value == "") {
			alert("8번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num9.value == "") {
			alert("9번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num10.value == "") {
			alert("10번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num11.value == "") {
			alert("11번 문제를 체크해주세요.");
			return false;
		}

		if (document.frm.num12.value == "") {
			alert("12번 문제를 체크해주세요.");
			return false;
		}

	}
</script>
<link rel="stylesheet" href="test.css" />
</head>
<body>
	<div class="container">
		<form action="mbtiResult.jsp" name="frm">
			<h1>간단한 MBTI 검사지</h1>
			<hr>
			<!-- I/E 검사 -->
			<div class="i_E">
				<b>1. 아무도 없는 집에 들어 가면 어때?</b><br> <input type="radio"
					name="num1" value="i">와~드디어 나만의 시간이다. 편하고 행복하다. <br> <input
					type="radio" name="num1" value="e">너무 외로워. 깜깜하고 너무 조용해.<br>
				<br>
			</div>
			<div class="i_E">
				<b>2. 취미 생활을 시작할 때 어떤 편이야?</b><br> <input type="radio"
					name="num2" value="i">혼자할 수 있는 취미생활을 즐김.<br> <input
					type="radio" name="num2" value="e">일단 동호회에 가입해서 많은 사람들과
				어울림.<br> <br>
			</div>
			<div class="i_E">
				<b>3. 친구랑 만나기로 했는데 갑자기 약속이 취소되었을 때</b><br> <input type="radio"
					name="num3" value="i">와~ 갑자기 혼자만의 시간이 생겼쟎아. 뭐하지? 신나~~<br>
				<input type="radio" name="num3" value="e">앗! 이럴수가 그럼... 누굴
				만날까? 전화해봐야지.<br> <br>
			</div>
			<!-- N/S 검사 -->
			<div class="i_E">
				<b>4. 사과 하면 뭐가 생각나?</b><br> <input type="radio" name="num4"
					value="n">백설공주, 애플 , 뉴턴, 아침사과 금사과 (관련된 이야기나 생각)<br> <input
					type="radio" name="num4" value="s">빨갛다, 과일, 맛있다 (색깔,맛등 객관적
				사실)<br> <br>
			</div>
			<div class="i_E">
				<b>5. 비행기 타기 전에 무슨 생각해?</b><br> <input type="radio" name="num5"
					value="n">비행기가 추락하면 어쩌지. 비상구 자리에 앉을까? (상상력 풍부)<br> <input
					type="radio" name="num5" value="s">기내식 뭐 나오지? 영화볼까? (현실에
				관련된 생각)<br> <br>
			</div>
			<div class="i_E">
				<b>6. 노래들을 때 뭐가 중요해?</b><br> <input type="radio" name="num6"
					value="n">가사가 너무 중요해~ 가사까지 맘에 들어야 최애곡!<br> <input
					type="radio" name="num6" value="s">노래는 멜로디지~~흥얼흥얼 가사가 뭐가
				중요해 음악은 Feel이쥐!<br> <br>
			</div>
			<!-- T/F 검사 -->
			<div class="i_E">
				<b>7. 친구가 교통사고가 났을 때</b><br> <input type="radio" name="num7"
					value="f">어머! 많이 다쳤어? 괜찮아? (공감과 걱정 먼저)<br> <input
					type="radio" name="num7" value="t">보험은 들어놨어? 누구 과실이야? (해결방안
				제시)<br> <br>
			</div>
			<div class="i_E">
				<b>8. 나 우울해서 미용실 갔다왔어.</b><br> <input type="radio" name="num8"
					value="f">왜 우울해? 무슨일 있었어?<br> <input type="radio"
					name="num8" value="t">펌했어? 염색? 사진찍어 보내봐.<br> <br>
			</div>
			<div class="i_E">
				<b>9. 차에 뭐 놓고왔네 어쩌지?</b><br> <input type="radio" name="num9"
					value="f">같이가자! 혼자가면 외로워.<br> <input type="radio"
					name="num9" value="t">나 혼자 다녀올게! 너 할거 하고있어.<br> <br>
			</div>
			<!-- J/P 검사 -->
			<div class="i_E">
				<b>10. 요리할 때</b><br> <input type="radio" name="num10" value="j">레시피랑
				계량대로 잘 만드는게 중요함.<br> <input type="radio" name="num10" value="p">음식은
				손맛이쥐. 감으로 하는겨~<br> <br>
			</div>
			<div class="i_E">
				<b>11. 여행은 어떻게 할까?</b><br> <input type="radio" name="num11"
					value="j">몇시에 출발해서 어디서 밥먹고 어디 들려서 이렇게 놀자! (계획 철저)<br>
				<input type="radio" name="num11" value="p">응? 응 좋아. 그러자. 동의!
				( J형의 좋은 여행메이트)<br> <br>
			</div>
			<div class="i_E">
				<b>12. 카카오톡으로 확인해 보기</b><br> <input type="radio" name="num12"
					value="j">읽지 않은 알람이 하나도 없다.<br> <input type="radio"
					name="num12" value="p">읽지 않은 알람이 ...... 매우 많다.<br> <br>
			</div>
			<div class="mbti_set">
				<input type="submit" value="제출" onclick="return radioCheck()">
			</div>
		</form>
	</div>
</body>
</html>