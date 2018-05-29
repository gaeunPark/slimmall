<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>슬립몰</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css' />" />
</head>
<body>
	<div class="w3-border-bottom">
		<c:import url="/admin/header.do" />
	</div>
	<div class="w3-border-bottom w3-border-blue">
		<c:import url="/admin/nav.do" />
	</div>
	<div>
		<section class="block-center w3-container">
		<h4>상품추가</h4>
		
		<form action="ActionAddProduct.do" method="post" enctype="multipart/form-data">
			<p>이름: </p>
			<input type="text" name="name">
			<p>설명: </p>
			<input type="text" name="description">
			<p>가격: </p>
			<input type="number" name="price">
			<p>수량: </p>
			<input type="number" name="qty">
			<p>카테고리: </p>
			<select name="categoryIdx">
				<c:forEach var="categoryVO" items="${categoryVOs}">
				<option value="${categoryVO.idx}">${categoryVO.name}</option>
				</c:forEach>
			</select>
			<p>이미지: </p>
			<input type="file" name="imageFile" accept="image/*">
			<p>
			<input type="submit" value="추가하기" class="w3-button w3-black">
			</p>
		</form>
		</section>
	</div>
	<c:import url="/admin/footer.do" />	
</body>
</html>