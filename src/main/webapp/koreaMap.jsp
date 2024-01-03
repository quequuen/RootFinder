<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 위치 표시</title>
</head>

<style>

*{
	margin: 0;
	padding: 0;
}
</style>
<body>
<div>
	<h1 style="text-align: center; margin:10px;">지도에서 보기</h1><hr>
</div>
<div id="map" style=" position: absolute; width:100%;height:100%;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61b8592f181ebbf9202a63811221a769&libraries=services"></script>

<script>
var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(36.5, 127.5),
        level: 13
    };

var map = new kakao.maps.Map(mapContainer, mapOption);
var geocoder = new kakao.maps.services.Geocoder();

// JSP에서 생성한 ArrayList를 JavaScript 배열로 변환
var locations = [
    <%
    ArrayList<String> addressList = new ArrayList<String>();
    CoseDAO cdao = CoseDAO.getInstance();
    ArrayList<CoseListDTO> all_cose_list = cdao.allCoseList();
    for(CoseListDTO c : all_cose_list)
    {
        addressList.add(c.getMain_addr());
    }
    
    for (CoseListDTO c : all_cose_list) {
        out.print("{");
        out.print("address: '" + c.getMain_addr() + "',");
        out.print("title: '" + c.getTitle() + "',");
        out.print("code: '" + c.getCode() + "',");
        out.print("main_img: '"+c.getMain_img()+"'");
        out.print("},");
    }
    %>
];

// 주소 목록을 순회하며 각 주소에 대한 좌표를 찾고 마커로 표시
for (var i = 0; i < locations.length; i++) {
    (function(location) {
        geocoder.addressSearch(location.address, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
                
                var infowindow = new kakao.maps.InfoWindow({
                 	content: '<div style="width:150px;text-align:center;padding:6px 0;"><img style=" margin: 0; width:100%; height:50px;" src="./image/'+location.main_img
                 	+'"><br>'+
                 	'<a href="#" onClick="mapClick(\''+location.code+'\',\'${loginUser.id}\')">'+location.title
                 	+'</div>'
                });
                infowindow.open(map, marker);
            }
        });
    })(locations[i]);
}
</script>

<script>

function mapClick(code,id)
{
   	
    opener.location.href='RootFinderServlet?command=root_summary_form&type=first_click&code='+code+'&id='+id;
    window.close();
}

</script>
</body>
</html>
