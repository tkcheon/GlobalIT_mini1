<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 공통 css 부분 링크 -->
<link rel="stylesheet" href="/common.css"><style type="text/css">
.box1 {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
}

.title {
	font-size: 40px;
}

.box1 input[type="text"], .box1 input[type="password"], .box1 input[type="email"]
	{
	width: 100%;
	padding: 25px;
	margin: 10px 0 10px 0;
	outline: none;
	border: none;
	border-radius: 5px;
	background: #f5f5f5;
	color: #748194;
	font-size: 14px;
	height: 35px;
}



.button1:hover {
	background-color: #0088cc;
}


.remember {
	margin-bottom: 20px;
	color: #4a4f5a;
	font-size: 13px;
}

.bottom {
	text-align: center;
	margin-top: 30px;
}

.a_undo{
	margin-right:20px;
}

</style>

<title>로그인을 해주세요</title>
</head>
<body>

	<!-- top -->
	<%@include file="top.jsp"%>


	<div class="box1">
		<div class="login">
			<h2 class="title">Login</h2>

			<%
			Object loginObj = request.getAttribute("loginError");
			if (loginObj != null) {
				String errorMessage = "" + loginObj;
			%>
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<strong>아이디 및 비밀번호가 틀리셨습니다.</strong><br><%=errorMessage%>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<%
			}
			%>

			<form action="login.do" method="post">

				<input type="text" class="form-field" name="m_id" placeholder="아이디"
					required /> <input type="password" class="form-field" name="m_pw"
					placeholder="비밀번호" required />


		<!-- 		<div class="remember">
					<input name="remember" type="checkbox">&nbsp;&nbsp;아이디 기억하기
				</div> -->
		
				<input class="button1" type="submit" value="로그인" /> 
				<div class="bottom">
				<a href="main-page.jsp" class="a_undo">취소</a>
				<a href="joinmember.jsp" style="margin-top:50px;">회원가입</a>
				<a href="findpwd.jsp" class="form-check-label"  
					style="margin-left: 30px;">비밀번호 찾기</a>
				</div> 
				
				
			</form>
	</div>
	</div>

</body>
</html>