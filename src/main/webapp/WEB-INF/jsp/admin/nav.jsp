<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="block-center w3-bar">
	<a href="main.do" class="w3-bar-item w3-button w3-padding-large <c:if test="${empty menu}">w3-blue</c:if>"><b>메인</b></a>
	<a href="adminList.do?tableName=category" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == 'category'}">w3-blue</c:if>"><b>카테고리</b></a>
	<a href="adminList.do?tableName=product" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == 'product'}">w3-blue</c:if>"><b>상품관리</b></a>
	<a href="adminList.do?tableName=order" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == 'order'}">w3-blue</c:if>"><b>주문관리</b></a>
	<%-- <a href="adminList.do?tableName=purchase" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == 'purchase'}">w3-blue</c:if>"><b>결제관리</b></a> --%>
	<a href="adminList.do?tableName=member" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == 'member'}">w3-blue</c:if>"><b>회원관리</b></a>
	<a href="memberList.do" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == '1'}">w3-blue</c:if>"><b>회원관리</b></a>
	<a href="orderList.do" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == '2'}">w3-blue</c:if>"><b>주문관리</b></a>
	<a href="productList.do" class="w3-bar-item w3-button w3-padding-large <c:if test="${menu == '3'}">w3-blue</c:if>"><b>상품관리</b></a>

</nav>	

