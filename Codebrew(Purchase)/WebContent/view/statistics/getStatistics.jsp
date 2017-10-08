<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/data/purchaseData.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>getStatistics</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	//차트 옵션
	var options = {
			   maintainAspectRatio: false,
			   scales: {
			     yAxes: [{
			       stacked: true,
			       gridLines: {
			         display: true
			       }
			     }],
			     xAxes: [{
			       gridLines: {
			         display: false
			       }
			     }]
			   }
		};


	//차트만들기
	function makeChart(){
		   var chart = new Chart('chartBar', {
			   type : "bar",
			   options : options,
			   data : chartData
		   });
		   var myPieChart = new Chart('chartPie', {
				type: 'doughnut',
				data: chartData,
				options: options
		   });
	} 

	///////차트데이터	   
	var chartData = function() {
		
		$.ajax({
			url : "/chart/json/getChartData",
			method : "get",
			dataType : "json",
			success : function(JSONData){
				//var count = JSONData.totalCount;
				//console.log("count : "+count);
				var userCount = JSONData.userCount;
				var prodCount = JSONData.prodCount;
				var soldCount = JSONData.soldCount;
				   
				chartData = {
					labels: ["상품갯수", "팔린상품", "회원수"],
					datasets: [{
					label : "Tube Shop",					   
				 		backgroundColor: [
				 			"rgba(168, 145, 253, 0.4)",
				 			"rgba(253, 166, 160, 0.4)",
				 			"rgba(253, 215, 165, 0.4)",
				 		], 
				 		borderColor: [
				 			"rgba(168, 145, 253, 1)",
				 			"rgba(253, 166, 160, 1)",
				 			"rgba(253, 215, 165, 1)",
				 		],
				 			     borderWidth: 1,
				 			     hoverBackgroundColor: [
				 			        "rgba(168, 145, 253, 0.8)",
				 			        "rgba(253, 166, 160, 0.8)",
				 			        "rgba(253, 215, 165, 0.8)",
				 			     ],
				 			     hoverBorderColor: [
				 			    	"rgba(168, 145, 253, 1)",
				 			    	"rgba(253, 166, 160, 1)",
				 			    	"rgba(253, 215, 165, 1)",
				 			  	],
						     	data: [prodCount+"",soldCount+"",userCount+""],
						   }]
					 };
					console.log(chartData)
				   makeChart();
			   }
		   });
	   }
	
	$(function(){
		
		$("button").each(function(index, elem){}).on("click", function(){
			console.log("클릭클릭 val = "+$(this).val());
		});
		
	});
	
</script>
</head>
<body>

	<button type="button" value="1">일단위</button>
	<button type="button" value="2">월단위</button>
	<button type="button" value="3">분기단위</button>
	
	<hr>
	
	<div class="chart-container">
		<canvas id="chartBar"></canvas>
	</div>
		
	<hr>
	
</body>
</html>