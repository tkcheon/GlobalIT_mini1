package servlet.admin;

import java.io.IOException;
import java.util.List;

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
@WebServlet("/admin/memberlist.do")
public class AdminMemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		// 데이터 가져오기
		List<MemberVo> list = MemberDao.getInstance().selectMemberList();
		// request binding
		request.setAttribute("list", list);
		
		// Dispather 형식으로 호출
		String forward_page = "admin_member_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}