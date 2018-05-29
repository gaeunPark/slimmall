<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<nav class="block-center w3-bar">
			<a href="main.do" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == 0}">w3-green</c:if>"><b>홈</b></a>
			<c:forEach var="adminVO" items="${adminVOs}" varStatus="status">
				<a href="productList.do?categoryIdx=${adminVO.idx}" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == adminVO.idx}">w3-green</c:if>"><b>${adminVO.name}</b></a>
			</c:forEach>
		</nav>