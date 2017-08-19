package kr.madison.main.vo;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import kr.madison.common.vo.CommonVO;

@JsonSerialize(include=JsonSerialize.Inclusion.ALWAYS)
public class MainVO extends CommonVO{
	public int brdid;
	public String title;
	public String content;
	public String regdate;
	public String moddate;
	public String writer;
	public int count;
	public int repcount;
	
	public int repid;
	public String repContent;
	public String repRegdate;
	public String replier;
	
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getRepcount() {
		return repcount;
	}
	public void setRepcount(int repcount) {
		this.repcount = repcount;
	}
	public int getRepid() {
		return repid;
	}
	public void setRepid(int repid) {
		this.repid = repid;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public String getRepRegdate() {
		return repRegdate;
	}
	public void setRepRegdate(String repRegdate) {
		this.repRegdate = repRegdate;
	}
	public String getReplier() {
		return replier;
	}
	public void setReplier(String replier) {
		this.replier = replier;
	}
	public int getBrdid() {
		return brdid;
	}
	public void setBrdid(int brdid) {
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

	
}
