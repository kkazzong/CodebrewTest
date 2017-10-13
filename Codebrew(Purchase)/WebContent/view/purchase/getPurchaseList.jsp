<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- <%@ include file="/data/purchaseData.jsp" %> --%>
<%@ include file="/data/userData.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>getPurchaseList</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<!-- Bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery -->
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
<style type="text/css">
	body {
		padding-top : 70px;
    }
    .panel {
		margin-top : 50px;
    }
    /* div {
		border : 3px solid #D6CDB7;
		margin0top : 10px;
	} */
</style>
</head>
<body>

	<div class="container">
	
		<div class="row">
			<div class="col-md-offset-4 col-md-4">
				<button class="btn btn-primary">����Ƽ��</button>
			</div>
		</div>
		
		<!-- page header -->
		<div class="row">
			<div class="col-md-offset-4 col-md-4">
				<div class="page-header text-center">
					<h3 class="text-info"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span> ����Ƽ��</h3>
				</div>
			</div>
		</div>
		
		<!-- ���� / ��Ƽ ��ư -->
		<div class="row">
			<div class="col-md-6">
				<button class="btn btn-default btn-block" id="festivalBtn" type="button" value="1">����Ƽ��</button>
			</div>
			<div class="col-md-6">
				<button class="btn btn-default btn-block" id="partyBtn" type="button" value="2">��ƼƼ��</button>
			</div>
		</div>
		
		<div class="row">
			<c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${i+1}"></c:set>
				<div class="col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">${i} Ƽ��</h3>
							</div>
							<div class="panel-body">
								<!-- ����Ƽ�� -->
								<c:if test="${!empty purchase.ticket.festival}">
									<img width="100%" height="100" src="${purchase.ticket.festival.festivalImage}">
									<hr>
									<div class="col-md-12">
										<strong>
											${purchase.ticket.festival.festivalName}
										</strong>
									</div>
									<div class="col-md-12">
										<small>
											<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
											 ${purchase.ticket.festival.startDate} ~ ${purchase.ticket.festival.endDate}
										</small>
									</div>
									<div class="col-md-12">
										<small>
											<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
										 	${purchase.ticket.festival.addr}
										 </small>
									</div>
								</c:if>
								<!-- ��ƼƼ�� -->
								<c:if test="${!empty purchase.ticket.party}">
									<img width="100%" height="100" src="${purchase.ticket.party.partyImage}">
									<hr>
									<div class="col-md-12">
										<strong>
											${purchase.ticket.party.partyName}
										</strong>
									</div>
									<div class="col-md-12">
										<small>
											<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
											${purchase.ticket.party.partyDate}
										</small>
									</div>
									<div class="col-md-12">
										<small>
											<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
											${purchase.ticket.party.partyPlace}
										</small>
									</div>
								</c:if>
								<br>
								<div class="row">
									<div class="col-xs-4 col-md-6"><strong>������ȣ</strong></div>
									<div class="col-xs-8 col-md-6">${purchase.paymentNo}</div>
								</div>
								<div class="row">
									<div class="col-xs-4 col-md-6"><strong>���ż���</strong></div>
									<div class="col-xs-8 col-md-6">${purchase.purchaseCount} ��</div>
								</div>
								<div class="row">
									<div class="col-xs-4 col-md-6"><strong>�����ݾ�</strong></div>
									<div class="col-xs-8 col-md-6">${purchase.purchasePrice} ��</div>
								</div>
								<div class="row">
									<div class="col-xs-4 col-md-6"><strong>��������</strong></div>
									<div class="col-xs-8 col-md-6">
										<c:if test="${empty purchase.tranCode}">
											�����Ϸ�
										</c:if>
										<c:if test="${purchase.tranCode == 2}">
											�������
										</c:if>
									</div>
								</div>
								<hr>
								<button class="btn btn-primary" type="button" value="${purchase.purchaseNo}">��ȸ</button>
								<button class="btn btn-default" type="button" value="${purchase.purchaseNo}">����</button>
							</div>
						</div>
				</div>
			</c:forEach>
		</div>
		
	</div>

	<%-- �Զ�ٰٸ���Ƽ�ϸ�����
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
		${purchase.paymentNo}
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
	<hr> --%>
</body>
</html>