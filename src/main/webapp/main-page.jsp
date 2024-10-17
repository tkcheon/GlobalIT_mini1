<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetHome</title>

<!-- 공통 css 부분 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common.css">

<style type="text/css">
.p-2 {
	padding: 30px !important;
}


#carouselExampleCaptions {
	width: 70%;
	padding-right: var(--bs-gutter-x, .75rem);
	padding-left: var(--bs-gutter-x, .75rem);
	margin-right: auto;
	margin-left: auto;
	margin-bottom: 50px;
	margin-top: 50px;
}

.container-fluid {
	margin-left: 30px;
	margin-right: 30px;
}

.container-fluid a {
	margin-right: 10px;
}

.album {
	margin-top: 30px;
	margin-bottom: 30px;
}

.banner {
	margin-bottom: 20px;
}

.portfolio-image {
	width: 90%;
	height: 250px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

img:not(.logo) {
	border-radius: 3%;
	width: 100%;
	height: 100%;
}

.portfolio {
	text-align: left;
	width: 90%;
}

.portfolio-cate {
	margin-top: 10px;
	font-size: 13px;
	color: #0F3758;
} 

.portfolio-title{
	font-size:15px;
	margin-top: -10px;
	margin-bottom: 30px;
	
}

</style>

</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>

	<!-- navbar 옵션  -->
	<%@include file="../navbar.jsp"%>

	<!-- 대표 배너 시작 -->
		<div class="container banner">
			<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/uploads/1.png" class="d-block w-100 rounded" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>감성있는 스타일의 공간으로 만드는 비법</h5>
						</div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/uploads/2.png" class="d-block w-100 rounded" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>꿉꿉한 스타일에서 올 화이트톤의 순수한 스타일로</h5>
							</div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/uploads/3.png" class="d-block w-100 rounded" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>혼자서 홈스타일링하기 좋은 Blog</h5>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	<!-- 대표 배너 마지막 -->
	
	<!-- 아이템 이미지 -->
	<div class="container">
		<div class="row grid album">
		
			<c:forEach var="vo" items="${ list }">
			
				<div class="col-lg-4 col-sm-6 item" data-type="market">
				
					<a href="${pageContext.request.contextPath}/post/post_one.do?p_idx=${vo.p_idx}&p_hit=${vo.p_hit}">
					
					
						<div class="portfolio-image rounded"><img src="${pageContext.request.contextPath}/uploads/${vo.p_filename}"></div>
					
						<p class="portfolio-cate">${vo.p_cate}</h4>
						
						
						
						<!-- 일반 -->
						<c:if
						test="${ (vo.p_type eq 1) }">
						<h4 class="portfolio-title">${vo.p_title}</h4>
						</c:if>
						
						<!-- 중요 -->
						<c:if
						test="${ (vo.p_type eq 2) }">
						<h4 class="portfolio-title" style="color:#EA4335;">${vo.p_title}</h4>
						</c:if>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>

	
	<!-- footer 공간  -->
	<%@include file="footer.jsp" %>
		
</body>
</html>
