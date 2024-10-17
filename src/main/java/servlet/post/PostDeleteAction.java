package servlet.post;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import dao.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostDeleteAction
 */

@WebServlet("/post/delete.do")
public class PostDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 1. 파라미터 받기 
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		String p_cate = request.getParameter("p_cate"); 
		
		
		System.out.println(p_cate);
		

		
		int res = PostDao.getInstance().delete(p_idx);
		
		response.sendRedirect("list.do?p_cate=" + URLEncoder.encode(request.getParameter("p_cate"),"UTF-8"));

	}

}
