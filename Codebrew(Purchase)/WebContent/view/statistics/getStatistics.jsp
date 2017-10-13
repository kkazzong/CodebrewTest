<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/data/purchaseData.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>getStatistics</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<!-- Bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js" type="text/javascript"></script>
<!-- jQuery -->
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
		   /* var myPieChart = new Chart('chartPie', {
				type: 'doughnut',
				data: chartData,
				options: options
		   }); */
	} 
	
	var chartDataSet = [];
	//차트데이터	   
	var chartData = function(statFlag) {
		
		console.log("statFlag => "+statFlag);
		
		$.ajax({
			url : "/statisticsRest/json/getStatistics/"+statFlag,
			method : "get",
			dataType : "json",
			success : function(JSONData){
				
				console.log(JSON.stringify(JSONData));
				
				var date = [];
				var price = [];
				var count = []; 
				
				for(var i = 0; i < JSONData.length; i++) {
					date[i] = JSONData[i].statDate;
					price[i] = JSONData[i].totalPrice;
					count[i] = JSONData[i].totalCount;
					console.log("date : "+date+", price : "+price+", count : "+count);
					
				}
				chartData = {
					labels: [date[0]+"",date[1]+"",date[2]+""],
					datasets: [{
					label : "총 판매 금액",					   
					backgroundColor: [
					 	"rgba(168, 145, 253, 0.4)",
					 	"rgba(253, 166, 160, 0.4)",
					 	"rgba(253, 215, 165, 0.4)",
					 ], 
					borderColor : [ 
						"rgba(168, 145, 253, 1)",
						"rgba(253, 166, 160, 1)",
						"rgba(253, 215, 165, 1)", 
					],
					borderWidth : 1,
					hoverBackgroundColor : [
						"rgba(168, 145, 253, 0.8)",
						"rgba(253, 166, 160, 0.8)",
						"rgba(253, 215, 165, 0.8)", ],
					hoverBorderColor : [
						"rgba(168, 145, 253, 1)",
						"rgba(253, 166, 160, 1)",
						"rgba(253, 215, 165, 1)", 
					],
					data : [ price[0] + "", price[1] + "", price[2]+""],
					}]
				}; 
				
				makeChart();
			}
		});
	}

	$(function() {

		//차트만들기 default는 월단위
		var statFlag = $("input:hidden[name='statFlag']").val();
		chartData(statFlag);
		//chartData(2);
		//chartData(3);

		$("button").each(function(){}).on("click", function() {
			
			var statFlag = $(this).val();
			console.log("클릭클릭 val = " + statFlag);
			self.location = "/statistics/getStatistics?statFlag="+statFlag;
			
		});
		
		//tab클릭시
		$("#chartTab a[href='#profile']").on("click", function(e){
			console.log("탭 클릭 => "+$(this).html());
			e.preventDefault();
			$(this).tab('show');
		});
		

	});
</script>
</head>
<body>
		
	<input type="hidden" name="statFlag" value="${statistics.statFlag}">
	
	<div>
		
			
		
		<!-- Nav tabs -->
		<ul id="chartTab" class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active">
				<a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a>
			</li>
			<li role="presentation">
				<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a>
			</li>
			<li role="presentation">
				<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a>
			</li>
			<li role="presentation">
				<a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">홈홈홈</div>
			<div role="tabpanel" class="tab-pane" id="profile">프로필필</div>
			<div role="tabpanel" class="tab-pane" id="messages">메시지지지</div>
			<div role="tabpanel" class="tab-pane" id="settings">세팅팅팅</div>
		</div>

	</div>
	
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