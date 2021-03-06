<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>

<title>approvePayment</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<!-- Bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("button").bind("click", function(){
			opener.parent.location="/purchase/getPurchaseList?userId=lgj1522@gmail.com";
			//익스플로러경우 닫기할때 alert창 안뜨게 하기위해..
			window.open("about:blank", "_self").close();
		});
		
	});
</script>
<style type="text/css">
	div {
		border : 3px solid #D6CDB7;
		margin0top : 10px;
	}
</style>
</head>
<body>
	
	<div class="container">
	
		<!-- page header -->
		<div class="row">
			<div class="col-md-offset-4 col-md-4">
				<div class="page-header text-center">
					<h3 class="text-info"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 결제완료</h3>
					<small class="text-muted">결제정보를 확인해주세요</small>
				</div>
			</div>
		</div>
		
		<!-- 결제정보 -->
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">${user.nickname}님의 결제정보</h3>
					</div>
					<div class="panel-body">
						<img class="col-md-12" width="100%" height="190" src="${purchase.ticket.party.partyImage}">
						<div class="row">
							<div class="col-md-offset-2 col-xs-4 col-md-8"><strong>${purchase.itemName}</strong></div>
						</div>
						<div class="row">
							<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>아이디</strong></div>
							<div class="col-xs-8 col-md-4">${user.userId}</div>
						</div>
						<div class="row">
							<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>구매수량</strong></div>
							<div class="col-xs-8 col-md-4">${purchase.purchaseCount}장</div>
						</div>
						<div class="row">
							<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>결제금액</strong></div>
							<div class="col-xs-8 col-md-4">${purchase.purchasePrice}원</div>
						</div>
						<div class="row">
							<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>결제수단</strong></div>
							<div class="col-xs-8 col-md-4">
								<c:if test="${purchase.purchaseMethodType == 'MONEY'}">
									현금
								</c:if>
								<c:if test="${purchase.purchaseMethodType == 'CARD'}">
									카드
								</c:if>
							</div>
						</div>
						<div class="row">
							<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>결제일시</strong></div>
							<div class="col-xs-8 col-md-4">${purchase.purchaseDate}</div>
						</div>
						<!-- 큐알코드 -->
						<div class="row">
							<img class="col-md-offset-3" width="50%" height="50%" src="../../resources/image/QRCodeImage/qrcode.png">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 확인버튼 -->
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<button class="btn btn-primary btn-block" type="button">확인</button>
			</div>
		</div>
		
	</div>
	
	
	<%-- ${purchase.itemName}
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
	<button type="button">확인</button> --%>
</body>
</html>