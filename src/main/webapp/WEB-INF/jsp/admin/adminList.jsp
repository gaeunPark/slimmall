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
</head>
<body>
	<div class="w3-border-bottom">
		<c:import url="/admin/header.do" />
	</div>
	<div class="w3-border-bottom w3-border-blue">
		<c:import url="/admin/nav.do?menu=${adminVO.tableName}" />
	</div>
	<div>
		<section class="block-center w3-container">
			<h3>${fn:toUpperCase(adminVO.tableName)} 리스트</h3>
			<form action="removeAdmins.do" method="post" onsubmit="return confirm('삭제 하시겠습니까?')">
			<table class="w3-table-all">
				<tr>		
					<th>확인</th>
					<th>번호</th>
					<c:if test="${adminVO.tableName == 'category'}">
					<th>이름</th>				
					</c:if>
					<c:if test="${adminVO.tableName == 'member'}">
					<th>유저ID</th>				
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>		
					</c:if>
					<c:if test="${adminVO.tableName == 'order'}">
					<th>회원번호</th>				
					<th>상품번호</th>
					<th>수량</th>
					<th>생성일</th>
					<th>수정일</th>
					</c:if>
					<c:if test="${adminVO.tableName == 'product'}">
					<th>이름</th>				
					<th>설명</th>
					<th>가격</th>
					<th>수량</th>
					<th>이미지</th>
					<th>카테고리번호</th>		
					</c:if>
					<c:if test="${adminVO.tableName == 'purchase'}">
					<th>주문번호</th>				
					<th>상태</th>
					<th>결재방식</th>
					</c:if>
				</tr>
				<c:forEach var="adminVO" items="${adminVOs}">
				<tr>
					<td><input type="checkbox" name="idxes" value="${adminVO.idx}"></td>
					<td><a href="adminSet.do?idx=${adminVO.idx}">${adminVO.idx}</a></td>		
					<c:if test="${adminVO.tableName == 'category'}">
					<td>${adminVO.name}</td>				
					</c:if>
					<c:if test="${adminVO.tableName == 'member'}">
					<td>${adminVO.username}</td>				
					<td>${adminVO.email}</td>
					<td>${adminVO.phone}</td>
					<td>${adminVO.address}</td>		
					</c:if>
					<c:if test="${adminVO.tableName == 'order'}">
					<td>${adminVO.memberIdx}</td>				
					<td>${adminVO.productIdx}</td>
					<td>${adminVO.qty}</td>
					<td>${adminVO.createTime}</td>
					<td>${adminVO.updateTime}</td>
					</c:if>
					<c:if test="${adminVO.tableName == 'product'}">
					<td>${adminVO.name}</td>				
					<td>${adminVO.description}</td>
					<td>${adminVO.price}</td>
					<td>${adminVO.qty}</td>
					<td>${adminVO.imageName}</td>
					<td>${adminVO.categoryIdx}</td>		
					</c:if>
					<c:if test="${adminVO.tableName == 'purchase'}">
					<td>${adminVO.orderIdx}</td>				
					<td>${adminVO.status}</td>
					<td>${adminVO.paymentType}</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
			<p>
			<input type="submit" value="삭제" class="w3-button w3-black">
			<a href="adminAdd.do?tableName=${adminVO.tableName}" class="w3-button w3-black">추가</a>
			</p>
			</form>
		</section>
	</div>
	<c:import url="/admin/footer.do" />	
</body>
</html>