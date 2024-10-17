package servlet.admin;

import java.io.IOException;

import dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vo.MemberVo;

/**
 * Servlet implementation class DeptListAction
 */
@WebServlet("/admin/admin_member_modify.do")
public class AdminMemberModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
        // 수정된 정보 가져오기
		String m_idx = request.getParameter("m_idx");
		int m_type = Integer.parseInt(request.getParameter("m_type"));
		
		
		// DB 등록
		MemberDao dao = MemberDao.getInstance();
		
        // 회원 타입만 바꾸는 DAO 만들기 
        dao.memberUpdateType(m_idx, m_type);
		
        response.sendRedirect("memberlist.do");
	}

}