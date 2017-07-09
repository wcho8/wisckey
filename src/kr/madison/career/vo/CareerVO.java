package kr.madison.career.vo;

import kr.madison.common.vo.CommonVO;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include=JsonSerialize.Inclusion.ALWAYS)
public class CareerVO extends CommonVO{
	public int brdid;
	public int empid;
	public String title;
	public String content;
	public String writer;
	public String deadline;
	public String regdate;
	public String moddate;
	public int userno;
	public int count;
	public int likes;
	public int tipid;
	public int repcount;
	
	public int repid;
	public String repContent;
	public String repRegdate;
	public String replier;
	
	public int dDate;
	
	public int getdDate() {
		return dDate;
	}
	public void setdDate(int dDate) {
		this.dDate = dDate;
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
	public int getTipid() {
		return tipid;
	}
	public void setTipid(int tipid) {
		this.tipid = tipid;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getBrdid() {
		return brdid;
	}
	public void setBrdid(int brdid) {
		this.brdid = brdid;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
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
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = (int)userno;
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
