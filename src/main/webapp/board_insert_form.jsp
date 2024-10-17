<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

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
	border-radius:10px;
}

.input-file-button {
	width: 500px;
	padding: 6px 50px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
	margin-bottom: 10px;
	text-align: center;
}

.img_upload {
	margin-top:20px;
	margin-bottom:20px;
	text-align: center;
}


.container {
	 width: 80%;
 }


#p_content{
	margin-top:-40px;
}

.th_h{
	margin-top:15px !important;
}



</style>

<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr("src", e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			$("#preview").attr("src", "");
		}
	}
	
	function send(f) {
		let p_title = f.p_title.value.trim();
		let p_content = f.p_content.value.trim();
		let p_cate = f.p_cate.value.trim();
		let p_filename = f.p_filename.value;

		if (p_title == '') {
			alert("제목을 입력하세요.");
			f.p_title.focus();
			return;
		}

		if (p_content == '') {
			alert("내용을 입력하세요.");
			f.p_content.focus();
			return;
		}

		if (p_cate == "") {
			alert("카테고리를 선택하세요.");
			f.p_cate.focus();
			return;
		}
		
		if (p_filename == "") {
			alert("사진을 선택하세요");
			return;
		}

		f.action = "../post/insert.do";
		f.submit();
	}
</script>
</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>

	<!-- navbar 옵션  -->
	<%@include file="../navbar.jsp"%>
	
	<main>
		<form method="POST" enctype="multipart/form-data">
			<div class="box">
				<img id="preview" src="">
			</div>
			<div class="img_upload">
				<label for="borad_image" class="button1" style="width:300px !important;">이미지 업로드</label> 
				<input id="borad_image" type="file" onchange="readURL(this);" name="p_filename" style="display: none;">
			</div>
			<div class="container">
			
			<table class="table">
				<tr>
					<th><p class="th_h">제목</p></th>
					<td><input class="form-control form-control-lg" type="text" name="p_title" placeholder="제목을 입력해주세요."></td>
				</tr>
				<tr>
					<th><p class="th_h">작성자</p></th>
					<td><input class="form-control mt-3" name="m_name" placeholder="${m_name}" disabled></td>
				</tr>
				<tr>
					<th><p class="th_h">카테고리</p></th>
					<td><select class="form-control mt-3" id="p_cate" name="p_cate" required>
						<option value="">카테고리 선택</option>
						<option value="침대">침대</option>
						<option value="소파">소파</option>
						<option value="식탁">식탁</option>
						<option value="의자">의자</option>
						<option value="수납장">수납장</option>
					</select></td>
				</tr>
				<tr>
					<th><p class="th_h">분류</p></th>
					<td>
						<div class="mt-3 ml-3">
							<input type="radio" id="p_type_1" name="p_type" value="1" checked>
							<label for="normal">일반</label> 
							<input type="radio" id="p_type_2" name="p_type" value="2">
							<label for="notice">공지</label>
						</div>
					</td>
				</tr>
				<tr>
					<th><p class="th_h">내용</p></th>
					<td>
						<div class="content mt-5">
							<textarea class="form-control" id="p_content" name="p_content" rows="15" placeholder="내용을 입력해주세요." oninput='this.style.height="", this.style.height= this.scrollHeight + "px"'></textarea>
						</div>
					</td>
				</tr>
				
						
					
			</table>
			<div class="container" style="text-align:center;">
					<input class="btn btn-success" type="button" value="목록보기" onclick="location.href='list.do?p_cate=침대'"> 
					<input class="btn btn-primary" type="button" value="글올리기" onclick="send(this.form);">
			</div>
			</div>
		</form>
	</main>

	<!-- top 옵션-->
	<%@include file="../footer.jsp"%>

</body>
</html>