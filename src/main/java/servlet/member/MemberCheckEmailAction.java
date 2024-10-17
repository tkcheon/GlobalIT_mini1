package servlet.member;

import java.io.IOException;

import dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberVo;

/**
 * Servlet implementation class MemberCheckIdAction
 */
@WebServlet("/check_email.do")
public class MemberCheckEmailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1. 수신인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. 파라미터 받기
		String m_email = request.getParameter("m_email");
		
		//3. m_id에 해당되는 유저 정보 검색
		MemberVo vo = MemberDao.getInstance().selectMemberByMemail(m_email);
		
		boolean bResult = false;
		
		if(vo==null) {
			bResult=true;
		}else {
			bResult=false;
		}
		
		
		//4. 응답처리 
		response.setContentType("application/json; charset=utf-8");
				
		String json = String.format("{\"result\":%b}", bResult);
		
		response.getWriter().print(json);
		


	}

}
