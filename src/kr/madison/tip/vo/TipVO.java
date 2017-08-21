package kr.madison.tip.vo;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import kr.madison.common.vo.CommonVO;

@JsonSerialize(include=JsonSerialize.Inclusion.ALWAYS)
public class TipVO extends CommonVO{
	
	public int brdid;
	public int tipid;
	public String title;
	public String content;
	public String writer;
	public String regdate;
	public String moddate;
	public int count;
	public int likes;
	public int dislikes;
	public int repcount;
	
	public int repid;
	public String repContent;
	public String replier;
	public String repRegdate;
	public int repLikes;
	public int repDislikes;
	public String responseType;
	
	//file upload
	public String type;
	public String CKEditorFuncNum; 
	
	public Integer lid = 0;
	public Integer replid = 0;
	
	public int getBrdid() {
		return brdid;
	}
	public void setBrdid(int brdid) {
		this.brdid = brdid;
	}
	public int getTipid() {
		return tipid;
	}
	public void setTipid(int tipid) {
		this.tipid = tipid;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getDislikes() {
		return dislikes;
	}
	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}
	public int getRepcount() {
		return repcount;
	}
	public void setRepcount(int repcount) {
		this.repcount = repcount;
	}

	public int getRepid() {
		return repid;
	}
	public void setRepid(int repid) {
		this.repid = repid;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public String getReplier() {
		return replier;
	}
	public void setReplier(String replier) {
		this.replier = replier;
	}
	public String getRepRegdate() {
		return repRegdate;
	}
	public void setRepRegdate(String repRegdate) {
		this.repRegdate = repRegdate;
	}
	public int getRepLikes() {
		return repLikes;
	}
	public void setRepLikes(int repLikes) {
		this.repLikes = repLikes;
	}
	public int getRepDislikes() {
		return repDislikes;
	}
	public void setRepDislikes(int repDislikes) {
		this.repDislikes = repDislikes;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getResponseType() {
		return responseType;
	}
	public void setResponseType(String responseType) {
		this.responseType = responseType;
	}
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public Integer getReplid() {
		return replid;
	}
	public void setReplid(Integer replid) {
		this.replid = replid;
	}
}
