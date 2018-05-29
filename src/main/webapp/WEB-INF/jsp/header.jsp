<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<header class="block-center w3-display-container">
			<div class="w3-display-left w3-xlarge"><a href="main.do">슬림몰</a></div>
			<ul id="gnb" class="w3-display-right w3-small">	
			<c:if test="${empty sessionScope.username}">
				<li><a href="join.do">회원가입</a></li>
				<li><a href="login.do">로그인</a></li>
				</c:if>
				<c:if test="${!empty sessionScope.username}">
				<li><a href="logout.do">로그아웃</a></li>
				<li><a href="member/cartList.do">장바구니</a></li>				
				<li><a href="member/main.do">마이페이지</a></li>
				</c:if>
				<c:if test="${sessionScope.username eq 'admin'}">
				<li><a href="admin/main.do">관리자</a></li>
				</c:if>				
			</ul>
		</header>