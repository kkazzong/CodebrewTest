<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>

<title>getSaleList</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<!-- Bootstrap Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"/>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	body {
		padding-top : 70px;
    }
    /* div {
		border : 3px solid #D6CDB7;
		margin0top : 10px;
	} */
</style>
</head>
<body>
	
	<div class="container">
	
		<!-- page header -->
		<div class="row">
			<div class="col-md-offset-4 col-md-4">
				<div class="page-header text-center">
					<h3 class="text-info"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> �ǸŸ��</h3>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-offset-1 col-md-2 ">
				<!-- ���� -->
				<form class="form form-inline" id="orderForm" name="orderForm">
					<select class="form-group">
						<option value="" selected="selected">����</option>
						<optgroup label="����">
							<option value="1">���ݡ�</option>
							<option value="2">���ݡ�</option>
						</optgroup>
						<optgroup label="���̵�">
							<option value="3">���̵��</option>
							<option value="4">���̵��</option>
						</optgroup>
						<optgroup label="���ų�¥">
							<option value="5">���ų�¥��</option>
							<option value="6">���ų�¥��</option>
						</optgroup>
					</select>
				</form>
			</div>
			<div class="col-md-offset-4 col-md-5 ">
				<!-- �˻� -->
				<form class="form form-inline" id="searchForm" name="searchForm">
					<select class="form-group">
						<option value="1" selected="selected">���Ź�ȣ</option>
						<option value="2">���̵�</option>
					</select>
					<input class="form-group" name="searchKeyword" type="text">
					<button class="btn btn-default" type="button">�˻�</button>
				</form>
			</div>
		</div>
		
		<!-- table -->
		<div class="row">
			<div class="col-md-offset-1 col-md-10">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>NO</th>
							<th>���Ź�ȣ</th>
							<th>���̵�</th>
							<th>Ƽ�ϸ�</th>
							<th>���ų�¥</th>
							<th>����</th>
							<th>�����ݾ�</th>
							<th>����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="purchase" items="${list}">
							<c:set var="i" value="${i+1}"></c:set>
							<tr>
								<td>${i}</td>
								<td>${purchase.purchaseNo}</td>
								<td>${purchase.user.userId}</td>
								<td>${purchase.itemName}</td>
								<td>${purchase.purchaseDate}</td>
								<td>${purchase.purchaseCount}</td>
								<td>${purchase.purchasePrice}</td>
								<td>
								<c:if test="${empty purchase.tranCode}">�����Ϸ�</c:if>
								<c:if test="${purchase.tranCode == 2}">�������</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
	
	<%-- <form name="orderForm">
		<select>
			<option value="" selected="selected">����</option>
			<optgroup label="����">
				<option value="1">���ݡ�</option>
				<option value="2">���ݡ�</option>
			</optgroup>
			<optgroup label="���̵�">
				<option value="3">���̵��</option>
				<option value="4">���̵��</option>
			</optgroup>
			<optgroup label="���ų�¥">
				<option value="5">���ų�¥��</option>
				<option value="6">���ų�¥��</option>
			</optgroup>
		</select>
	</form>
	
	<form name="searchForm">
		<select>
			<option value="1" selected="selected">���Ź�ȣ</option>
			<option value="2">���̵�</option>
		</select>
		<input name="searchKeyword" type="text">
		<button type="button">�˻�</button>
	</form>
	
	<table>
		<thead>
			<tr>
				<th>NO</th>
				<th>���Ź�ȣ</th>
				<th>���̵�</th>
				<th>Ƽ�ϸ�</th>
				<th>���ų�¥</th>
				<th>����</th>
				<th>�����ݾ�</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${i+1}"></c:set>
				<tr>
					<td>${i}</td>
					<td>${purchase.purchaseNo}</td>
					<td>${purchase.user.userId}</td>
					<td>${purchase.itemName}</td>
					<td>${purchase.purchaseDate}</td>
					<td>${purchase.purchaseCount}</td>
					<td>${purchase.purchasePrice}</td>
					<td>
					<c:if test="${empty purchase.tranCode}">�����Ϸ�</c:if>
					<c:if test="${purchase.tranCode == 2}">�������</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> --%>
	
</body>
</html>