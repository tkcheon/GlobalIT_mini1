<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  Bootstrap  3.x  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function send(f){
	
		let c_content = f.c_content.value.trim();
	
		if(c_content==''){
			alert("댓글내용을 입력하세요");
			f.c_content.value="";
			f.c_content.focus();
			return;
		}
		
		f.action="modify.do";
		f.submit();
			
		}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		
	})
</script>


</head>
<body>
	<form>
		<input type="hidden" name="c_idx" value="${param.c_idx}">
		<div id="box">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>댓글 수정</h4>
				</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>회원아이디</th>
							<td><input class="form-control" name="m_id"
							value="${vo.m_id}" readonly="readonly"}></td>
						</tr>
						<tr>
							<th>댓글내용</th>
							<td><input class="form-control" name="c_content" value="${vo.c_content}"></td>
						</tr>
						<tr>
							<th>수정일자</th>
							<td><input class="form-control" name="c_mdate" value="${vo.c_mdate}"></td>
						</tr>
						
						<tr>
							<td colspan="2" align="center"><input
								class="btn btn-success" type="button" value="목록보기"
								onclick="location.href='list.do'"> <input
								class="btn btn-primary" type="button" value="수정하기"
								onclick="send(this.form);"></td>
						</tr>
					</table>
				
				</div>
			</div>	
		</div>
	</form>
</body>
</html>