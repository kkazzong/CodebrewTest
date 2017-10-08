<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>

<title>approvePayment</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("button").bind("click", function(){
			opener.parent.location="/purchase/getPurchaseList?userId=lgj1522@gmail.com";
			//익스플로러경우 닫기할때 alert창 안뜨게 하기위해..
			window.open("about:blank", "_self").close();
		});
		
	});
</script>
</head>
<body>
	
	${purchase.itemName}
	<hr>
	${purchase.purchaseCount}장
	<hr>
		<c:if test="${purchase.purchaseMethodType == 'MONEY'}">
			현금
		</c:if>
		<c:if test="${purchase.purchaseMethodType == 'CARD'}">
			카드
		</c:if>
	<hr>
	${purchase.purchaseDate}
	<hr>
	${purchase.purchasePrice}원
	<hr>
	<img src="../../resources/image/QRCodeImage/${purchase.qrCode.qrCodeImage}">
	<hr>
	<button type="button">확인</button>
</body>
</html>