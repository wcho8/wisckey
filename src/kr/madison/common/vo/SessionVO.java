package kr.madison.common.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
public class SessionVO implements Serializable {
	private static final long serialVersionUID = 4301463685401594293L;
	
	//WEB_USERS 회원정보
	private Integer userno = null; // 유저 고유 넘버
	private String userid = null; // 아이디
	private String username = null; // 이름
	private String email = null; // 이메일
	private String hpnum = null; // 휴대폰번호
	private String empno = null; // 사원번호
	private String passwd = null; //패스워드
	private String nickname = null; //닉네임
	private String kakaoYN = null; // 카카오톡 로그인
	private String fbYN = null; // 페이스북 로그인

	//AUTH_USERS 권한
	private Integer authcd = null; // 권한번호
	private String authname = null; // 권한명
	private String adminyn = null; // 관리자여부
	
	private String status = null; // 상태
	
	public Integer getUserno() {
		return userno;
	}

	public void setUserno(Integer userno) {
		this.userno = userno;
	}

	public String getKakaoYN() {
		return kakaoYN;
	}

	public void setKakaoYN(String kakaoYN) {
		this.kakaoYN = kakaoYN;
	}

	public String getFbYN() {
		return fbYN;
	}

	public void setFbYN(String fbYN) {
		this.fbYN = fbYN;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getHpnum() {
		return hpnum;
	}

	public void setHpnum(String hpnum) {
		this.hpnum = hpnum;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
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

	public Integer getAuthcd() {
		return authcd;
	}

	public void setAuthcd(Integer authcd) {
		this.authcd = authcd;
	}

	public String getAuthname() {
		return authname;
	}

	public void setAuthname(String authname) {
		this.authname = authname;
	}

	public String getAdminyn() {
		return adminyn;
	}

	public void setAdminyn(String adminyn) {
		this.adminyn = adminyn;
	}
	
}