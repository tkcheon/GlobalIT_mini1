package servlet.post;

import java.io.IOException;
import java.util.List;

import dao.CommentDao;
import dao.PostDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.CommentVo;
import vo.PostVo;

/**
 * Servlet implementation class PostAction
 */

@WebServlet("/post/post_one.do")
public class PostOneAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			// 1. parameter받기
	        int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	        int p_hit = Integer.parseInt(request.getParameter("p_hit"));
	        
	        // 2. p_idx에 해당되는 게시글 정보 얻어온다
	        PostVo vo = PostDao.getInstance().selectOne(p_idx);
	        
	        request.setAttribute("vo", vo); // 게시글 정보 저장  
	        
	        List<CommentVo> c_list = CommentDao.getInstance().selectCommentByPidx(p_idx); // 댓글 리스트 가져오기 
			request.setAttribute("c_list", c_list); // 댓글 리스트 request 영역에 저장 

			PostDao.getInstance().hit_update(p_hit, p_idx);	//게시글 클릭시 조회수 증가
			
			//Dispatcher형식으로 호출
//			String forward_page = "post_one.jsp";
			String forward_page = "../post_one.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
	                    
	      
	    }

}
