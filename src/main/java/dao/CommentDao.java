package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.DBService;
import util.Util;
import vo.CommentVo;
import vo.MemberVo;
import vo.PostVo;

public class CommentDao {

	// single-ton pattern : 객체 1개만 생성해서 이용하자
	static CommentDao single = null;

	public static CommentDao getInstance() {

		// 없으면 생성해라
		if (single == null)
			single = new CommentDao();

		return single;
	}

	// 외부에서 객체생성하지 말아라...
	private CommentDao() {

	}

	// 댓글 등록
	public int commentInsert(CommentVo vo) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into comments(c_idx, c_content, p_idx, m_idx) values(seq_comments_c_idx.nextval,?,?,?)";	

		try {

			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			// XSS 방어를 위해 이스케이프 처리
            String c_content = Util.escapeHtml(vo.getC_content());
			
			pstmt.setString(1, c_content);
			pstmt.setInt(2, vo.getP_idx());
			pstmt.setInt(3, vo.getM_idx());
			
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	// 댓글 수정
	public int commentUpdate(CommentVo vo) {
		
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		
		try {
			sql = "update comments set c_content = ?, c_mdate = sysdate where c_idx = ?";
			
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			// XSS 방어를 위해 이스케이프 처리
            String c_content = Util.escapeHtml(vo.getC_content());
			
			pstmt.setString(1, c_content);
            pstmt.setInt(2, vo.getC_idx());;
            
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	// 댓글 삭제
	public int commentDelete(int c_idx) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from comments where c_idx = ?";

		try {
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1,c_idx);

			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
	
	public List<CommentVo> selectCommentByPidx(int p_idx) {

		List<CommentVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from comments_list_view where p_idx = ?";

		// 스레드 안정성을 위해 SimpleDateFormate대신 DateTimeFormatter사용
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH:mm:ss");

		try {
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVo cv = new CommentVo();
				cv.setC_idx(rs.getInt("c_idx"));
				cv.setC_content(rs.getString("c_content"));
				cv.setC_rdate(rs.getTimestamp("c_rdate").toLocalDateTime().format(dtf));
				cv.setC_mdate(rs.getTimestamp("c_mdate").toLocalDateTime().format(dtf));
				cv.setP_idx(rs.getInt("p_idx"));
				cv.setM_idx(rs.getInt("m_idx"));
				cv.setM_name(rs.getString("m_name"));

				list.add(cv);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}
	

}
