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
		<c:import url="/admin/nav.do?menu=1" />
	</div>
	<div>
		<section class="block-center w3-container">
		<h4>회원리스트</h4>
		
		<form action="deleteMember.do" method="post" onsubmit="return confirm('삭제 하시겠습니까?')">
		<table class="w3-table-all">
			<tr>
				<th>확인</th>
				<th>번호</th>
				<th>유저ID</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>휴대폰</th>
				<th>주소</th>
			</tr>
			<c:forEach var="memberVO" items="${memberVOs}">
			<tr>
				<td><input type="checkbox" name="idxes" value="${memberVO.idx}"></td>
				<td>${memberVO.idx}</td>
				<td>${memberVO.username}</td>
				<td>${memberVO.password}</td>
				<td>${memberVO.email}</td>
				<td>${memberVO.phone}</td>
				<td>${memberVO.address}</td>
			</tr>
		</c:forEach>
		</table>
		<p>
		<input type="submit" value="삭제" class="w3-button w3-black">
		<a href="memberAdd.do" class="w3-button w3-black">추가</a>
		<p>
		</form>
		</section>
	</div>
	<c:import url="/admin/footer.do" />	
</body>
</html>