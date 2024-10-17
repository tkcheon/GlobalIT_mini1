<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	function send(f) {
		let p_title = f.p_title.value.trim();
		let p_content = f.p_title.value.trim();
		let p_cate = f.p_title.value.trim();
		let p_type = f.p_title.value.trim();

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

		if (p_type == '') {
			alert("구분을 선택하세요");
			f.p_type.value = "";
			f.p_type.focus();
			return;
		}

		f.action = "modify.do";
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
	<form>
		
		<!-- /modify_form.do?idx=10&no=1 수정할 경우에 이렇게 넘어옴 -->
		<input type="hidden" name="p_idx" value="${param.p_idx}">
		
		<input type="hidden" name="no" value="${param.no}">
		<div id="box">
			<!-- Bootstrap panel -->
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>수정하기</h4>
				</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>제목</th>
							<!-- 필수입력사항 required="required" -->
							<td><input class="form-control" name="p_title" value="${vo.p_title }"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" rows="6" name="p_content">${vo.p_content }</textarea>
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><select class="form-control" id="category" name="p_cate">
									<option value="">카테고리 선택</option>
									<option value="테이블">테이블</option>
									<option value="침대">침대</option>
									<option value="수납장">수납장</option>
							</select></td>
						</tr>
						<c:if test="${ (sessionScope.member.m_type eq 2) }">
						<tr>
							<th>구분</th>
							<td>
								<input type="radio" id="p_type_1" name="p_type"	value="1" checked> 
									<label for="normal">일반</label> 
								<input	type="radio" id="p_type_2" name="p_type" value="2">
									<label	for="notice">공지</label></td>
						</tr>
						</c:if>
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