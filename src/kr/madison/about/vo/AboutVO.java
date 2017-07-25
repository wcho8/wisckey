package kr.madison.about.vo;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import kr.madison.common.vo.CommonVO;

@JsonSerialize(include = JsonSerialize.Inclusion.ALWAYS)
public class AboutVO extends CommonVO {
	
	private int nid;
	private String title;
	private String content;
	private String regdate;
	private String moddate;
	private String writer;
	private int count;
	private int likes;
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
}
