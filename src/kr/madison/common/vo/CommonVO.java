package kr.madison.common.vo;

import kr.madison.util.Util;

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
	
	//file
	private String filename;
	private String filetype;
	private long filesize;
	private int fid; //파일 id
	private byte[] fileContent;
	
	// 그리드 요청 파라미터
	private Integer page = null; // 그리드의 현재 페이지
	private Integer rows = null; // 그리드 한 페이지의 행 개수
	private String sidx = null; // 그리드 정렬 기준 컬럼
	private String sord = null; // 그리드 정렬 순서 (오름차순, 내림차순)
	private Integer srow = null; // 그리드 데이터 시작 위치
	
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public byte[] getFileContent() {
		return fileContent;
	}
	public void setFileContent(byte[] fileContent) {
		this.fileContent = fileContent;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
		if (this.rows != null) {
			setSrow(this.rows * this.page - this.rows);
		}
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
		if (this.page != null) {
			setSrow(this.rows * this.page - this.rows);
		}
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = Util.escapeSql(sidx);
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sidx = Util.escapeSql(sord);
	}
	public Integer getSrow() {
		return srow;
	}
	public void setSrow(Integer srow) {
		this.srow = srow;
	}
}
