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
#product-list {
	list-style-type: none;
	padding: 0;
}
#product-list li {
	width: 24.4%;
	display: inline-block;
}
#product-list li img {
	width: 100%;
}
</style>
</head>
<body>
	<div class="w3-border-bottom">
		<c:import url="/header.do" />
	</div>
	<div class="w3-border-bottom w3-border-green">
		<c:import url="/nav.do?menu=0" />
	</div>
	<div>
		<section class="block-center w3-container">
		<h4>로그인</h4>
		<form action="signIn.do" method="post" onsubmit="return confirm('로그인 하시겠습니까?')">
			<p>유저ID : </p>
			<p><input type="text" name="username" value="admin" autofocus></p>
			<p>비밀번호 : </p>
			<p><input type="password" name="password" value="admin"></p>
			<p><input type="submit" value="로그인" class="w3-button w3-black"></p>
		</form>
		</section>
	</div>
	<c:import url="/footer.do" />
</body>
</html>