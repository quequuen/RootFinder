<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>RootFinder(�α�����)</title>
<link rel="stylesheet" href="./css/mainpage.css" />
<!-- <link rel="stylesheet" href="./css/header.css" /> -->
<script>
function msg()
{
	alert("�α����� �ϼž� �̿��� �� �ֽ��ϴ�.");
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
					<h2 data-motion="text">������ ���� �÷��� ��Ʈ���δ�!</h2>
					<div class="description">
						<p data-motion="text" data-delay="500">���� ������ ������ ��ȹ�ϼ���.</p>
						<div class="description_text">
							<input type="text" id="search" name="search" placeholder="������,���ø����� �˻�"  
										onkeypress="searchLocal(${search})">							
							
							<div class="last_search">
								<p>��õ ���� :&nbsp;<a href="#">����</a>&nbsp;,&nbsp;<a href="#">�λ�</a>&nbsp;,&nbsp;<a
										href="#">����</a>&nbsp;</p>
							</div>
							<div class="map">
								<a href="#" onclick="MapOpen()">
									<p>�������� ����</p>
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
					mbti�� �α����� ����������!!
				</div>
				 <div class="deactivation" style="opacity: 0.8; position: absolute; top:400px; left: 300px; color:red;">
               <h2 style="font-size: 32px;text-align: center;">ȸ���� ����� �� �ִ� ����Դϴ�!</h2>
            </div>
				
				<%for(int i=0; i<5; i++){ %>
				<div class="picture" style="opacity: 0.2">
					<a href="#" class="box">
						<div class="inner">
							<div class="inner_text">
								<span>2023-03-01</span>
								<span class="tourday">5Days</span><br>
								"�����ѳ� ���ֵ����� ����̺� �ʹ� ���ƿ�"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>�θ�԰� �Բ�</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">���ֵ�,��������</div>

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
								"�����ѳ� ���ֵ����� ����̺� �ʹ� ���ƿ�"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>�θ�԰� �Բ�</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">���ֵ�,��������</div>

							<div class="clear"></div>

							<div class="list_user">pro_traveler</div>
						</div>
					</a>

					<div class="more_button">
						<a href="#"><input type="button" id="more_if" name="more_if" value="��õ���� ������"style='cursor:pointer;'></a>
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
					���̺� �α����� ����������!!
				</div>
				<div class="deactivation" style="opacity: 0.8; position: absolute; top:400px; left: 300px; color:red;">
               <h2 style="font-size: 32px;text-align: center;">ȸ���� ����� �� �ִ� ����Դϴ�!</h2>
            	</div>
				
				
				<%for(int i=0; i<5; i++) { %>
				<div class="picture" style="opacity: 0.2">
					<a href="#" class="box">
						<div class="inner">
							<div class="inner_text">
								<span>2023-03-01</span>
								<span class="tourday">5Days</span><br>
								"�����ѳ� ���ֵ����� ����̺� �ʹ� ���ƿ�"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>�θ�԰� �Բ�</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">���ֵ�,��������</div>

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
								"�����ѳ� ���ֵ����� ����̺� �ʹ� ���ƿ�"
							</div>
						</div>
						<div class="trip_picture">
							<img src="./image/trip1.jpg">
						</div>
						<div class="trip_inner">
							<span>�θ�԰� �Բ�</span>
							<div class="fr list_copy_icon">120</div>
							<div class="fr list_view_icon">2909</div>
							<div class="fr list_spot_icon">67</div>
							
							<div class="clear"></div>

							<div class="list_city">���ֵ�,��������</div>

							<div class="clear"></div>

							<div class="list_user">pro_traveler</div>
						</div>
					</a>

					<div class="more_button">
						<a href="#"><input type="button" id="more_if" name="more_if" value="��õ���� ������"style='cursor:pointer;'></a>
					</div>
				</div>
		</section>
	</div>
	
	</main>
	<%@include file="../footer.jsp" %>
</body>
</html>