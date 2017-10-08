<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function addPurchase() {
		self.location="/purchase/addPurchase?partyNo=10020";
		//self.location="/purchase/addPurchase?festivalNo=10001";
	}
</script>
</head>
<body>

<button type="button" onclick="addPurchase()">파티티켓구매하러</button>
</body>
</html>