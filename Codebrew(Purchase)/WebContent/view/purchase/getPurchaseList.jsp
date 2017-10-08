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
			console.log("축제버튼 클릭 : val = "+$(this).val());
			self.location = "/purchase/getPurchaseList?userId=lgj1522@gmail.com&purchaseFlag="+$(this).val();
		});
		
		$("#partyBtn").on("click", function(){
			console.log("파티버튼 클릭 : val = "+$(this).val());
			self.location = "/purchase/getPurchaseList?userId=lgj1522@gmail.com&purchaseFlag="+$(this).val();
		});
		
		$("button:contains('조회')").on("click", function(){
			console.log("조회버튼 클릭 : val = "+$(this).val());
			self.location = "/purchase/getPurchase?purchaseNo="+$(this).val();
		});
		
	});
</script>
</head>
<body>
	게라겟겟마이티켓리스투
	<hr>
	<button id="festivalBtn" type="button" value="1">축제티켓</button>
	<button id="partyBtn" type="button" value="2">파티티켓</button>
	<hr>
	나으아이디 : ${user.userId} <br>
	나으닉네임 : ${user.nickname}
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
		구매수량 : ${purchase.purchaseCount}장
		<hr>
		결제상태 : 
		<c:if test="${empty purchase.tranCode}">
			결제완료
		</c:if>
		<c:if test="${purchase.tranCode == 2}">
			결제취소
		</c:if>
		<hr>
		<button type="button" value="${purchase.purchaseNo}">조회</button>
		<button type="button" value="${purchase.purchaseNo}">삭제</button>
		<hr>
	</c:forEach>
	<hr>
</body>
</html>