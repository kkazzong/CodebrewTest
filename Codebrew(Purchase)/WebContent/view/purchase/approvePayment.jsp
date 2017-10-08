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
			//�ͽ��÷η���� �ݱ��Ҷ� alertâ �ȶ߰� �ϱ�����..
			window.open("about:blank", "_self").close();
		});
		
	});
</script>
</head>
<body>
	
	${purchase.itemName}
	<hr>
	${purchase.purchaseCount}��
	<hr>
		<c:if test="${purchase.purchaseMethodType == 'MONEY'}">
			����
		</c:if>
		<c:if test="${purchase.purchaseMethodType == 'CARD'}">
			ī��
		</c:if>
	<hr>
	${purchase.purchaseDate}
	<hr>
	${purchase.purchasePrice}��
	<hr>
	<img src="../../resources/image/QRCodeImage/${purchase.qrCode.qrCodeImage}">
	<hr>
	<button type="button">Ȯ��</button>
</body>
</html>