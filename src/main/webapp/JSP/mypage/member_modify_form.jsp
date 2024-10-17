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
		<form action="member_modify.do" method="post">
			
			<div class="mb-3">
				닉네임<input type="text" class="form-control" name="m_name"
					value="${ member.m_name }" />
			</div>
			<div class="mb-3">
				아이디<input type="text" class="form-field" name="m_id"
					value="${ member.m_id }" disabled style="color:#748194;"/>
			</div>
			<div class="mb-3">
                    이메일<input type="email" class="form-control" name="m_email" value="${ member.m_email }" required />
                </div>
			<div class="mb-3">
				비밀번호
				<p style="margin-top: 10px; font-size: 13px; color: #4a4f5a;">영문,숫자를
					포함한 8자 이상의 비밀번호를 입력해주세요</p>
				<input type="password" class="form-control" name="m_pw"
					value="" />
			</div>

			<div class="mb-3">
				소개글<input type="text" class="form-control" name="m_intro"
					value="${ member.m_intro }"/>
			</div>


			<input class="button1" type="submit" value="회원정보수정" />
		</form>

		<div class="bottom">
			<a href="mypage.jsp">취소</a>
		</div>
	</div>
</body>
</html>