<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>RootFinder(로그인전)</title>
<link rel="stylesheet" href="./css/mainpage.css" />
<!-- <link rel="stylesheet" href="./css/header.css" /> -->
<script>
function msg()
{
	alert("로그인을 하셔야 이용할 수 있습니다.");
}



function searchLocal()
{
	
	const search = document.getElementById('search').value;
	
	if(event.keyCode == 13){ 
		
		location.href="RootFinderServlet?command=local_search_view&search="+search;
				
	}	
	
	
	
}

function MapOpen() {
    window.open("koreaMap.jsp","koreaMap","width=1000, height=900");
}

</script>
</head>
<body>


	<!-- <header>
		
	</header> -->
	
	
	<%@ include file="../header.jsp" %>
	<main>
		<section id="harmony">
			<div class="section-content">
				<picture>
					<img src="./images/harmony.jpg" />
				</picture>
				<div class="text">
					<h2 data-motion="text">나만의 여행 플래너 루트파인더!</h2>
					<div class="description">
						<p data-motion="text" data-delay="500">쉽고 빠르게 여행을 계획하세요.</p>
						<div class="description_text">
							<input type="text" id="search" name="search" placeholder="국가명,도시명으로 검색"  
										onkeypress="searchLocal(${search})">							
							
							<div class="last_search">
								<p>추천 도시 :&nbsp;<a href="#">강릉</a>&nbsp;,&nbsp;<a href="#">부산</a>&nbsp;,&nbsp;<a
										href="#">속초</a>&nbsp;</p>
							</div>
							<div class="map">
								<a href="#" onclick="MapOpen()">
									<p>지도에서 보기</p>
									<img src="./image/map.png">
								</a>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div class="clear"></div>

		<div class="one_page">
		<section id="trip">
			<div class="mbti">
				<div class="text">
					<h3>MBTI</h3>
				</div>
				<div class="sub_text">
					mbti별 인기쟁이 여행지예요!!
				</div>
				 <div class="deactivation" style="opacity: 0.8; position: absolute; top:400px; left: 300px; color:red;">
               <h2 style="font-size: 32px;text-align: center;">회원만 사용할 수 있는 기능입니다!</h2>
            </div>
				
				<%for(int i=0; i<5; i++){ %>
				<div class="picture" style="opacity: 0.2">
					<a href="#" class="box">
						<div class="inner">
							<div class="inner_text">
								<span>2023-03-01</span>
								<span class="tourday">5Days</span><br>
								"따뜻한날 제주도에서 드라이브 너무 좋아요"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>부모님과 함께</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">제주도,서귀포시</div>

							<div class="clear"></div>

							<div class="list_user">pro_traveler</div>
						</div>
					</a>
				</div>
				<%} %>

				<div class="picture" style="opacity: 0.2">
					<a href="#" class="box">
						<div class="inner">
							<div class="inner_text">
								<span>2023-03-01</span>
								<span class="tourday">5Days</span><br>
								"따뜻한날 제주도에서 드라이브 너무 좋아요"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>부모님과 함께</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">제주도,서귀포시</div>

							<div class="clear"></div>

							<div class="list_user">pro_traveler</div>
						</div>
					</a>

					<div class="more_button">
						<a href="#"><input type="button" id="more_if" name="more_if" value="추천일정 더보기"style='cursor:pointer;'></a>
					</div>
				</div>
		</section>
	</div>
	
	
	<div class="two_page">
		<section id="trip">
			<div class="mbti">
				<div class="text">
					<h3>AGE</h3>
				</div>
				<div class="sub_text">
					나이별 인기쟁이 여행지예요!!
				</div>
				<div class="deactivation" style="opacity: 0.8; position: absolute; top:400px; left: 300px; color:red;">
               <h2 style="font-size: 32px;text-align: center;">회원만 사용할 수 있는 기능입니다!</h2>
            	</div>
				
				
				<%for(int i=0; i<5; i++) { %>
				<div class="picture" style="opacity: 0.2">
					<a href="#" class="box">
						<div class="inner">
							<div class="inner_text">
								<span>2023-03-01</span>
								<span class="tourday">5Days</span><br>
								"따뜻한날 제주도에서 드라이브 너무 좋아요"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>부모님과 함께</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">제주도,서귀포시</div>

							<div class="clear"></div>

							<div class="list_user">pro_traveler</div>
						</div>
					</a>
				</div>
				<%} %>
				<div class="picture" style="opacity: 0.2">
					<a href="#" class="box">
						<div class="inner">
							<div class="inner_text">
								<span>2023-03-01</span>
								<span class="tourday">5Days</span><br>
								"따뜻한날 제주도에서 드라이브 너무 좋아요"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>부모님과 함께</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">제주도,서귀포시</div>

							<div class="clear"></div>

							<div class="list_user">pro_traveler</div>
						</div>
					</a>

					<div class="more_button">
						<a href="#"><input type="button" id="more_if" name="more_if" value="추천일정 더보기"style='cursor:pointer;'></a>
					</div>
				</div>
		</section>
	</div>
	
	</main>
	<%@include file="../footer.jsp" %>
</body>
</html>