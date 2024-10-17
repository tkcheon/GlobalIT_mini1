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

public class PostDao {

	// single-ton pattern : 객체 1개만 생성해서 이용하자
	static PostDao single = null;

	public static PostDao getInstance() {

		// 없으면 생성해라
		if (single == null)
			single = new PostDao();

		return single;
	}

	// 외부에서 객체생성하지 말아라...
	private PostDao() {

	}

	public List<PostVo> selectList(String p_cate) {

		List<PostVo> list = new ArrayList<PostVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from post_list_view where p_cate = ? order by p_rdate desc"; // 작성일 기준 내림차순으로

		try {
			// 1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2.PreparedStatement
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_cate);			// 3.ResultSet 얻어온다
			// 3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 저장객체 생성->레코드에서 읽은 값을 넣는다
				PostVo vo = new PostVo();

				// rs가 가리키는 레코드값을 vo에 넣는다
				vo.setP_idx(rs.getInt("p_idx"));
				vo.setP_cate(rs.getString("p_cate"));
				vo.setP_title(rs.getString("p_title"));
				vo.setP_content(rs.getString("p_content"));
				vo.setP_filename(rs.getString("p_filename"));
				vo.setP_rdate(rs.getString("p_rdate"));
				vo.setP_mdate(rs.getString("p_mdate"));
				vo.setP_type(rs.getInt("p_type"));
				vo.setP_hit(rs.getInt("p_hit"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_name(rs.getString("m_name"));
				vo.setM_type(rs.getInt("m_type"));
				
				// ArrayList에 추가
				list.add(vo);

			} // end:while

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			// 마무리 작업(열린역순으로 닫기)
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	public int insert(PostVo vo) {
		// TODO Auto-generated method stub

		
		
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
        //                                                                                                                         1 2 3 4 5 6
		String sql = "insert into post(p_idx, p_cate, p_title, p_content, p_filename, p_type, m_idx) values(seq_post_p_idx.nextVal,?,?,?,?,?,?)";

		try {
			// 1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			// 3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getP_cate());
			pstmt.setString(2, vo.getP_title());
			pstmt.setString(3, vo.getP_content());
			pstmt.setString(4, vo.getP_filename());
			pstmt.setInt(5, vo.getP_type());
			pstmt.setInt(6, vo.getM_idx());
			// 4.DB insert
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			// 마무리 작업(열린역순으로 닫기)
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;

	}// end:insert()

	public int delete(int p_idx) {
		// TODO Auto-generated method stub

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from post where p_idx=?";

		try {
			// 1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			// 3.pstmt parameter index 채우기
			pstmt.setInt(1, p_idx);

			// 4.DB delete
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			// 마무리 작업(열린역순으로 닫기)
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;

	}// end:delete()

	// 게시글 당 좋아요한 수
	public int getPostLikeCount(int p_idx) {

		int likeCount = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from post_like where p_idx = ? and l_type = 1";

		try {
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				likeCount = rs.getInt(1);
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
		return likeCount;
	}

	// 게시글 당 스크랩한 수
	public int getPostScrapCount(int p_idx) {

		int scrapCount = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from post_like where p_idx = ? and l_type = 2";

		try {
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				scrapCount = rs.getInt(1);
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
		return scrapCount;
	}

	// 특정 게시글에 대한 사용자의 좋아요 또는 스크랩 여부 확인
	// (좋아요/스크랩 버튼이 토글 형식이니까) 좋아요/스크랩이 이미 존재하면 삭제, 없으면 추가
	public void isPostLikeOrScrap(int m_idx, int p_idx, int l_type) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 좋아요 여부 확인
		String sqlSelect = "SELECT * FROM post_like WHERE p_idx = ? AND m_idx = ? AND l_type = ?";

		try {
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setInt(1, p_idx);
			pstmt.setInt(2, m_idx);
			pstmt.setInt(3, l_type);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 좋아요가 이미 존재하면 삭제
				String sqlDelete = "DELETE FROM post_like WHERE p_idx = ? AND m_idx = ? AND l_type = ?";
				pstmt = conn.prepareStatement(sqlDelete);
				pstmt.setInt(1, p_idx);
				pstmt.setInt(2, m_idx);
				pstmt.setInt(3, l_type);
				pstmt.executeUpdate();
			} else {
				// 좋아요가 없으면 추가
				String sqlInsert = "INSERT INTO post_like (l_idx, p_idx, m_idx, l_type, l_rdate, l_mdate) VALUES (seq_post_like_l_idx.nextval, ?, ?, ?,  SYSDATE, SYSDATE)";
				pstmt = conn.prepareStatement(sqlInsert);
				pstmt.setInt(1, p_idx);
				pstmt.setInt(2, m_idx);
				pstmt.setInt(3, l_type);

				pstmt.executeUpdate();
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

	}

	

	
	public PostVo selectOne(int p_idx) {

		PostVo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from post_list_view where p_idx=?";
		// 스레드 안정성을 위해 SimpleDateFormate대신 DateTimeFormatter사용
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH:mm:ss");
		
		try {
			// 1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			// 3.pstmt parameter index채우기
			pstmt.setInt(1, p_idx);

			// 4.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 저장객체 생성->레코드에서 읽은 값을 넣는다
				vo = new PostVo();

				// rs가 가리키는 레코드값을 vo에 넣는다
				vo.setP_idx(rs.getInt("p_idx"));
				vo.setP_cate(rs.getString("p_cate"));
				vo.setP_title(rs.getString("p_title"));
				vo.setP_content(rs.getString("p_content"));
				vo.setP_filename(rs.getString("p_filename"));
				vo.setP_rdate(rs.getTimestamp("p_rdate").toLocalDateTime().format(dtf));
				vo.setP_mdate(rs.getTimestamp("p_mdate").toLocalDateTime().format(dtf));
				vo.setP_type(rs.getInt("p_type"));
				vo.setP_hit(rs.getInt("p_hit"));
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setM_type(rs.getInt("m_type"));
				vo.setM_name(rs.getString("m_name"));
			
				
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 마무리 작업(열린역순으로 닫기)
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
		return vo;
	}

	public int update(PostVo vo) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = null;
		
		try {
			sql = "update post set p_cate = ?, p_title = ?, p_content = ?, p_filename=?, p_mdate=sysdate, p_type=? where p_idx = ?";
			
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			
//			PostVo vo = new PostVo(p_idx, p_cate, p_title, p_content, p_filename, p_type);
			
			// XSS 방어를 위해 이스케이프 처리
            String p_cate = Util.escapeHtml(vo.getP_cate());
            String p_title = Util.escapeHtml(vo.getP_title());
            String p_content = Util.escapeHtml(vo.getP_content());
            String p_filename = Util.escapeHtml(vo.getP_filename());
            int p_type = vo.getP_type();
			
            
            
			pstmt.setString(1, p_cate);
            pstmt.setString(2, p_title);
            pstmt.setString(3, p_content);
            pstmt.setString(4, p_filename);
            System.out.println("------");
            System.out.println(p_filename);
            System.out.println("------");
            pstmt.setInt(5, p_type);
            pstmt.setInt(6, vo.getP_idx());
            
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
	
	// 	게시글 조회수 증가 메소드
	public void hit_update(int p_hit,int p_idx){
		// TODO Auto-generated method stub

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update post set p_hit=? where p_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setInt(1, (p_hit+1));
			pstmt.setInt(2, p_idx);
			//4.DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 작업(열린역순으로 닫기)
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
