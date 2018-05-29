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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	function checkValid(message){
		var username = $('#username').val();
		var password = $('#password').val();
		var email = $('#email').val();
		var phone = $('#phone').val();
		var address = $('#address').val();
		
		if (username.length <5){
			alert("아이디가 5자 이하입니다.");
		} else if(password.length <5){
			alert("비밀번호가 5자 이하입니다.");			
		} else if(email.length <5){
			alert("이메일이 5자 이하입니다.");			
		} else if(phone.length <5){
			alert("전화번호가 5자 이하입니다.");			
		} else if(address.length <5){
			alert("주소가 5자 이하입니다.");			
		} else {
			return confirm(message);
		}
		return false;
	}
</script>

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
		<h4>회원가입</h4>
		<form action="signUp.do" method="post" onsubmit="return checkValid('가입 하시겠습니까?')">
			<p>유저ID : </p>
			<p><input type="text" name="username" id="username" onkeyup="alert('key up!!')"></p>
			<p>비밀번호 : </p>
			<p><input type="password" name="password" id="password"></p>
			<p>이메일 : </p>
			<p><input type="text" name="email" id="email"></p>
			<p>전화번호 : </p>
			<p><input type="text" name="phone" id="phone"></p>
			<p>주소 : </p>
			<p><input type="text" name="address" id="address"></p>
			<p><input type="submit" value="가입" class="w3-button w3-black"></p>
		</form>
		<button onclick="checkValid()">유효성체크</button>
		</section>
	</div>
	<c:import url="/footer.do" />
</body>
</html>