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

<a href="/view/festival/getFestival.jsp">������</a>
<a href="/view/party/getParty.jsp">��Ƽ��</a>
<button type="button">�ǸŸ�ϰ��</button>
<a href="/view/statistics/getStatistics.jsp">�Ǹ���躸��</a>
<a href="/purchase/getPurchaseList?userId=lgj1522@gmail.com">����Ƽ��</a>
</body>
</html>