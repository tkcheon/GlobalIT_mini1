<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



<style type="text/css">

 

body {
    font-family: 'Noto Sans KR', sans-serif;
}

.catefont {
	font-size: 26px !important;
	margin-right: 30px;
	margin-left: 30px;
}

.catefont > a:hover {
	color: #0D6EFD !important;
	text-shadow: 0.5px 0.5px 0.5px #051AB8;
}

/* .helpme{
	margin-bottom: 100px !important;
} */

</style>
</head>
<body>
<!-- 목차 공간  -->
  <div class="container menu">
	<div class="nav-scroller">
		<ul class="nav justify-content-center helpme">
			<li class="nav-item catefont"><a class="nav-link" href="${pageContext.request.contextPath}/main.do?p_cate=침대">침대</a></li>
			<li class="nav-item catefont"><a class="nav-link" href="${pageContext.request.contextPath}/main.do?p_cate=소파">소파</a></li>
			<li class="nav-item catefont"><a class="nav-link" href="${pageContext.request.contextPath}/main.do?p_cate=식탁">식탁</a></li>
			<li class="nav-item catefont"><a class="nav-link" href="${pageContext.request.contextPath}/main.do?p_cate=의자">의자</a></li>
			<li class="nav-item catefont"><a class="nav-link" href="${pageContext.request.contextPath}/main.do?p_cate=수납장">수납장</a></li>
		</ul>
   
 	 </div>
  </div>
  <hr>
 
</body>
</html>