<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<title>getSaleList</title>
</head>
<body>
	
	<form name="orderForm">
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
	</table>
	
</body>
</html>