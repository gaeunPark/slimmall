<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Mini Mall</title>
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
		<c:import url="/member/nav.do?menu=1" />
	</div>
	<div>
		<section class="block-center w3-container">
			<form action="setMember.do" method="post" onsubmit="return confirm('수정 하시겠습니까?')">				
				<p>유저ID : </p>
				<p><b>${adminVO.username}</b></p>
				<p>비밀번호 : </p>
				<p><input type="password" name="password" value="${adminVO.password}"></p>
				<p>이메일 : </p>
				<p><input type="eamil" name="email" value="${adminVO.email}"></p>
				<p>전화번호 : </p>
				<p><input type="tel" name="phone" value="${adminVO.phone}"></p>
				<p>주소 : </p>
				<p><input type="text" name="address" value="${adminVO.address}"></p>
				<input type="hidden" name="idx" value="${adminVO.idx}">
				<input type="hidden" name="username" value="${adminVO.username}">
				<p><input type="submit" value="수정" class="w3-button w3-black"></p>
			</form>
		</section>
	</div>
	<c:import url="/member/footer.do" />	
</body>
</body>
</html>
