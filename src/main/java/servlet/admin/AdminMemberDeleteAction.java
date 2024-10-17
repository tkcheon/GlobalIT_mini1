package servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vo.MemberVo;

import java.io.IOException;

import dao.MemberDao;

/**
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/admin/admin_member_delete.do") // 회원 탈퇴. 관리자페이지에서 회원삭제는 다른 파일에
public class AdminMemberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		MemberDao.getInstance().memberDelete(m_idx);
		
		response.sendRedirect("memberlist.do");
	}

}