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
			<option value="" selected="selected">필터</option>
			<optgroup label="가격">
				<option value="1">가격▲</option>
				<option value="2">가격▼</option>
			</optgroup>
			<optgroup label="아이디">
				<option value="3">아이디▲</option>
				<option value="4">아이디▼</option>
			</optgroup>
			<optgroup label="구매날짜">
				<option value="5">구매날짜▲</option>
				<option value="6">구매날짜▼</option>
			</optgroup>
		</select>
	</form>
	
	<form name="searchForm">
		<select>
			<option value="1" selected="selected">구매번호</option>
			<option value="2">아이디</option>
		</select>
		<input name="searchKeyword" type="text">
		<button type="button">검색</button>
	</form>
	
	<table>
		<thead>
			<tr>
				<th>NO</th>
				<th>구매번호</th>
				<th>아이디</th>
				<th>티켓명</th>
				<th>구매날짜</th>
				<th>수량</th>
				<th>결제금액</th>
				<th>상태</th>
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
					<c:if test="${empty purchase.tranCode}">결제완료</c:if>
					<c:if test="${purchase.tranCode == 2}">결제취소</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>