package servlet.member;

import java.io.IOException;

import dao.MemberDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vo.MemberVo;

@WebServlet("/changepassword.do")
public class ChangePasswordAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String newPasswordr = request.getParameter("newPasswordr");
        int m_idx = Integer.parseInt(request.getParameter("m_idx"));

        MemberDao dao = MemberDao.getInstance();
        int result = dao.changePassword(oldPassword, newPassword, newPasswordr, m_idx);

        if (result == -2) {
            request.setAttribute("errorMessage", "새 비밀번호가 일치하지 않습니다.");
            RequestDispatcher disp = request.getRequestDispatcher("change_password.jsp");
            disp.forward(request, response);
        } else if (result == -1) {
            request.setAttribute("errorMessage", "비밀번호 변경에 실패했습니다. 예전 비밀번호를 확인하세요.");
            RequestDispatcher disp = request.getRequestDispatcher("change_password.jsp");
            disp.forward(request, response);
        } else {
            // 세션 업데이트
            MemberVo member = dao.selectMemberByMidx(m_idx);
            HttpSession session = request.getSession();
            session.setAttribute("member", member);

            response.sendRedirect("/JSP/main/mainpage(login_after).jsp");
        }
    }
}