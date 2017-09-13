package kr.madison.admin.vo;

import kr.madison.common.vo.CommonVO;

public class AdminVO extends CommonVO{

	private Integer bid; // 게시판 타입 아이디
	private String name;
	private String comment;
	private char useyn;
	
	private Integer id;
	private String cod_table;
	private String idname; //코드 테이블의 PK id 이름
	private String regdate;
	
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public char getUseyn() {
		return useyn;
	}
	public void setUseyn(char useyn) {
		this.useyn = useyn;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCod_table() {
		return cod_table;
	}
	public void setCod_table(String cod_table) {
		this.cod_table = cod_table;
	}
	public String getIdname() {
		return idname;
	}
	public void setIdname(String idname) {
		this.idname = idname;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
