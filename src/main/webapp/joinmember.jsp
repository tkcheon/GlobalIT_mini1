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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

.box1 input[type="text"], .box1 input[type="password"], .box1 input[type="email"]
	{
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

.container {
	width: 100%;
	padding-right: var(--bs-gutter-x, .75rem);
	padding-left: var(--bs-gutter-x, .75rem);
	margin-right: auto;
	margin-left: auto;
}

.p-2 {
	padding: 30px !important;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
	font-size: 20px;
}

.a_undo {
	text-align: center;
	margin-top: 20px;
}


</style>

<script type="text/javascript">
	
	
	 function check_name(){

		let m_name = $("#m_name").val();
		
		
		//서버에 현재 입력된 name를 체크요청
		$.ajax({
			url			:		"check_name.do",		//memberCheckIdAction
			data		:		{"m_name":m_name},
			
			dataType	:		"json",
			success		:		function(res_data){
				// res_data = {"reuslt":true} or {"result":false}
				if(res_data.result){
					$("#name_msg").html("사용 가능한 닉네임입니다.").css("color","blue");
	
				}else{
					$("#name_msg").html("이미 사용중인 닉네임입니다.").css("color","red");
				}
			},
			error		:		function(err){
				alert(err.responseText);
			}
		});	
	}	// end:check_name() 
	
	
	function check_id(){
		//회원가입 버튼 비 활성화 
		
		
		let m_id = $("#m_id").val();
		
		if(m_id.length < 3){
			$("#id_msg").html("아이디는 3자리 이상 입력해주세요").css("color","red");
			return;
		}
		
		
		//서버에 현재 입력된 ID를 체크요청
		$.ajax({
			url			:		"check_id.do",		//memberCheckIdAction
			data		:		{"m_id":m_id},
			
			dataType	:		"json",
			success		:		function(res_data){
				// res_data = {"reuslt":true} or {"result":false}
				if(res_data.result){
					$("#id_msg").html("사용가능한 아이디입니다.").css("color","blue");
					$("#btn_register").prop("disabled", false);
				}else{
					$("#id_msg").html("이미 사용중인 아이디입니다.").css("color","red");
					
				}
			},
			error		:		function(err){
				alert(err.responseText);
			}
		});			
	}	// end:check_id()
	
	
	function check_email(){
		//회원가입 버튼 비 활성화 		
		let m_email = $("#m_email").val()
		
		
		
		//서버에 현재 입력된 ID를 체크요청
		$.ajax({
			url			:		"check_email.do",		//memberCheckIdAction
			data		:		{"m_email":m_email},
			
			dataType	:		"json",
			success		:		function(res_data){
				// res_data = {"reuslt":true} or {"result":false}
				if(res_data.result){
					$("#email_msg").html("사용 가능한 email입니다.").css("color","blue");
				}else{
					$("#email_msg").html("이미 사용중인 email입니다.").css("color","red");
				}
			},
			error		:		function(err){
				alert(err.responseText);
			}
		});			
	}	// end:check_id()

	

	
		function send(f){
		
		
				
		const reg_m_pw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
		const reg_m_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
			if(!reg_m_email.test(f.m_email.value)){
				alert("이메일 주소 형식을 다시 확인해주세요");
				f.m_email.value="";
				f.m_email.focus();
				return;
			} 
		
			if(!reg_m_pw.test(f.m_pw.value)){
				alert("비밀번호는 영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요");
				f.m_pw.value="";
				f.m_pw.focus();
				return;
			}
		
			f.action="register.do";
			f.submit();
		}


</script>


</head>
<body>

	<!-- top -->
	<%@include file="top.jsp"%>


	<div class="box1">
		<h2>회원가입</h2>
		<br>
		<!-- <form action="register.do" method="post"> -->
		<form class="form-inline" method="post">
			<div class="mb-3">
				닉네임<input type="text" class="form-control" name="m_name" id="m_name" onkeyup="check_name();"
					placeholder="닉네임(2~15자)"required>
					<span id="name_msg"></span>
			</div>
			<div class="mb-3">
				아이디<input type="text" class="form-field" name="m_id" id="m_id" onkeyup="check_id();"
					placeholder="아이디" required>
					
					
					 <span id="id_msg"></span>
			</div>
			<div class="mb-3">
                    이메일<input type="email" class="form-control" name="m_email" id="m_email" onkeyup="check_email();"  placeholder="이메일" required />
                    <span id="email_msg"></span>
                </div>
			<div class="mb-3">
				비밀번호
				<p style="margin-top: 10px; font-size: 13px; color: #4a4f5a;"  >영문,숫자를
					포함한 8자 이상의 비밀번호를 입력해주세요</p>
				<input type="password" class="form-control" name="m_pw" 
					placeholder="비밀번호" required />
			</div>
			<!-- <div class="mb-3">
				비밀번호확인<input type="password" class="form-control" name="m_pw2"
					placeholder="비밀번호" required />
			</div> -->

			<div class="mb-3">
				소개글<input type="text" class="form-control" name="m_intro"
					placeholder="인사말" required />
			</div>


			<!-- <input class="button1" type="submit" value="회원가입" /> -->
			<input id="btn_register" class="button1" type="button" value="회원가입"
						onclick="send(this.form);" disabled>
			

		</form>
		
		<div class="a_undo">
			<a href="login.jsp">취소</a>
		</div>
	</div>
</body>
</html>