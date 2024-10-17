package servlet.member;

import java.io.IOException;
import java.io.PrintWriter;

import dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Util;

/**
 * Servlet implementation class FindPasswordAction
 */
@WebServlet("/find-password.do")
public class FindPasswordAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String m_id = request.getParameter("m_id");
        String m_email = request.getParameter("m_email");

        // DB에서 아이디와 이메일 확인
        MemberDao dao = MemberDao.getInstance();
        String id = dao.getId(m_email);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        
        if (id != null && id.equals(m_id)) {
            // 아이디와 이메일이 맞다면 임시 비밀번호 생성
            String tempPassword = Util.generateTemporaryPassword();
            // 임시 비밀번호로 업데이트
            int res = dao.updatePassword(m_id, Util.MD5(tempPassword));

            if (res > 0) {
                // 이메일 전송
                Util.sendEmail(m_email, "임시 비밀번호", "귀하의 임시 비밀번호는: " + tempPassword);
				/* response.sendRedirect("login.jsp?message='임시 비밀번호가 이메일로 전송되었습니다.'"); */
                
				/* response.sendRedirect("login.jsp"); */
                
                
                writer.println("<script>alert('이메일로 비밀번호가 전송되었습니다'); location.href='login.jsp';</script>"); 
              
            
               
                
            } else {
//                response.sendRedirect("find-password.jsp?error=비밀번호 업데이트에 실패했습니다.");
                writer.println("<script>alert('비밀번호 업데이트에 실패했습니다.'); location.href='findpwd.jsp';</script>");
               
            }
            
        } else {
			/* response.sendRedirect("find-password.jsp?error=유효하지 않은 아이디 또는 이메일입니다."); */
            writer.println("<script>alert('유효하지 않은 아이디 또는 이메일입니다.'); location.href='findpwd.jsp';</script>");
            writer.close();
        }
        
    }
    
}