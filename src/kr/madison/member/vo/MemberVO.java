package kr.madison.member.vo;

import java.io.Serializable;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include=JsonSerialize.Inclusion.ALWAYS)
public class MemberVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer userno;
	private String userid;
	private String passwd;
	private String korname;
	private String engname;
	private String nickname;
	private String regdate;
	private String moddate;
	private String email;
	private String telnum;
	private Integer authid;
	private String gender;
	private String birthdate;
	private String major;
	private String minor;
	private char useyn;
	private String comment;
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getKorname() {
		return korname;
	}
	public void setKorname(String korname) {
		this.korname = korname;
	}
	public String getEngname() {
		return engname;
	}
	public void setEngname(String engname) {
		this.engname = engname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelnum() {
		return telnum;
	}
	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}
	public Integer getAuthid() {
		return authid;
	}
	public void setAuthid(Integer authid) {
		this.authid = authid;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getMinor() {
		return minor;
	}
	public void setMinor(String minor) {
		this.minor = minor;
	}
	public char getUseyn() {
		return useyn;
	}
	public void setUseyn(char useyn) {
		this.useyn = useyn;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
