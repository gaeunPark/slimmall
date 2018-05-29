<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>슬림몰</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css' />" />
<style type="text/css">
</style>
</head>
<body>
<body>
	<div class="w3-border-bottom">
		<c:import url="/member/header.do" />
	</div>
	<div class="w3-border-bottom w3-border-red">
		<c:import url="/member/nav.do?menu=3" />
	</div>
	<div>
		<section class="block-center w3-container">
			<h4>장바구니</h4>
			<table class="w3-table-all">
				<tr>									
					<th>상품번호</th>
					<th>수량</th>
					<th>상품명</th>				
					<th>금액</th>
					<th>주문</th>
				</tr>				
				<c:forEach var="cart" items="${carts}">
				<tr>	
					<td>${cart.productIdx}</td>
					<td>${cart.qty}</td>					
					<td>${cart.productName}</td>				
					<td><fmt:formatNumber value="${cart.productPrice * cart.qty}" pattern="#,###" />원</td>
					<td><a href="moveOrder.do?productIdx=${cart.productIdx}&qty=${cart.qty}" onclick="return confirm('주문 하시겠습니까?')">주문하기</a></td>
				</tr>						
				</c:forEach>				
				
			</table>
		</section>
	</div>
	<c:import url="/member/footer.do" />	
</body>
</body>
</html>
