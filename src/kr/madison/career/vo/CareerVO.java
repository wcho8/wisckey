package kr.madison.career.vo;

import java.util.Calendar;


public class CareerVO {
	private int brdid;
	private int empid;
	private String title;
	private String content;
	private Calendar regdate;
	private Calendar moddate;
	private int userno;
	private int count;
	private int likes;
	
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
	public Calendar getRegdate() {
		return regdate;
	}
	public void setRegdate(Calendar regdate) {
		this.regdate = regdate;
	}
	public Calendar getModdate() {
		return moddate;
	}
	public void setModdate(Calendar moddate) {
		this.moddate = moddate;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
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
