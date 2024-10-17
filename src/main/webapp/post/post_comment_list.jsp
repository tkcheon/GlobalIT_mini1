<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:forEach var="vo"  items="${ list }">
	<form>
		<input type="hidden" name="m_name" value=${vo.m_name }>
		<input type="hidden" name="m_name" value=${vo.p_idx }>
		<input type="hidden" name="m_name" value=${vo.p_idx }>
		
		<div class="comment comment-content" >
		   <p>
		   		작성자&nbsp;&nbsp; ${vo.m_name }<br>
		   		작성일자&nbsp;&nbsp;${vo.c_mdate }<br><br>
		   		<strong>${ vo.c_content }</strong><br><br>
		   		<button class="button1" style="width:100px;" onclick="deleteComments(${ vo.c_idx});">댓글삭제</button>
		   </p> 
			
		    </form>
		   
		   <hr>
		   </div>
	  </form>
	</c:forEach>
	
	

</body>
</html>