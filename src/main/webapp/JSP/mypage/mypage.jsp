

<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


<link rel="stylesheet" href="/common.css">

<!-- BootStrap 3.x -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	function del(m_idx) {

		// 삭제 확인
		if (confirm("정말 탈퇴 하시겠습니까?") == false)
			return;

		
		// 삭제 요청
		location.href = "member_delete.do?m_idx=" + m_idx.value;

	}
</script>
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
	color: #748194;
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
		<h2>마이페이지</h2>
		<br>
		<!-- <form action="register.do" method="post"> -->
			<div class="mb-3">
				닉네임<input type="text" class="form-control" name="m_name"
					value="${ member.m_name }" disabled/>
			</div>
			<div class="mb-3">
				아이디<input type="text" class="form-field" name="m_id"
					value="${ member.m_id }" disabled />
			</div>
			<div class="mb-3">
                    이메일<input type="email" class="form-control" name="m_email" value="${ member.m_email }" disabled />
                </div>

			<div class="mb-3">
				소개글<input type="text" class="form-control" name="m_intro"
					value="${ member.m_intro }" disabled/>
			</div>
			
			
			<a href="member_modify_form.do"><button class="button1">수정</button></a>			
			<!-- <a href="member_delete.do" class="form-check-label">탈퇴하기</a> -->
			<button  class="button1" onclick="del(${ member.m_idx })" style="margin-top:40px;">탈퇴하기</button>
			<!-- <a href="../../main.do" class="form-check-label">취소</a> -->
			
				
			

	</div>

	<!-- footer -->
	<%-- <%@include file="../../footer.jsp"%>  --%>

</body>
</html>>
