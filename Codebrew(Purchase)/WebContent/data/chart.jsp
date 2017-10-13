<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style type="text/css">
	#chartDiv {
		width : 100%;
		height : 500px;
	}
</style>
<!-- Chart code -->
<script type="text/javascript">
AmCharts.addInitHandler(function(chart) {
	  //check if legend is enabled and custom generateFromData property
	  //is set before running
	  if (!chart.legend || !chart.legend.enabled || !chart.legend.generateFromData) {
	    return;
	  }
	  
	  var categoryField = chart.categoryField;
	  var colorField = chart.graphs[0].lineColorField || chart.graphs[0].fillColorsField;
	  var legendData =  chart.dataProvider.map(function(data) {
	    var markerData = {
	      "title": data[categoryField] + ": " + data[chart.graphs[0].valueField]+"¿ø", 
	      "color": data[colorField]
	    };
	    if (!markerData.color) {
	      markerData.color = chart.graphs[0].lineColor;
	    }
	    return markerData;
	  });
	  
	  chart.legend.data = legendData;
	  
	}, ["serial"]);
	
var chart = AmCharts.makeChart("chartDiv", {
    "theme": "light",
    "type": "serial",
    "legend": { 
        "generateFromData": true //custom property for the plugin
      },
	"startDuration": 2,
    "dataProvider": [{
        "date": "2017-10-10",
        "price": 4025,
        "count": 1,
        "color": "#FF0F00"
    }, {
        "date": "2017-10-11",
        "price": 1882,
        "count" : 4,
        "color": "#FF6600"
    }, {
        "date": "2017-10-12",
        "price": 1809,
        "count" : 2,
        "color": "#0D8ECF"
    }, {
        "date": "2017-10-13",
        "price": 1322,
        "count" : 10,
        "color": "#8A0CCF"
    }, {
        "date": "2017-10-14",
        "price": 1122,
        "count" : 1,
        "color": "#F8FF01"
    }],
    "valueAxes": [{
    	"id" : "priceAxis",
        "position": "left",
        "title": "price"
    }, {
    	"id" : "countAxis",
    	"position" : "right",
    	"title" : "count"
    }],
    "graphs": [{
        "balloonText": "[[category]]: <b>[[value]]¿ø</b>",
        "fillColorsField": "color",
        "fillAlphas": 0.8,
        "lineAlpha": 0,
        "type": "column",
        "valueField": "price",
        "valueAxis" : "priceAxis"
    }, {
    	"bullet": "round",
    	"lineThickness" : 2,
    	"lineColor" : "#000000",
        "bulletBorderAlpha": 1,
        "bulletBorderThickness": 1,
        "bulletColor" : "#FFFFFF",
        "balloonText": "[[value]]Àå",
        "useLineColorForBulletBorder": true,
        "title" : "count",
        "fillAlpha": 0,
        "valueField": "count",
        "valueAxis" : "countAxis"
    }],
    "depth3D": 20,
	"angle": 30,
    "chartCursor": {
        "categoryBalloonEnabled": false,
        "cursorAlpha": 0,
        "zoomable": false
    },
    "categoryField": "date",
    "categoryAxis": {
        "gridPosition": "start",
        "labelRotation": 0
    },
    "export": {
    	"enabled": true
     }
});

$(function() {
})
</script>

</head>
<body>

<!-- HTML -->
<div id="chartDiv"></div>
</body>
</html>