<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 css 부분 링크 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common.css">

<style type="text/css">
.box1 {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
}

.box1 textarea, .box1 input[type="text"], .box1 input[type="password"],
	.box1 input[type="email"] {
	width: 100%;
	padding: 25px;
	margin: 10px 0 30px 0;
	outline: none;
	border: none;
	border-radius: 5px;
	background: #f5f5f5;
	color: black;
	font-size: 14px;
	height: 35px;
}

.button1 {
	width: 100%;
	padding: 10px;
	background-color: #00aaff;
	color: white;
	border: none;
	border-radius: 15px;
	cursor: pointer;
	margin-top:40px;
}

.button1:hover {
	background-color: #0088cc;
}


.profile-image {
	display: flex;
	align-items: center;
}

.profile-image img {
	margin-right: 20px;
	border-radius: 50%;
	width: 100px;
	height: 100px;
}

.bottom {
	text-align: center;
	margin-top: 30px;
}
</style>

</head>
<body>

	<!-- top -->
	<%@include file="../../top.jsp"%>
	
	<div class="box1">
		<h2>회원정보수정</h2>
		<br>
		<form action="admin_member_modify.do" method="post">
			회원 권한 설정 
			<input type="hidden" name="m_idx" value='${mv.m_idx}'>
			<select class="form-control mt-3" id="m_type" name="m_type" style="width:100%">
				<option value="1">일반</option>
				<option value="2">관리자</option>
			</select>
			<input class="button1" type="submit" value="회원정보수정" />
		</form>
	</div>
</body>
</html>