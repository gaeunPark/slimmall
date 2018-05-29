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
		<h4>회원 추가</h4>
		
		<form action="ActionMemberAdd.do" method="post">
			<p>유저ID : </p>
			<input type="text" name="username" placeholder="유저ID를 입력해 주세요.">
			<p>비밀번호 : </p>
			<input type="text" name="password" placeholder="비밀번호를 입력해 주세요.">
			<p>이메일 : </p>					
			<input type="text" name="email" placeholder="이메일을 입력해 주세요.">
			<p>전화번호 : </p>
			<input type="text" name="phone" placeholder="전화번호를 입력해 주세요.">
			<p>주소 : </p>
			<input type="text" name="address" placeholder="주소를 입력해 주세요.">
			<p>
			<input type="submit" value="추가">
			</p>
		</form>	
		
			
		</section>
	</div>
	<c:import url="/admin/footer.do" />	
</body>
</html>