package servlet.post;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;

import dao.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.MemberVo;
import vo.PostVo;

/**
 * Servlet implementation class PostInsertAction
 */


@WebServlet("/post/insert.do")
@MultipartConfig
public class PostInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 0. 수신인코딩 설정을 해야한다
		request.setCharacterEncoding("utf-8");
		
		// 1. 로그인 상태 체크
		HttpSession session = request.getSession();
		
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		
		//화일업로드 처리 ------------------------------------
		
        Part filePart = request.getPart("p_filename"); // 파일 부분 가져오기
        System.out.println(filePart);
        if (filePart == null) {
            throw new ServletException("Part not found for 'p_filename'");
        }
        String fileName = getFileName(filePart); // 파일 이름 추출
        String p_filename = fileName;
        
     
        
        
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        
        System.out.println(uploadPath);
        
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); // 업로드 디렉토리 생성

        // 파일 저장
        File file = new File(uploadPath + File.separator + fileName);
        try (FileOutputStream fos = new FileOutputStream(file);
             InputStream is = filePart.getInputStream()) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }
	    //화일업로드 처리 end ------------------------------------
		
        
		// 1. parameter받기 <- 전달이 되는 인자를 parameter라고 부름
		//query 방식이기에 &으로 구분한다
		String p_title = request.getParameter("p_title");
		String p_content = request.getParameter("p_content").replaceAll("\n", "<br>");
		String p_cate = URLEncoder.encode(request.getParameter("p_cate"), "UTF-8"); //url에서 한글로 받아올 때는 utf-8 -> 유니코드 변환해서 다시 맨 아래에 vo에 넣을 때 유니코드 -> utf-8로 변경한다.  
		int m_idx = member.getM_idx();
		String m_name = member.getM_name();
		
		int p_type = 1;
		if(request.getParameter("p_type") != null) {
			p_type = Integer.parseInt(request.getParameter("p_type"));
		} 
		
		// 3. VisitVo를 포장한다
		PostVo vo = new PostVo(p_title, p_content, URLDecoder.decode(p_cate, "UTF-8"), p_type, m_idx, m_name, p_filename);
	
		// 4. DB insert
		int res = PostDao.getInstance().insert(vo);

		// 5. 목록보기로 이동
		response.sendRedirect("list.do?p_cate="+p_cate);

	}

	// 파일 이름 추출
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
        	
        	System.out.println(cd);
        	
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName;//new File(fileName).getName();
            }
        }
        return null;
    }
}

