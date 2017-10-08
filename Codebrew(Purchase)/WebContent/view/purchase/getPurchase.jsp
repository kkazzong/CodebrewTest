<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <%@ include file="/data/purchaseData.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>getPurchase</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	function fncCancelPayment(purchaseNo) {
		
		$.ajax({
			url : "/purchaseRest/json/cancelPayment/"+purchaseNo,
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : "json",
			success : function(data) {
				console.log(data);
			}
		});
		
	}
	
	$(function(){
		
		$("button:contains('Ȯ��')").on("click", function(){
			history.go(-1);
		});
		
		$("button:contains('��������ϱ�')").on("click", function(){
			
			var result = confirm("������ ������ ����Ͻðڽ��ϱ�?");
			
			if(result) {
				var purchaseNo = $(this).val();
				
				console.log("��������ϱ� ��ư val = "+purchaseNo);
				fncCancelPayment(purchaseNo);
			} else {
				return;
			}
		});
		
	});

</script>
</head>
<body>
	<c:if test="${!empty ticket.festival}">
		<img width="100" height="100" src="${ticket.festival.festivalImage}">
		<hr>
		${ticket.festival.festivalName}
		<hr>
		${ticket.festival.startDate} ~ ${ticket.festival.endDate}
		<hr>
		${ticket.festival.addr}
		<hr>
		<button type="button" value="${ticket.festival.festivalNo}">���� ���� ������</button>
	</c:if>
	<c:if test="${!empty ticket.party}">
		${ticket.party.partyName}
		<hr>
		${ticket.party.partyDate}
		<hr>
		${ticket.party.partyPlace}
		<hr>
		<button type="button" value="${ticket.party.partyNo}">��Ƽ ���� ������</button>
	</c:if>
	<hr>
	<hr>
	������ȣ : ${purchase.tid}
	<hr>
	�����Ͻ� : ${purchase.purchaseDate}
	<hr>
	�������� : 
	<c:if test="${purchase.purchaseMethodType == CARD}">ī��</c:if>
	<c:if test="${purchase.purchaseMethodType == MONEY}">����</c:if>
	<hr>
	���ż��� : ${purchase.purchaseCount}
	<hr>
	�����ݾ� : ${purchase.purchasePrice}
	<hr>
	�������� : 
	<c:if test="${empty purchase.tranCode}">
		�����Ϸ�
	</c:if>
	<hr>
	<img alt="ť���ڵ�" src="../../resources/image/QRCodeImage/${purchase.qrCode.qrCodeImage}">
	<hr>
	<button type="button">Ȯ��</button>
	<button type="button" value="${purchase.purchaseNo}">��������ϱ�</button>
</body>
</html>