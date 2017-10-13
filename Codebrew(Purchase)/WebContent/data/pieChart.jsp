<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#chartdiv {
  width: 100%;
  height: 500px;
  font-size: 11px;
}

.amcharts-pie-slice {
  transform: scale(1);
  transform-origin: 50% 50%;
  transition-duration: 0.3s;
  transition: all .3s ease-out;
  -webkit-transition: all .3s ease-out;
  -moz-transition: all .3s ease-out;
  -o-transition: all .3s ease-out;
  cursor: pointer;
  box-shadow: 0 0 30px 0 #000;
}

.amcharts-pie-slice:hover {
  transform: scale(1.1);
  filter: url(#shadow);
}							
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>

	var chart = AmCharts.makeChart("chartdiv", {
		"type" : "pie", //타입은 파이
		"theme" : "light", //테마는 라이트
		"startDuration" : 1, //시작 애니메이션
		"addClassNames" : true,
		"legend" : {
			"position" : "right",
			"marginRight" : 100,
			"autoMargins" : false
		},
		"innerRadius" : "40%", //동그라미 안의 비율
		"defs" : {
			"filter" : [ {
				"id" : "shadow",
				"feBlend" : {
					"mode" : "normal"
				} 
			} ]
		}, 
		"dataProvider" : [ {
			"quarter" : "1분기",
			"price" : 1300000
		}, {
			"quarter" : "2분기",
			"price" : 50000
		}, {
			"quarter" : "3분기",
			"price" : 110000
		}, {
			"quarter" : "4분기",
			"price" : 330000
		}],
		"valueField" : "price",
		"titleField" : "quarter",
		"export" : {
			"enabled" : true
		}
	});
</script>

</head>
<body>

<!-- HTML -->
<div id="chartdiv"></div>				
</body>
</html>