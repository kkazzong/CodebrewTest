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

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<!-- Bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	function fncPayment(selectedCount, purchasePrice, purchaseFlag){

		var ticketNo = $("input:hidden[name='ticketNo']").val();
		
		console.log("���������Ѱ� : "+selectedCount);
		if(selectedCount == null || selectedCount == 0) {
			alert("������ �����ϼ���");
			return;
		}
		
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
			
			if(purchasePrice >= 100000) {
				alert("�����ݾ��� 100,000���� ���Ͽ��� �մϴ�");
				return;
			}
			
			$("#purchaseCount").html(selectedCount); //���ż���
			$("#purchasePrice").html(purchasePrice); //�����ݾ�
		});
		
		//īī������ Ŭ�� ��
		$("button").on("click",function(){
			fncPayment(selectedCount, purchasePrice, purchaseFlag);
		});
		
	});

</script>
<style type="text/css">
	body {
		padding-top : 70px;
    }
    .btn {
		/*��ũ Ŭ���� �Ķ��� �ȳ����� */
		text-decoration : none;
		border : 0;
		outline : 0;
	}
     /* div {
		border : 3px solid #D6CDB7;
		margin0top : 10px;
	}  */
</style>
</head>

<body>

	<div class="container">
		
		<!-- page header -->
		<div class="row">
			<div class="col-md-offset-4 col-md-4">
				<div class="page-header text-center">
					<h3 class="text-info"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span> Ƽ�ϱ���</h3>
					<small class="text-muted">���������� Ȯ�����ּ���</small>
				</div>
			</div>
		</div>
		
		<!-- form -->
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form class="form-horizontal" id="purchaseForm" name="purchaseForm">
					<!-- hidden -->
					<input type="hidden" name="ticketNo" value="${ticket.ticketNo}">
					<input type="hidden" name="ticketPrice" value="${ticket.ticketPrice}">
					<input type="hidden" name="purchaseFlag" value="${purchaseFlag}">
					
					<!-- �������� -->
					<c:if test="${!empty festival}">
						<input type="hidden" name="festival.festivalName" value="${festival.festivalName}">
						<img class="col-md-5" height="90" src="${festival.festivalImage}">
						<div class="row">
							<div class="col-md-6">
								<strong>${festival.festivalName}</strong>
							</div>
							<div class="col-md-6 text-muted">
								<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> <small>${festival.addr}</small>
							</div>
							<div class="col-md-6">
								${festival.ticketPrice}��	
							</div>
						</div>
					</c:if>
					
					<!-- ��Ƽ���� -->
					<c:if test="${!empty party}">
						<input type="hidden" name="party.partyName" value="${party.partyName}">
						<img class="col-md-6" height="90" src="${party.partyImage}">
						<div class="row">
							<div class="col-md-6">
								<strong>${party.partyName}</strong>
							</div>
							<div class="col-md-6 text-muted">
								<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> <small>${party.partyPlace}</small>
							</div>
							<div class="col-md-6">
								${party.ticketPrice}��	
							</div>
						</div>
					</c:if>
					
					<!-- �������� -->
					<div class="row">
						<div class="col-md-offset-2 col-xs-4 col-md-8">
								<div class="form-group form-inline">
									<label class="control-label" for="ticketCount">��������</label>
									<select class="col-md-offset-5 form-control input-sm" name="ticketCount">
										<option>�����ϼ���</option>
											<c:forEach begin="1" end="${ticket.ticketCount}" var="i" step="1">
												<option>${i}</option>
											</c:forEach>
									</select>
								</div>
						</div>
					</div>
					
					<!-- �������� -->
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">${user.nickname}���� ��������</h3>
						</div>
						<div class="panel-body">
							<div class="row">
						  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>���̵�</strong></div>
								<div class="col-xs-8 col-md-4">${user.userId}</div>
							</div>
							<div class="row">
						  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>���ż���</strong></div>
								<div class="col-xs-8 col-md-4"><span id="purchaseCount">0</span>��</div>
							</div>
							<div class="row">
						  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>�����ݾ�</strong></div>
								<div class="col-xs-8 col-md-4"><span id="purchasePrice">0</span>��</div>
							</div>
						</div>
					</div>
					
					<!-- īī������ -->
					<div class="row">
						<div class="col-md-offset-4 col-md-4">
							<button class="btn btn-link btn-block" type="button"><img src="../../resources/image/buttonImage/kakaopay.png"></button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	<%-- <form id="purchaseForm" name="purchaseForm">
	<label for="ticketNo">
		<c:if test="${!empty festival}">
			<input type="hidden" name="referNo" value="${festival.festivalNo}">
			<input type="hidden" name="ticketPrice" value="${festival.ticketPrice}">
		</c:if>
		<c:if test="${!empty party}">
			<input type="hidden" name="referNo" value="${party.partyNo}">
			<input type="hidden" name="ticketPrice" value="${party.ticketPrice}">
		</c:if>
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
		<select name="ticketCount">
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
		</select>
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
	</form> --%>
</body>
</html>