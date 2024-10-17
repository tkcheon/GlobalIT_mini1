<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상세보기</title>

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<style type="text/css">
body {
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
	border: 1px solid green;
}

.post-content h2 {
	margin: 0 0 10px 0;
	font-size: 24px;
}

.post-content p {
	/* 	margin: 0 0 10px 0; */
	font-size: 16px;
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
	border: 1px solid #ccc;
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

/* 게시판 사진 이미지 사이즈조절  */
#borad_image {
	width: 80%;
	height: 80%;
	/* border: 1px solid red; */
	margin: auto;
}

.container{
	width:80%;
}

.modify{
	text-align: center;
	align-items: center;

}

.img_upload {
	text-align: center;
}
.main-image{
	border-radius:10px;
	width: 700px !important;
	margin-bottom:30px !important;
}

</style>


<script type="text/javascript">

	//jQuery 초기화 과정 
    $(document).ready(function() {       
    	var p_idx = "${vo.p_idx}"; // 포스트의 고유 번호를 변수로 설정
    	

        // 페이지 로드 시 댓글 목록을 가져오는 함수 호출
        loadComments(p_idx);
    });
      
	
    // 댓글 목록을 가져와 화면에 표시하는 함수
    function loadComments(p_idx) {
        $.ajax({
            url: 'commentlist.do',
            type: 'GET',
            data: {
                'p_idx': p_idx
            },
            success: function(res_data) {
            	 $('#commentList').html(res_data); 
            },
            error: function(err) {
                alert(err.responseText);
            }
        });
    }
    
 	// 댓글 삭제 버튼 클릭 시 이벤트 처리
    function deleteComments(c_idx){
    	if(confirm("정말 삭제하시겠습니까?") == false) return; 
		
		location.href="comments_delete.do?c_idx=" + c_idx;
      }
   
    function addComment(form) {
        // jQuery Ajax를 이용한 댓글 추가
        $.ajax({
            url: "comments_insert.do",
            type: 'POST',
            data: {
                "p_idx": form.p_idx.value,
                "m_idx": form.m_idx.value,
                "m_name": form.m_name.value,
                "c_content": form.c_content.value
            },
            dataType: 'json',
            success: function(res_data) {
                if (res_data.result == true) {
                    alert("댓글이 등록되었습니다.");
                } else {
                    alert("댓글 등록에 실패하였습니다.");
                }
            },
            error: function(err) {
                alert("댓글 등록 중 오류가 발생하였습니다.");
            }
        });
    }
	
	
	function toggleLike(p_idx, p_hit) {
		/* const pushHeartBtn = document.querySelector(".heartBtn");
		pushHeartBtn.innerHTML = '<i class="fas fa-heart style="font-size:20px;"></i>';
		pushHeartBtn.style.color = 'red'; */
		
		// like.do로 이동해서 좋아요 +1 증가, 또 한번 눌렀을 땐 좋아요 -1
		$.ajax({
			url : 'like.do',
			data : {
				"p_idx" : p_idx,
				"p_hit" : p_hit
			},
			success : function(res_data) {
				$('#scrap-btn-' + p_idx).text(res_data.likes);
			}
		});
	}
	
	
	//게시글 삭제 부분
	function del(f){
		if(confirm("정말 삭제하시겠습니까?") == false) return;
		
		//삭제 요청
		location.href="delete.do?p_idx=" + f.p_idx.value + "&p_cate=" + f.p_cate.value;
		
	}	

	//게시글 수정 부분
	function modify_form(f) {
		location.href = "modify_form.do?p_idx=" + f.p_idx.value;

	}
</script>
</head>
<body>

	<!-- top 옵션-->
	<%@include file="../top.jsp"%>


	<main>
		<form class="form-inline">
		<!-- 포스트 이미지 시작  -->
		<div class="img_upload">
			<img src="../uploads/${ vo.p_filename }" class="main-image"
				id="borad_image">
		</div>
		<!-- 포스트 이미지 끝  -->
		<input type="hidden" name="p_idx" value="${vo.p_idx}">
		<input type="hidden" name="p_cate" value="${vo.p_cate}">
		<input type="hidden" name="p_hit" value="${vo.p_hit}">
		
		<!-- 포스트 내용 시작 -->
		<div class="container">
		<table class="table">
			
			<!-- 제목 + 내용 영역  -->
			<tr>
				<th>제목</th>
				<td><input class="form-control" type="text" name="p_title" value="${vo.p_title}" style="width:100%" disabled></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input class="form-control" name="m_name" placeholder="${vo.m_name}" style="width:100%" disabled></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><input class="form-control" name="p_hit" placeholder="${vo.p_hit}" style="width:100%" disabled></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><select class="form-control mt-3" style="width:100%" disabled>
					<option value=test>${vo.p_cate}</option>
					</select>
				</td>
			</tr>
			<tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea class="form-control" id="p_content" name="p_content" rows="15"  style="width:100%" 
					oninput='this.style.height="", this.style.height= this.scrollHeight + "px"' disabled>${vo.p_content}</textarea>
					
				</td>
			</tr>
			
			
			<tr>
				<th>분류</th>
				<td>
					<div class = "mt-3 ml-3">
					<c:if
						test="${ (vo.p_type eq 1) }">
					
					<input type="radio" id="p_type_1" name="p_type" value="1" checked>
						<label for="normal">일반</label> 
					</c:if>
					<c:if
						test="${ (vo.p_type eq 2) }">
						<input type="radio" id="p_type_2" name="p_type" value="2" checked>
						<label for="notice">중요</label>
					</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${fn:substring(vo.p_rdate,0 , 16)}시</td>
			</tr>
			<tr>
				<th>수정일자</th>
				<td>${fn:substring(vo.p_mdate,0 , 16)}시</td>
			</tr>	
			
		
		</table>
				
				<div class="modify mb-3">
					
					<c:if
						test="${ (sessionScope.member.m_type eq 2) or ( sessionScope.member.m_idx eq vo.m_idx ) }">
					<input class="btn" type="button"  value="수정하기" style="background-color: #00aaff; color:white;"
							onclick="modify_form(this.form);">
							
					
					<input class="btn" type="button"  value="삭제하기" style="background-color: #00aaff; color:white;"
						 	onclick="del(this.form);">
					 </c:if>
					<input class="btn" type="button"  value="메인으로" style="background-color: #00aaff; color:white;"
						 	onclick="location.href='list.do?p_cate=${vo.p_cate}'"><br><br>
					<button id="like-btn-${vo.p_idx}" onclick="toggleLike(${vo.p_idx}, ${vo.p_hit})" class="button1" style="width:100px;" >좋아요 ${vo.getLike()}</button>
				</div>
		</form>	
		
				<br><br><br>
				<!--  한지혜 추가 -->
				<form>
					<input type="hidden" name="p_idx" value="${vo.p_idx}">
					<input type="hidden" name="p_hit" value="${vo.p_hit}">
					<input type="hidden" name="m_idx" value="${sessionScope.member.m_idx}">
					<input type="hidden" name="m_name" value="${sessionScope.member.m_name}">
					<input type="hidden" name="p_cate" value="${vo.p_cate}">
			
					<div class="comment-form">
						<table class="table">
							<%-- <input type="hidden" name="m_idx" value="${m_idx}"> --%>
							<tr>
								<th>댓글 작성자</th>
								<td><input class="form-control" name="m_name"
									placeholder="${sessionScope.member.m_name}" disabled></td>

							</tr>
							<tr>
								<th>댓글 내용</th>			
								<td><textarea class="form-control" id="commentInput" style="width:100%" name="c_content" rows="4" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다."></textarea>
								<button onclick="addComment(this.form)" style="margin-top:10px; margin-bottom:10px;">댓글등록</button></td>
							</tr>
							
						</table>
							
						
							
					</div>
				</form>	

	
				<div style="font-size:20px; margin-top:40px;"><strong>댓글 목록</strong></div><br> 
				<div id="commentList"></div> <!-- 댓글 -->  
				
			</div>
			
	</main>
	
		<!-- top 옵션-->
	<%@include file="../footer.jsp"%>
</body>
</html>