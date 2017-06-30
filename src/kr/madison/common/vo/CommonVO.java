package kr.madison.common.vo;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class CommonVO {
	
	//User 관련
	private Integer userno;
	private String korname;
	private String email;
	private Integer authid;
	private boolean isadmin;
	private String nickname;
	
	//검색
	private String srchType;
	private String srchVal;
	private String srchStartDate;
	private String srchEndData;
	private String keyword;
	
	//페이징
	private Integer startpage = 0;
	private Integer endpage = 0;
	private Integer pagerow = 0;
	private Integer mypage = 0;
	private Integer block = 0;
	private Integer skiprow = 0;
	
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getKorname() {
		return korname;
	}
	public void setKorname(String korname) {
		this.korname = korname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getAuthid() {
		return authid;
	}
	public void setAuthid(Integer authid) {
		this.authid = authid;
	}
	public boolean isIsadmin() {
		return isadmin;
	}
	public void setIsadmin(boolean isadmin) {
		this.isadmin = isadmin;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSrchType() {
		return srchType;
	}
	public void setSrchType(String srchType) {
		this.srchType = srchType;
	}
	public String getSrchVal() {
		return srchVal;
	}
	public void setSrchVal(String srchVal) {
		this.srchVal = srchVal;
	}
	public String getSrchStartDate() {
		return srchStartDate;
	}
	public void setSrchStartDate(String srchStartDate) {
		this.srchStartDate = srchStartDate;
	}
	public String getSrchEndData() {
		return srchEndData;
	}
	public void setSrchEndData(String srchEndData) {
		this.srchEndData = srchEndData;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getStartpage() {
		return startpage;
	}
	public void setStartpage(Integer startpage) {
		this.startpage = startpage;
	}
	public Integer getEndpage() {
		return endpage;
	}
	public void setEndpage(Integer endpage) {
		this.endpage = endpage;
	}
	public Integer getPagerow() {
		return pagerow;
	}
	public void setPagerow(Integer pagerow) {
		this.pagerow = pagerow;
	}
	public Integer getMypage() {
		return mypage;
	}
	public void setMypage(Integer mypage) {
		this.mypage = mypage;
	}
	public Integer getBlock() {
		return block;
	}
	public void setBlock(Integer block) {
		this.block = block;
	}
	public Integer getSkiprow() {
		return skiprow;
	}
	public void setSkiprow(Integer skiprow) {
		this.skiprow = skiprow;
	}
}
