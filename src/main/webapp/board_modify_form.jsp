<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

.main_img {
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border: 1px solid blue;
	display: flex;
	justify-content: center;
	align-items: center;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 0;
}

.header div {
	font-size: 20px;
}

.header input {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.header button {
	padding: 5px 10px;
	background-color: #00aaff;
	color: white;
	border: none;
	cursor: pointer;
}

.main-image {
	width: 100%;
	height: auto;
	margin-bottom: 20px;
	object-fit: cover;
}

.post-content {
	margin-bottom: 20px;
	width: 100%;
	margin: auto;
}

.post-content h2 {
	margin: 0 0 10px 0;
	font-size: 24px;
}

.post-content p {
	/* 	margin: 0 0 10px 0; */
	font-size: 16px;
}

.hashtags {
	color: #00aaff;
	margin-bottom: 10px;
	width: 100%;
	margin: auto;
}

.hashtags a {
	text-decoration: none;
	color: #00aaff;
	margin-right: 10px;
}

.stats {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	width: 100%;
	margin: auto;
}

.stats div {
	color: #666;
}

.gallery {
	display: flex;
	overflow-x: auto;
	margin-top: 20px;
	width: 100%;
	margin: auto;
}

.gallery img {
	width: 100px;
	height: 100px;
	/* margin-right: 10px; */
}

.more-button {
	width: 100px;
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #eee;
	cursor: pointer;
}

.comments {
	margin-bottom: 20px;
}

.comment {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.comment img {
	border-radius: 50%;
	width: 40px;
	height: 40px;
	margin-right: 10px;
}

.comment-content {
	background-color: #f1f1f1;
	padding: 10px;
	border-radius: 10px;
	width: 100%;
}

.comment-form {
	display: flex;
	align-items: center;
}

.comment-form input {
	width: 100%;
	padding: 10px;
	border-radius: 10px;
	margin-right: 10px;
}

.comment-form button {
	padding: 10px 20px;
	background-color: #00aaff;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 10px;
}

#borad_image {
	width: 80%;
	height: 80%;
	/* border: 1px solid red; */
	margin: auto;
	overflow: hidden;
}

/* 게시판 업로드 사진 미리보기 크기 설정 공간 */
.box {
	width: 800px;
	height: 600px;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

#preview {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 5px;
}


#p_content {
	margin-top: 10px;
	width: 100%;
	resize: none;
	color: black;
}

.img_upload {
	text-align: center;
	align-items: center;
	
}

.modify{
	text-align: center;
	align-items: center;

}
.button1{
	width:300px !important;
}

.th_h{
	margin-top:15px !important;
}

</style>
<script type="text/javascript">
	function addLike() {
		const pushHeartBtn = document.querySelector(".heartBtn");
		pushHeartBtn.innerHTML = '<i class="fas fa-heart style="font-size:20px;"></i>';
		pushHeartBtn.style.color = 'red';
	}

	function addBookmark() {
		const pushBookmarkBtn = document.querySelector(".BookmarkBtn");
		pushBookmarkBtn.innerHTML = '<i class="fas fa-bookmark" style="font-size:20px;"></i>';
		pushBookmarkBtn.style.color = 'gray';
	}
</script>

<script type="text/javascript">

	/* 포스트 이미지 미리보기 시작 */
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr("src", e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			$("#preivew").attr("src", "");
		}
	}
	/* 포스트 이미지 미리보기 끝 */
	
	
	function send(f) {
		
		let p_title = f.p_title.value.trim();
		let p_content = f.p_content.value.trim();
		let p_cate = f.p_cate.value.trim();
		let p_filename = f.p_filename.value.trim();
		let p_type = f.p_type.value.trim();
		

		if (p_title == '') {
			alert("제목을 입력하세요");
			f.p_title.value = "";
			f.p_title.focus();
			return;
		}

		if (p_content == '') {
			alert("내용을 입력하세요");
			f.p_content.value = "";
			f.p_content.focus();
			return;
		}

		if (p_cate == '') {
			alert("카테고리를 선택하세요");
			f.p_cate.value = "";
			f.p_cate.focus();
			return;
		}
		
		if (p_filename == '') {
			alert("파일을 선택하세요");
			f.p_filename.value = "";
			f.p_filename.focus();
			return;
		}

		

		f.action = "../post/modify.do?p_idx="+f.p_idx.value+"&p_title="+f.p_title.value+"&p_cate="+f.p_cate.value+"&p_filename="+f.p_filename.value+"&p_type="+f.p_type.value;
		f.submit();
	}
	
</script>
<script type="text/javascript">
	$(document).ready(function(){
		//select태그에 name=mem_grade인 것
		//select기법이 jquery기법과 동일
		//element + attribute selector (속성 선택)사용
		$("select[name='p_cate']").val("${vo.p_cate}");
		
	})
	
</script>

</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>


	<main>

	
		<form method="POST" enctype="multipart/form-data">
			<!-- <input type="file" multiple="multiple" style="display:none;" > -->
		<!-- /modify_form.do?idx=10&no=1 수정할 경우에 이렇게 넘어옴 -->
		<input type="hidden" name="p_idx" value="${vo.p_idx}">
		<input type="hidden" name="p_filename" value="${vo.p_filename}">
	
		
		
		<!-- 포스트 이미지 공간 시작 -->
		<div class="container">
			<div class="box">
				<img id="preview" src="../uploads/${ vo.p_filename }" width="100%" height="100%" alt="이미지">
			</div>
			
			<div class="img_upload">
				<label for="borad_image" class="button1" style="width:300px; margin-top:20px;">이미지 업로드</label> 
				
				<input	id="borad_image" type="file" name="photo1" value="${vo.p_filename }" onchange="readURL(this);" 
				style="display: none;">
			</div>
		<!-- 포스트 이미지 공간 끝 -->
		
		
		
		
		

		</div>
			<div class="container">
				<table class="table">
					<!-- 제목 공간 시작 -->
					<tr>
						<th><p class="th_h">제목</p></th>
						<td><input class="form-control form-control-lg" type="text" name="p_title" value="${vo.p_title }"></td>
					</tr>	
					
					<tr>
						<th><p class="th_h">작성자</p></th>
						<td><input class="form-control mt-3" name="m_name" placeholder="${vo.m_name }" value="${vo.m_name }" disabled></td>
					</tr>
					
					<tr>
						<th><p class="th_h">카테고리</p></th>
						<td><select class="form-control mt-3" id="p_cate" name="p_cate" required>
							<option value="">${vo.p_cate}</option>
							<option value="침대">침대</option>
							<option value="소파">소파</option>
							<option value="식탁">식탁</option>
							<option value="의자">의자</option>
							<option value="수납장">수납장</option>
							</select>
						</td>
					</tr>
						
					<tr>
						<th><p class="th_h">분류</p></th>
						<td>
							<div class="mt-3 ml-3">
								<input type="radio" id="p_type_1" name="p_type"	value="1" checked> 
									<label for="normal">일반</label> 
								<input	type="radio" id="p_type_2" name="p_type" value="2">
									<label	for="notice">중요</label>
							</div>
						</td>
					</tr>
					<tr>
					<th><p class="th_h">내용</p></th>
					<td>
						<textarea class="form-control" id="p_content" name="p_content" rows="15" style="width:100%" 
						oninput='this.style.height="", this.style.height= this.scrollHeight + "px"'>${vo.p_content}</textarea>
						
					</td>
				</tr>
			</table>
		</div>
			<!-- 목록보기 / 올리기 공간 시작 -->
		
				<div class="modify mt-3 mb-3">
					<input class="btn" type="button" value="목록보기" style="background-color: #00aaff; color:white;"
						onclick="location.href='list.do'"> 
					<input	class="btn" type="button" value="수정하기" style="background-color: #00aaff; color:white;"
					onclick="send(this.form);">
				</div>
			
			<!-- 목록보기 / 올리기 공간 끝 -->
			
		</form>
		
	</main>

	<!-- top 옵션-->
	<%@include file="../footer.jsp"%>

</body>
</html>