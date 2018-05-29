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
		<c:import url="/member/nav.do?menu=2" />
	</div>
	<div>
		<section class="block-center w3-container">
			<h4>주문목록</h4>
			<table class="w3-table-all">
				<tr>
					<th>번호</th>													
					<th>상품번호</th>
					<th>수량</th>
					<th>주문일</th>
					<th>상품명</th>				
					<th>금액</th>
					<th>상태</th>
					<th>주문</th>
					<th>결제</th>
				</tr>				
				<c:forEach var="productOrderViewVO" items="${productOrderViewVOs}">
				<tr>	
					<td><a href="#">${productOrderViewVO.idx}</a></td>	
					<td>${productOrderViewVO.productIdx}</td>
					<td>${productOrderViewVO.qty}</td>					
					<td>${fn:substring(productOrderViewVO.createTime,0,10)}</td>
					<td>${productOrderViewVO.productName}</td>				
					<td><fmt:formatNumber value="${productOrderViewVO.productPrice * productOrderViewVO.qty}" pattern="#,###" />원</td>
					<td>${productOrderViewVO.status}</td>					
					<td>
						<c:if test="${productOrderViewVO.status != 'REFUNDED'}">
							<a href="cancelOrder.do?idx=${productOrderViewVO.idx}&status=${productOrderViewVO.status}" onclick="return confirm('취소 하시겠습니까?')">취소</a>
						</c:if>
					</td>
					<td>
						<c:if test="${productOrderViewVO.status != 'REFUNDED'}">
							<c:if test="${productOrderViewVO.paymentType eq 'NONE'}">
								<a href="payOrder.do?idx=${productOrderViewVO.idx}" onclick="return confirm('결제하기로 이동할까요?')">결제</a>
							</c:if>
							<c:if test="${productOrderViewVO.paymentType != 'NONE'}">
							<%-- ${productOrderViewVO.paymentType}  --%>
							완료
							</c:if>
						</c:if>					
					</td>
					
				</tr>						
				</c:forEach>				
				
			</table>
		</section>
	</div>
	<c:import url="/member/footer.do" />	
</body>
</body>
</html>
