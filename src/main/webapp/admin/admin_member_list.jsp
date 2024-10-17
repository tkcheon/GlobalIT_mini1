<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

<!-- 공통 css 부분 링크 -->
<link rel="stylesheet" href="/common.css">


<script type="text/javascript">
	function del(f) {

		// 삭제 확인
		if (confirm("정말 삭제하시겠습니까?") == false)
			return;

		// 삭제 요청
		location.href = "admin_member_delete.do?m_idx=" + f.m_idx.value;

	}
	
	function reg(f) {
		// 회원 수정폼으로 이동 
		location.href = "admin_member_modify_form.do?m_idx=" + f.m_idx.value;

	}
</script>
<style type="text/css">
.box1 {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
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


</style>
</head>


<body>
	<!-- top -->
	<%@include file="../top.jsp"%> 

	<div class="box1">
		<h2>회원 관리</h2>
		<br>
		<table class="table table-striped table-hover">
			<tr class="mycolor">
				<th>회원번호</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th>구분</th>
				<th>권한수정</th>
				<th>회원탈퇴</th>
			</tr>

			<c:forEach var="mv" items="${ list }">
				<form>
					<input type="hidden" name="m_idx" value="${ mv.m_idx }">
					<tr>
						<td>${ mv.m_idx }</td>
						<td>${ mv.m_name }</td>
						<td>${ mv.m_id }</td>
						<td>${ mv.m_email }</td>
						<td>${ mv.m_rdate }</td>
						<c:if test="${ mv.m_type == 1}">
							<td>일반</td>
						</c:if>
						<c:if test="${ mv.m_type == 2}">
							<td>관리자</td>
						</c:if>
						
						<td><input class="button1" type="button" value="수정"
							onclick="reg(this.form)"></td>
						<td><input class="button1" type="button" value="탈퇴"
							onclick="del(this.form)"></td>
					</tr>
				</form>
			</c:forEach>

		</table>
	</div>

	<!-- footer -->
	<%@include file="../footer.jsp"%> 

</body>
</html>