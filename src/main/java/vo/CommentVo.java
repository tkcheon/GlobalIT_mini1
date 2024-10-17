package vo;

public class CommentVo {
	
	private int c_idx;
	private String c_content;
	private String c_rdate;
	private String c_mdate;
	private int p_idx;
	private int m_idx;
	private String m_name;
	
	
	public CommentVo() {
		super();
	}

	public CommentVo(int c_idx, String c_content) {
		super();
		this.c_idx = c_idx;
		this.c_content = c_content;
	}

	public CommentVo(int p_idx, int m_idx, String c_content) {
		this.p_idx = p_idx;
		this.m_idx = m_idx;
		this.c_content = c_content;
	}
	
	public CommentVo(int p_idx, int m_idx, String c_content, String m_name) {
		this.p_idx = p_idx;
		this.m_idx = m_idx;
		this.c_content = c_content;
		this.m_name = m_name;
	}

	public int getC_idx() {
		return c_idx;
	}
	
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	
	public String getC_content() {
		return c_content;
	}
	
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	
	public String getC_rdate() {
		return c_rdate;
	}
	
	public void setC_rdate(String c_rdate) {
		this.c_rdate = c_rdate;
	}
	
	public String getC_mdate() {
		return c_mdate;
	}
	
	public void setC_mdate(String c_mdate) {
		this.c_mdate = c_mdate;
	}
	
	public int getP_idx() {
		return p_idx;
	}
	
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	
	public int getM_idx() {
		return m_idx;
	}
	
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

}
