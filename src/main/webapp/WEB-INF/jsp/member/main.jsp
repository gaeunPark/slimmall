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
		<c:import url="/member/nav.do?menu=0" />
	</div>
	<div>
		<section class="block-center w3-container"></section>
	</div>
	<c:import url="/member/footer.do" />	
</body>
</body>
</html>
