<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@page import="util.Util"%>

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
#write{
	width:110px !important;
}
</style>
	
<script type="text/javascript">
	function post_insert(){
		// 로그인 체크 (안되어 있으면)
		if("${empty member}" == "true"){
			
			if(confirm("글쓰기는 로그인 후 가능합니다.\n로그인 하시겠습니까?") == false){
				return;
			}
			
			// 로그인 폼으로 이동 
			location.href = "login.jsp"; //현재 경로는 photo니까
			return;
		}
		
		// context Path를 구하는 방법 
		let hostIndex = location.href.indexOf( location.host ) + location.host.length;
		let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		                
		// 로그인이 된 경우 => 사진 등록 폼으로 이동 
		location.href = contextPath + "/post/insert_form.do"; 
	}//end:photo_insert()
	
</script>

</head>
<body>

	<!--화면 메인 네비게이션바 -->
	<header class="main-header py-3">
		<nav class="navbar navbar-expand-sm navbar-white bg-white">
			<div class="container-fluid">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/main.do?p_cate=침대"><img src="${pageContext.request.contextPath}/logoimage/logo.png" width="160" height="70" class="logo"></img></a>
				
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div class="collapse navbar-collapse" id="mynavbar">
					<ul class="navbar-nav ms-auto">
					<% 
						MemberVo mv = (MemberVo) session.getAttribute("member");
						if (mv != null && mv.getM_type() == 1){	%> <!-- 일반회원이 로그인한 경우 -->
		
						<li class="nav-item"><div class="nav-link">${ sessionScope.member.m_name }님 환영합니다.</div></li>
						<li class="nav-item"><a class="nav-link" id="nav-link-admin" href="${pageContext.request.contextPath}/JSP/mypage/mypage.do">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" id="link1" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
						
					<% } else if (mv != null && mv.getM_type() == 2){ %> <!-- 관리자가 로그인한 경우 -->
						<li class="nav-item"><div class="nav-link">${ sessionScope.member.m_name }님 환영합니다.</div></li>
						<li class="nav-item"><a class="nav-link" id="nav-link-admin" href="${pageContext.request.contextPath}/admin/memberlist.do">관리자페이지</a></li>
						<li class="nav-item"><a class="nav-link" id="link1" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>

					<%	} else { %> <!-- 로그인 안 한 경우 -->
						<li class="nav-item"><a class="nav-link" id="link1"
							href="${pageContext.request.contextPath}/login.jsp">로그인</a></li>
						
						<li class="nav-item"><a class="nav-link" id="link2"
							href="${pageContext.request.contextPath}/joinmember.jsp">회원가입</a></li>
						<% } 
						
						
						%>
						<li class="nav-item">
							<button type="button" id="write" class="button1" onclick="post_insert();">블로그 글쓰기</button>
							</li>
						</ul>
										
				</div>
			</div>
		</nav>
		
		<hr>
	</header>

</body>
</html>