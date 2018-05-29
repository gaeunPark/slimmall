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
		<c:import url="/header.do" />
	</div>
	<div class="w3-border-bottom w3-border-blue">
		<c:import url="/nav.do" />
	</div>
	<div>
		<section class="block-center w3-container w3-section">
			<img alt="" src="<c:url value='/image/${adminVO.imageName}'/>" id="product-image" class="w3-grayscale w3-border">
			<div id="product-info">
				<h4>${adminVO.name}</h4>
				<label>가격 : </label>
				<p><b><fmt:formatNumber value="${adminVO.price}" pattern="#,###" />원</b></p>
				<label>설명 : </label>
				<p>${adminVO.description}</p>
				<label>수량선택 : </label>
				<p>				
				<form action="orderProduct.do" method="post" onsubmit="return confirm('주문 하시겠습니까?')">
				<input type="number" name="qty" value="1">
				</p>
				<input type="hidden" name="productIdx" value="${adminVO.idx}">
				<p>
					<input type="submit" value="주문" class="w3-button w3-black">
					<a href="addCart.do?idx=${adminVO.idx}" class="w3-button w3-black" onclick="return confirm('장바구니에 담을까요?')">장바구니</a>
				</p>
				</form>
			</div>
		</section>
	</div>
	<c:import url="/footer.do" />	
</body>
</html>