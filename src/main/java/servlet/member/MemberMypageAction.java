package servlet.member;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
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

@WebServlet("/JSP/mypage/mypage.do")
public class MemberMypageAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = (HttpSession) request.getSession();
		MemberVo member  = (MemberVo) session.getAttribute("member");
		
		
		request.setAttribute("member", member);
		
	
		//Dispatcher형식으로 호출
		String forward_page = "mypage.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	    }

}
