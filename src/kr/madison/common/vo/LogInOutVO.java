package kr.madison.common.vo;

public class LogInOutVO extends SessionVO{

	private static final long serialVersionUID = 1880516785960236906L;

	// WEB_USERS : 회원
	private String passwd = null; // 비밀번호
	private String useyn = null; // 사용여부

	// HRS_EMPLOGIN : 로그인 정보
	private Integer logno = null; // 로그번호
	private String ip = null; // 접속 아이피
	private String useragent = null; // 유저 에이전트
	private String successyn = null; // 로그인 성공여부
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public Integer getLogno() {
		return logno;
	}
	public void setLogno(Integer logno) {
		this.logno = logno;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getUseragent() {
		return useragent;
	}
	public void setUseragent(String useragent) {
		this.useragent = useragent;
	}
	public String getSuccessyn() {
		return successyn;
	}
	public void setSuccessyn(String successyn) {
		this.successyn = successyn;
	}
	
	
}
