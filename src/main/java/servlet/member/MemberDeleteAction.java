package servlet.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vo.MemberVo;

import java.io.IOException;
import java.net.URLEncoder;

import dao.MemberDao;

/**
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/JSP/mypage/member_delete.do") // 회원 탈퇴. 관리자페이지에서 회원삭제는 다른 파일에
public class MemberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberVo mv = (MemberVo) session.getAttribute("member");
		int m_idx = mv.getM_idx();
		
		System.out.println(m_idx);
		MemberDao.getInstance().memberDelete(m_idx);
		
		// 침대 키워드를 유니코드로 넘기기 
		response.sendRedirect("../../logout.do");
	}

}