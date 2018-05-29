<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>슬립몰</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css' />" />
<style type="text/css">
#product-image {
	width: 40%;
	display: inline-block;
	vertical-align: top;
}
#product-info {
	display: inline-block;
	vertical-align: top;
	margin-left: 20px;
}
</style>
</head>
<body>
	<div class="w3-border-bottom">
		<c:import url="/member/header.do" />
	</div>
	<div class="w3-border-bottom w3-border-blue">
		<c:import url="/member/nav.do?menu=2" />
	</div>
	<div>
		<section class="block-center w3-container w3-section">
		<h4>결제하기</h4>
			<img alt="" src="<c:url value='/image/${productOrderViewVO.productImageName}'/>" id="product-image" class="w3-grayscale w3-border">
			<div id="product-info">
				<h4>${productOrderViewVO.productName}</h4>
				<label>가격 : </label>
				<p><b><fmt:formatNumber value="${productOrderViewVO.productPrice}" pattern="#,###" />원</b></p>
				<label>설명 : </label>
				<p>${productOrderViewVO.productDescription}</p>
				<label>수량선택 : </label>
				<p>
				<form action="payProduct.do" method="post" onsubmit="return confirm('결재 하시겠습니까?')">
				<input type="number" name="qty" value="${productOrderViewVO.qty}">
				</p>
				<label>결제방식선택 : </label>
				<select name="paymentType">
					<option value="CASH" <c:if test="${productOrderViewVO.paymentType eq 'CASH'}">selected</c:if> >현금</option>
					<option value="CARD" <c:if test="${productOrderViewVO.paymentType eq 'CARD'}">selected</c:if> >신용카드</option>
					<option value="VA" <c:if test="${productOrderViewVO.paymentType eq 'VA'}">selected</c:if> >가상계좌</option>
					<option value="MOBILE" <c:if test="${productOrderViewVO.paymentType eq 'MOBILE'}">selected</c:if> >휴대폰결제</option>
					<option value="PAY" <c:if test="${productOrderViewVO.paymentType eq 'PAY'}">selected</c:if> >카카오페이</option>
				</select>				
				<input type="hidden" name="idx" value="${productOrderViewVO.idx}">
				<p>					
					<input type="submit" value="결제" class="w3-button w3-black">
				</p>
				</form>
			</div>
		</section>
	</div>
	<c:import url="/member/footer.do" />	
</body>
</html>