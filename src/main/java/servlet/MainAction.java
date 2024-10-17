package servlet;

import java.io.IOException;
import java.util.List;

import dao.PostDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.PostVo;

/**
 * Servlet implementation class PostAction
 */

@WebServlet("/main.do")
public class MainAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 받은 정보 UTF-8로 인코딩
		request.setCharacterEncoding("UTF-8");
				
		String p_cate = request.getParameter("p_cate");
		
		List<PostVo> list = PostDao.getInstance().selectList(p_cate);
		
		request.setAttribute("list", list);

		//Dispatcher형식으로 호출
		String forward_page = "main-page.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
