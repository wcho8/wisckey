package kr.madison.geul.vo;

import kr.madison.common.vo.CommonVO;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include=JsonSerialize.Inclusion.ALWAYS)
public class GeulVO extends CommonVO{
	
	String table_name;
	String idname;
	int brdid;
	String title;
	String regdate;
	int count;
	int repNum;
	int myRepNum;
	
	int totalCnt;
	
	
	
	public int getMyRepNum() {
		return myRepNum;
	}
	public void setMyRepNum(int myRepNum) {
		this.myRepNum = myRepNum;
	}
	public String getIdname() {
		return idname;
	}
	public void setIdname(String idname) {
		this.idname = idname;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public int getBrdid() {
		return brdid;
	}
	public void setBrdid(int brdid) {
		this.brdid = brdid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}

	
}
