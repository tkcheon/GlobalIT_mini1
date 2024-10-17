package servlet.comment;

import java.io.IOException;
import java.io.PrintWriter;

import dao.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.CommentVo;

/**
 * Servlet implementation class PostInsertFormAction
 */

@WebServlet("/post/comments_insert.do")
public class CommentInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

request.setCharacterEncoding("UTF-8");
        
        // 파라미터 값 가져오기
        int p_idx = Integer.parseInt(request.getParameter("p_idx"));
        int m_idx = Integer.parseInt(request.getParameter("m_idx"));
        String m_name = request.getParameter("m_name");
        String c_content = request.getParameter("c_content");
        
        // 새 댓글 객체 생성
        CommentVo vo = new CommentVo(p_idx, m_idx, c_content, m_name);
        
        // 댓글 추가
        int res = CommentDao.getInstance().commentInsert(vo);
        
        // 응답 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        // 결과 JSON 형식으로 응답
        out.print("{\"result\": " + res + "}");
        out.flush();
    }
    
    
}