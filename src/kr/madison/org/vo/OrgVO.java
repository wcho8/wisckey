package kr.madison.org.vo;

import kr.madison.common.vo.CommonVO;

public class OrgVO extends CommonVO{

	private Integer orgid;
	private Integer orgtypeid;
	private String orgname;
	private String orgtype; // 동아리 성격 (예: 스포츠, 학업, 취미)
	private String comment;
	private String regdate;
	private String moddate;
	private Integer prno;
	private Integer vprno;
	private String prname;
	private String vprname;
	private byte[] filecontent;
	private Integer brdid;
	
	// 동아리 게시판용
	private String title;
	private String content;
	private Integer count;
	private Integer likes;
	
	public Integer getOrgid() {
		return orgid;
	}
	public void setOrgid(Integer orgid) {
		this.orgid = orgid;
	}
	public Integer getOrgtypeid() {
		return orgtypeid;
	}
	public void setOrgtypeid(Integer orgtypeid) {
		this.orgtypeid = orgtypeid;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getOrgtype() {
		return orgtype;
	}
	public void setOrgtype(String orgtype) {
		this.orgtype = orgtype;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}
	public Integer getPrno() {
		return prno;
	}
	public void setPrno(Integer prno) {
		this.prno = prno;
	}
	public Integer getVprno() {
		return vprno;
	}
	public void setVprno(Integer vprno) {
		this.vprno = vprno;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public String getVprname() {
		return vprname;
	}
	public void setVprname(String vprname) {
		this.vprname = vprname;
	}
	public byte[] getFilecontent() {
		return filecontent;
	}
	public void setFilecontent(byte[] filecontent) {
		this.filecontent = filecontent;
	}
	public Integer getBrdid() {
		return brdid;
	}
	public void setBrdid(Integer brdid) {
		this.brdid = brdid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getLikes() {
		return likes;
	}
	public void setLikes(Integer likes) {
		this.likes = likes;
	}
	
}