package servlet.comment;

import java.io.IOException;
import java.io.PrintWriter;

import dao.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class DeptListAction
 */
@WebServlet("/post/comments_delete.do")
public class CommentDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 삭제할 idx 수신
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		int res = CommentDao.getInstance().commentDelete(c_idx);
		
		//메인화면이동
		//response.sendRedirect("post_one.do");
	
	}
}