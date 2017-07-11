package kr.madison.common.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
public class SessionVO implements Serializable {
	private static final long serialVersionUID = 4301463685401594293L;
	
	private Integer userno = null; // 유저 고유 넘버
	private String userid = null; // 아이디
	private String username = null; // 이름
	private String email = null; // 이메일
	private String passwd = null; //패스워드
	private String nickname = null; //닉네임
	
	private String status = null;
	private boolean islogin = false;
	private Integer authid; // 권한
	private String authname; // 권한 이름
	
	public Integer getUserno() {
		return userno;
	}

	public void setUserno(Integer userno) {
		this.userno = userno;
	}

	public String getToString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isIslogin() {
		return islogin;
	}

	public void setIslogin(boolean islogin) {
		this.islogin = islogin;
	}

	public Integer getAuthid() {
		return authid;
	}

	public void setAuthid(Integer authid) {
		this.authid = authid;
	}

	public String getAuthname() {
		return authname;
	}

	public void setAuthname(String authname) {
		this.authname = authname;
	}
	
}