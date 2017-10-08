<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- <%@ include file="/data/purchaseData.jsp" %> --%>
<%@ include file="/data/userData.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>getPurchaseList</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#festivalBtn").on("click", function(){
			console.log("������ư Ŭ�� : val = "+$(this).val());
			self.location = "/purchase/getPurchaseList?userId=lgj1522@gmail.com&purchaseFlag="+$(this).val();
		});
		
		$("#partyBtn").on("click", function(){
			console.log("��Ƽ��ư Ŭ�� : val = "+$(this).val());
			self.location = "/purchase/getPurchaseList?userId=lgj1522@gmail.com&purchaseFlag="+$(this).val();
		});
		
		$("button:contains('��ȸ')").on("click", function(){
			console.log("��ȸ��ư Ŭ�� : val = "+$(this).val());
			self.location = "/purchase/getPurchase?purchaseNo="+$(this).val();
		});
		
	});
</script>
</head>
<body>
	�Զ�ٰٸ���Ƽ�ϸ�����
	<hr>
	<button id="festivalBtn" type="button" value="1">����Ƽ��</button>
	<button id="partyBtn" type="button" value="2">��ƼƼ��</button>
	<hr>
	�������̵� : ${user.userId} <br>
	�����г��� : ${user.nickname}
	<hr>
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${i+1}"></c:set>
		<h2>${i}</h2>
		<hr>
		${purchase.tid}
		<hr>
		${purchase.itemName} 
		<hr>
		<c:if test="${!empty purchase.ticket.festival}">
			<img height="100" width="100" src="${purchase.ticket.festival.festivalImage}">
			<hr>
			${purchase.ticket.festival.startDate} ~ ${purchase.ticket.festival.endDate} 
			<hr>
			${purchase.ticket.festival.addr}
		</c:if>
		<c:if test="${!empty purchase.ticket.party}">
			<img height="100" width="100" src="${purchase.ticket.party.partyImage}">
			<hr>
			${purchase.ticket.party.partyDate}
			<hr>	
			${purchase.ticket.party.partyPlace}	
		</c:if>
		<hr>
		���ż��� : ${purchase.purchaseCount}��
		<hr>
		�������� : 
		<c:if test="${empty purchase.tranCode}">
			�����Ϸ�
		</c:if>
		<c:if test="${purchase.tranCode == 2}">
			�������
		</c:if>
		<hr>
		<button type="button" value="${purchase.purchaseNo}">��ȸ</button>
		<button type="button" value="${purchase.purchaseNo}">����</button>
		<hr>
	</c:forEach>
	<hr>
</body>
</html>