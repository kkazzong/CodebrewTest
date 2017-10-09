<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>index</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("button").on("click", function(){
			self.location = "/purchase/getSaleList";
		});
	});
</script>
</head>
<body>

<a href="/view/festival/getFestival.jsp">축제상세</a>
<a href="/view/party/getParty.jsp">파티상세</a>
<button type="button">판매목록고고</button>
<a href="/view/statistics/getStatistics.jsp">판매통계보자</a>
<a href="/purchase/getPurchaseList?userId=lgj1522@gmail.com">마이티켓</a>
</body>
</html>