package kr.madison.admin.vo;

import kr.madison.common.vo.CommonVO;

public class AdminVO extends CommonVO{

	private Integer bid; // 게시판 타입 아이디
	private String name;
	private String comment;
	private char useyn;
	
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
}
