<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>슬립몰</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css' />" />
<style type="text/css">
input {
	display: block !important;
	margin: 5px !important;	
}
#product-image {
	height: 200px;
}
</style>
</head>
<body>
	<div class="w3-border-bottom">
		<c:import url="/admin/header.do" />
	</div>
	<div class="w3-border-bottom w3-border-blue">
		<c:import url="/admin/nav.do?menu=0" />
	</div>
	<div>
		<section class="block-center w3-container">
			<h3>${fn:toUpperCase(adminVO.tableName)} 수정</h3>
			<form action="setAdmin.do" method="post" onsubmit="return confirm('수정 하시겠습니까?')">
				<input type="hidden" name="idx" value="${adminVO.idx}">	
				<c:if test="${adminVO.tableName == 'category'}">
				<label>이름 : </label>
				<input type="text" name="name" value="${adminVO.name}" placeholder="이름을 입력해 주세요.">				
				</c:if>
				<c:if test="${adminVO.tableName == 'member'}">
				<label>유저ID : </label>
				<input type="text" name="username" value="${adminVO.username}" placeholder="유저ID를 입력해 주세요.">
				<label>비밀번호 : </label>	
				<input type="text" name="password" value="${adminVO.password}" placeholder="비밀번호를 입력해 주세요.">
				<label>이메일 : </label>			
				<input type="text" name="email" value="${adminVO.email}" placeholder="이메일을 입력해 주세요.">
				<label>전화번호 : </label>
				<input type="text" name="phone" value="${adminVO.phone}" placeholder="전화번호를 입력해 주세요.">
				<label>주소 : </label>
				<input type="text" name="address" value="${adminVO.address}" placeholder="주소를 입력해 주세요.">		
				</c:if>
				<c:if test="${adminVO.tableName == 'order'}">
				<label>회원번호 : </label>
				<input type="number" name="memberIdx" value="${adminVO.memberIdx}" placeholder="회원번호를 입력해 주세요.">
				<label>상품번호 : </label>				
				<input type="number" name="productIdx" value="${adminVO.productIdx}" placeholder="상품번호를 입력해 주세요.">
				<label>수량 : </label>
				<input type="number" name="qty" value="${adminVO.qty}" placeholder="수량을 입력해 주세요.">
				</c:if>
				<c:if test="${adminVO.tableName == 'product'}">
				<label>이름 : </label>
				<input type="text" name="name" value="${adminVO.name}" placeholder="이름을 입력해 주세요.">
				<label>설명 : </label>				
				<input type="text" name="description" value="${adminVO.description}" placeholder="설명을 입력해 주세요.">
				<label>가격 : </label>
				<input type="number" name="price" value="${adminVO.price}" placeholder="가격을 입력해 주세요.">
				<label>수량 : </label>
				<input type="number" name="qty" value="${adminVO.qty}" placeholder="수량을 입력해 주세요.">
				<%-- <input type="text" name="imageName" value="${adminVO.imageName}" placeholder="이미지를 입력해 주세요."> --%>
				<label>이미지 : </label>
				<img alt="" src="<c:url value='/image/${adminVO.imageName}'/>" id="product-image" class="w3-border w3-padding">							
				<select name="imageName">
					<option value="jeans1.jpg" <c:if test="${adminVO.imageName eq 'jeans1.jpg'}">selected</c:if> >jeans1.jpg</option>
					<option value="jeans2.jpg" <c:if test="${adminVO.imageName eq 'jeans2.jpg'}">selected</c:if> >jeans2.jpg</option>
					<option value="jeans3.jpg" <c:if test="${adminVO.imageName eq 'jeans3.jpg'}">selected</c:if> >jeans3.jpg</option>
					<option value="jeans4.jpg" <c:if test="${adminVO.imageName eq 'jeans4.jpg'}">selected</c:if> >jeans4.jpg</option>
				</select>	
				<label>카테고리번호 : </label>
				<input type="number" name="categoryIdx" value="${adminVO.categoryIdx}" placeholder="카테고리번호를 입력해 주세요.">	
				</c:if>	
				<c:if test="${adminVO.tableName == 'purchase'}">
				<label>주문번호 : </label>
				<input type="number" name="orderIdx" value="${adminVO.orderIdx}" placeholder="주문번호을 입력해 주세요.">
				<!-- <input type="text" name="status" value="${adminVO.status}" placeholder="상태을 입력해 주세요."> -->
				<label>상태 : </label>
				<select name="status">				
					<option value="PROCESSED" <c:if test="${adminVO.status eq 'PROCESSED'}">selected</c:if> >결재완료</option>
					<option value="DELIVERY" <c:if test="${adminVO.status eq 'DELIVERY'}">selected</c:if> >배송중</option>
					<option value="DELIVERED" <c:if test="${adminVO.status eq 'DELIVERED'}">selected</c:if> >배송완료</option>
					<option value="REFUNDED" <c:if test="${adminVO.status eq 'REFUNDED'}">selected</c:if> >환불</option>
				</select>
				<!-- <input type="text" name="paymentType" value="${adminVO.paymentType}" placeholder="결제방식을 입력해 주세요."> -->
				<label>결재방식 : </label>
				<select name="paymentType">
					<option value="CASH" <c:if test="${adminVO.paymentType eq 'CASH'}">selected</c:if> >현금</option>
					<option value="CARD" <c:if test="${adminVO.paymentType eq 'CARD'}">selected</c:if> >신용카드</option>
					<option value="VA" <c:if test="${adminVO.paymentType eq 'VA'}">selected</c:if> >가상계좌</option>
					<option value="MOBILE" <c:if test="${adminVO.paymentType eq 'MOBILE'}">selected</c:if> >휴대폰결제</option>
					<option value="PAY" <c:if test="${adminVO.paymentType eq 'PAY'}">selected</c:if> >카카오페이</option>
				</select>
				</c:if>
				
				<input type="submit" value="수정" class="w3-button w3-black">
			</form>		
		</section>
	</div>
	<c:import url="/admin/footer.do" />	
</body>
</html>