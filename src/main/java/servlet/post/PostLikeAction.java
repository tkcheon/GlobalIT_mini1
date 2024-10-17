package servlet.post;

import java.io.IOException;
import java.io.PrintWriter;

import dao.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vo.MemberVo;

/**
 * Servlet implementation class PostAction
 */

@WebServlet("/post/like.do")
public class PostLikeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	        int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	        int p_hit = Integer.parseInt(request.getParameter("p_hit"));
	        
	        System.out.println(p_hit);
	        
	        // 현재 로그인된 세션에서 회원 id가져옴 
	        HttpSession session = (HttpSession) request.getSession();
	        MemberVo member = (MemberVo) session.getAttribute("member");
	        int m_idx = member.getM_idx(); 

	        PostDao.getInstance().isPostLikeOrScrap(m_idx, p_idx, 1);
	        
            // 업데이트된 좋아요 수 반환
            int cnt = PostDao.getInstance().getPostLikeCount(p_idx);
           
            response.setContentType("application/json; charset=utf-8;");
            PrintWriter out = response.getWriter();
            
            String json = String.format("{\"likes\":%d}", cnt);
    		response.getWriter().print(json);
  
	    }

}
