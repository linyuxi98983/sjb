<html>
<head>
	    <#include "/WEB-INF/ftl/mobile/header.ftl"/>
        <@header "地图-触屏版"/>
	    <script src="${base}/resources/mobile/js/zepto.min.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/zepto.lazyload.min.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/common.min.js" type="text/javascript"></script>
	    <script src="${base}/resources/mobile/js/util.js" type="text/javascript"></script>
	<style type="text/css">
		body, html {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#l-map{height:300px;width:100%;}
		#r-result,#r-result table{width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=0306c6f0808b417da0a36010406463ec"></script>
</head>
<body>
	<div id="l-map"></div>
	<div id="r-result"></div>
</body>
</html>
<script type="text/javascript">
	var map = new BMap.Map("l-map");
	map.centerAndZoom(new BMap.Point(116.331398,39.897445), 12);
	
	var lat = '${lat}';
	var lng = '${lng}';
	//var point = new BMap.Point(113.318,23.024);
    var point = new BMap.Point(lat,lng);
	var geoc = new BMap.Geocoder();    

	/*var pt =point;
	geoc.getLocation(pt, function(rs){
		var addComp = rs.addressComponents;
		alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
	});   */
	var transit = new BMap.DrivingRoute(map, {
		renderOptions: {
			map: map,
			panel: "r-result",
			enableDragging : true //起终点可进行拖拽
		}
	});

	geoc.getLocation(pt, function(rs){
		var addComp = rs.addressComponents;
		alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
	});
function getLocation()
  {
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }
  else{showError("Geolocation is not supported by this browser.");}
  }
function showPosition(position)
  { 
  transit.search(new BMap.Point(position.coords.latitude,position.coords.longitude);,point);
  }
	//transit.search("广州天河黄埔大道100号",point);
</script>
