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
		<c:import url="/admin/nav.do?menu=3" />
	</div>
	<div>
		<section class="block-center w3-container">
		<h4>상품리스트</h4>
		<table class="w3-table-all">
				<tr>		
					<th>확인</th>
					<th>번호</th>
					<th>이름</th>				
					<th>설명</th>
					<th>가격</th>
					<th>수량</th>
					<th>이미지이름</th>
					<th>카테고리번호</th>			
				</tr>
				<c:forEach var="productVO" items="${productVOs}">
				<tr>
					<td><input type="checkbox" name="idxes" value="${productVO.idx}"></td>
					<td>${productVO.idx}</td>		
					<td>${productVO.name}</td>				
					<td>${productVO.description}</td>
					<td>${productVO.price}</td>
					<td>${productVO.qty}</td>
					<td>${productVO.imageName}</td>	
					<td>${productVO.categoryIdx}</td>	
				</tr>
				</c:forEach>
			</table>
		
		
		<a href="productAdd.do" class="w3-button w3-black">추가</a>
		
		</section>
	</div>
	<c:import url="/admin/footer.do" />	
</body>
</html>