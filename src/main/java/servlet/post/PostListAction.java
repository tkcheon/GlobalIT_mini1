package servlet.post;

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

@WebServlet("/post/list.do")
public class PostListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String p_cate = request.getParameter("p_cate");
		
		List<PostVo> list = PostDao.getInstance().selectList(p_cate);
		
		request.setAttribute("list", list);

		//Dispatcher형식으로 호출
//		String forward_page = "post_list.jsp"; 기존 게시글 목록 화면 
		String forward_page = "../main.do?p_cate="+p_cate;
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
