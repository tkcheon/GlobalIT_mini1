package servlet.post;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Collection;

import dao.PostDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.FileUploadUtils;
import vo.PostVo;

/**
 * Servlet implementation class PostModifyAction
 */

@MultipartConfig(
		/* location="/",  생략하는게 편리함. */ 
         fileSizeThreshold=1024*1024, 
         maxFileSize=1024*1024*5, 
         maxRequestSize=1024*1024*5*5)


@WebServlet("/post/modify.do")
public class PostModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 0. 수신인코딩 
		request.setCharacterEncoding("utf-8");
		
		
		//1. 파라미터 받기 
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		String p_title = request.getParameter("p_title");
		String p_content = request.getParameter("p_content");
		String p_cate = URLEncoder.encode(request.getParameter("p_cate"),"UTF-8"); //utf-8 -> 유니코드로
		String p_filename = request.getParameter("p_filename");
		int p_type = Integer.parseInt(request.getParameter("p_type"));
		/*String bed = URLEncoder.encode("침대","UTF-8");*/
		
				
		//parameter변수
        String filename1="no_file";
        String title="";
        
        //저장경로..
        String saveDir = request.getServletContext().getRealPath("/uploads/");
        //System.out.println(saveDir);
		
		
		response.setContentType("utf-8");
        String contentType = request.getContentType();
        
        if(contentType!=null && contentType.toLowerCase().startsWith("multipart/")) {
        	
        	Collection<Part> parts = request.getParts();
        	
        	for(Part part : parts) {
        		
        		//upload화일이 있으면
        		if(part.getHeader("Content-Disposition").contains("filename")) {

        			if(part.getHeader("Content-Disposition").contains("photo1")) {
        				p_filename = FileUploadUtils.saveFile(part, saveDir, "photo1");
        			}

        		}else { //일반 파라메터면
        			//String formValue = request.getParameter(part.getName());
        			title = request.getParameter("title");
        		}
        		
        	}
        }//end:if
 
		
		PostVo vo = new PostVo(p_idx, URLDecoder.decode(p_cate, "UTF-8"), p_title, p_content, p_filename, p_type); // 유니코드 -> utf-8로  
		int res = PostDao.getInstance().update(vo);
		
		response.sendRedirect("list.do?p_cate="+p_cate);
	}
	

}
