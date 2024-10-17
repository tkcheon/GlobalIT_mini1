package servlet.admin;

import java.io.IOException;

import dao.MemberDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberVo;

/**
 * Servlet implementation class DeptListAction
 */
@WebServlet("/admin/admin_member_modify_form.do")
public class AdminMemberModifyFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		MemberVo mv = MemberDao.getInstance().selectMemberByMidx(m_idx);
		request.setAttribute("mv", mv);
		
				
		// Dispather 형식으로 호출
		String forward_page = "admin_member_modify_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
