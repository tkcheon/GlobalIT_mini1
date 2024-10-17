package servlet.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.CommentVo;

/**
 * Servlet implementation class member_list
 */
@WebServlet("/post/commentlist.do")
public class CommentListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		 request.setCharacterEncoding("UTF-8");
        
        int p_idx = Integer.parseInt(request.getParameter("p_idx"));
        
        // 데이터 가져오기
        List<CommentVo> list = CommentDao.getInstance().selectCommentByPidx(p_idx);
        
        
        request.setAttribute("list", list);
        
        
        request.getRequestDispatcher("post_comment_list.jsp").forward(request, response);

	
	}
}