package servlet.post;

import java.io.IOException;

import dao.PostDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.PostVo;

/**
 * Servlet implementation class PostModifyFormAction
 */

@WebServlet("/post/modify_form.do")
public class PostModifyFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 수정할 게시물의 idx를 받는다.
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));

		// 2. idx에 해당하는 게시물 1건 얻어오기
		PostVo vo = PostDao.getInstance().selectOne(p_idx);

		// textarea \n 기능처리 : <br>을 \n로 변환
		String content = vo.getP_content().replaceAll("<br>", "\n");
		vo.setP_content(content);
		System.out.println(content);

		// 3. request binding 아래 파일과 데이터 공유
		request.setAttribute("vo", vo);

		// Dispatcher형식으로 호출
//		String forward_page = "post_modify_form.jsp";  기존 
		String forward_page = "../board_modify_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
