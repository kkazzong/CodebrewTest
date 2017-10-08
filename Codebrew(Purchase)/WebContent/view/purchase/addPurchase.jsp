<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- <%@ include file="/data/festivalData.jsp" %> --%>
<%-- <%@ include file="/data/partyData.jsp" %> --%>
<%-- <%@ include file="/data/userData.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>addPurchase</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	function fncPayment(selectedCount, purchasePrice, purchaseFlag){

		var ticketNo = $("input:hidden[name='ticketNo']").val();
		
		$.ajax({
			
			url : "/purchaseRest/json/readyPayment/"+ticketNo,
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				purchaseCount : selectedCount,
				purchasePrice : purchasePrice,
				purchaseFlag : purchaseFlag
			}), 
			dataType : "json",
			success : function(data){
				console.log(JSON.stringify(data));
				var url = data.nextRedirectPcUrl;
				window.open(url,'kakaoPay','toolbar=no,location=center,menubar=no,width=426,height=510');
			}
			
		});
		
	}
	
	$(function(){
		
		var selectedCount; //���ż���
		var ticketPrice; //Ƽ�ϰ���
		var purchasePrice; //�����ݾ�
		var purchaseFlag = $("input:hidden[name='purchaseFlag']").val(); //1-����,2-��Ƽ
		console.log("�����Դϱ� ��Ƽ�Դϱ� : "+purchaseFlag);
		
		//���ż��� ���� ��
		$("select").on("change",function(){
			selectedCount = $("select option:selected").val();
			ticketPrice = $("input:hidden[name='ticketPrice']").val();
			purchasePrice = selectedCount * ticketPrice;
			
			console.log("�������� : "+selectedCount+"�� ����");
			console.log("�����ݾ� : "+purchasePrice+"��");
			$($("span")[0]).html(selectedCount); //���ż���
			$($("span")[1]).html(purchasePrice); //�����ݾ�
		});
		
		//īī������ Ŭ�� ��
		$("button").on("click",function(){
			fncPayment(selectedCount, purchasePrice, purchaseFlag);
		});
		
	});

</script>

</head>

<body>
	
	<form id="purchaseForm" name="purchaseForm">
	<label for="ticketNo">
		<%-- <c:if test="${!empty festival}">
			<input type="hidden" name="referNo" value="${festival.festivalNo}">
			<input type="hidden" name="ticketPrice" value="${festival.ticketPrice}">
		</c:if>
		<c:if test="${!empty party}">
			<input type="hidden" name="referNo" value="${party.partyNo}">
			<input type="hidden" name="ticketPrice" value="${party.ticketPrice}">
		</c:if> --%>
		<input type="hidden" name="ticketNo" value="${ticket.ticketNo}">
		<input type="hidden" name="ticketPrice" value="${ticket.ticketPrice}">
	</label>
	<c:if test="${!empty festival}">
	��������
		<input type="hidden" name="purchaseFlag" value="${purchaseFlag}">
		<label for="festivalName">
			<input type="hidden" name="festival.festivalName" value="${festival.festivalName}">
		</label>
		<img width="200" height="200" src="${festival.festivalImage}">
		<hr>
		${festival.festivalName}
		<hr>
		${festival.addr}
		<hr>
		${festival.ticketPrice}��	
		<hr>
	</c:if>
	
	<c:if test="${!empty party}">
	��Ƽ����
		<input type="hidden" name="purchaseFlag" value="${purchaseFlag}">
		<label for="partyName">
			<input type="hidden" name="party.partyName" value="${party.partyName}">
		</label>
		<img width="200" height="200" src="${party.partyImage}">
		<hr>
		${party.partyName}
		<hr>
		${party.partyPlace}
		<hr>
		${party.ticketPrice}��	
		<hr>
	</c:if>
		�������� 
		<%-- <select name="ticketCount">
			<c:if test="${!empty party}">
				<c:forEach begin="1" end="${party.ticketCount}" var="i" step="1">
					<option>${i}</option>
				</c:forEach>
			</c:if>
			<c:if test="${!empty festival}">
				<c:forEach begin="1" end="${festival.ticketCount}" var="i" step="1">
					<option>${i}</option>
				</c:forEach>
			</c:if>
		</select> --%>
		<select name="ticketCount">
				<option>�����ϼ���</option>
				<c:forEach begin="1" end="${ticket.ticketCount}" var="i" step="1">
					<option>${i}</option>
				</c:forEach>
		</select>
		<hr>
		id : ${user.userId} <br>
		${user.nickname}���� ��������
		<br>		
		���ż��� : <span></span>��
		<br>
		�����ݾ� : <span></span>��
		<hr>
		<button type="button"><img src="../../resources/image/buttonImage/kakaopay.png"></button>
	</form>
</body>
</html>