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
			<h3>${fn:toUpperCase(adminVO.tableName)} 추가</h3>
			<form action="addAdmin.do" method="post" onsubmit="return confirm('추가 하시겠습니까?')">
			
				<c:if test="${adminVO.tableName == 'category'}">
				<label>이름 : </label>
				<input type="text" name="name" placeholder="이름을 입력해 주세요.">				
				</c:if>
				<c:if test="${adminVO.tableName == 'member'}">
				<label>유저ID : </label>
				<input type="text" name="username" placeholder="유저ID를 입력해 주세요.">
				<label>비밀번호 : </label>
				<input type="text" name="password" placeholder="비밀번호를 입력해 주세요.">
				<label>이메일 : </label>					
				<input type="text" name="email" placeholder="이메일을 입력해 주세요.">
				<label>전화번호 : </label>
				<input type="text" name="phone" placeholder="전화번호를 입력해 주세요.">
				<label>주소 : </label>
				<input type="text" name="address" placeholder="주소를 입력해 주세요.">		
				</c:if>
				<c:if test="${adminVO.tableName == 'order'}">
				<label>회원번호 : </label>
				<input type="number" name="memberIdx" placeholder="회원번호를 입력해 주세요.">
				<label>제품번호 : </label>				
				<input type="number" name="productIdx" placeholder="제품번호를 입력해 주세요.">
				<label>수량 : </label>
				<input type="number" name="qty" placeholder="수량을 입력해 주세요.">
				</c:if>
				<c:if test="${adminVO.tableName == 'product'}">
				<label>이름 : </label>
				<input type="text" name="name" placeholder="이름을 입력해 주세요.">
				<label>설명 : </label>				
				<input type="text" name="description" placeholder="설명을 입력해 주세요.">
				<label>가격 : </label>
				<input type="number" name="price" placeholder="가격을 입력해 주세요.">
				<label>수량 : </label>
				<input type="number" name="qty" placeholder="수량을 입력해 주세요.">
				<%-- <input type="text" name="imageName" placeholder="이미지를 입력해 주세요."> --%>	
				<label>이미지 : </label>									
				<select name="imageName">
					<option value="jeans1.jpg">jeans1.jpg</option>
					<option value="jeans2.jpg">jeans2.jpg</option>
					<option value="jeans3.jpg">jeans3.jpg</option>
					<option value="jeans4.jpg">jeans4.jpg</option>
				</select>
				<label>카테고리번호 : </label>	
				<input type="number" name="categoryIdx" placeholder="카테고리번호를 입력해 주세요.">		
				</c:if>
				<c:if test="${adminVO.tableName == 'purchase'}">
				<label>주문번호 : </label>
				<input type="number" name="orderIdx" placeholder="주문번호을 입력해 주세요.">
				<!-- <input type="text" name="status" placeholder="상태을 입력해 주세요."> -->
				<label>상태 : </label>
				<select name="status">
					<option value="ORDERED">주문완료</option>
					<option value="PAYED">결재완료</option>
					<option value="DELIVERY">배송중</option>
					<option value="DELIVERED">배송완료</option>
					<option value="REFUNDED">환불</option>
				</select>
				<!-- <input type="text" name="paymentType" placeholder="결제방식을 입력해 주세요."> -->
				<label>결제방식 : </label>
				<select name="paymentType">
					<option value="CASH">현금</option>
					<option value="CARD">신용카드</option>
					<option value="VA">가상계좌</option>
					<option value="MOBILE">휴대폰결제</option>
					<option value="PAY">카카오페이</option>
				</select>
				</c:if>
				
				<input type="submit" value="추가" class="w3-button w3-black">
			</form>		
		</section>
	</div>
	<c:import url="/admin/footer.do" />	
</body>
</html>