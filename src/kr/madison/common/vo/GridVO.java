package kr.madison.common.vo;
import java.io.Serializable;
import java.util.List;

public class GridVO implements Serializable {
	
	// 그리드 응답 파라미터
	private int page; // 그리드 현재 페이지
	private int total; // 그리드 전체 페이지 수
	private int records; // 그리드 전체 행 개수
	private List<?> rows; // 그리드 행 데이터
	
	public void bindPaging(int recordCount, CommonVO paramVO) {
		this.records = recordCount;
		this.total = (int)Math.ceil((double)this.records / paramVO.getRows());
		this.page = paramVO.getPage();
	}
	
	public void bindData(List<?> objList) {
		this.rows = objList;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public int getRecords() {
		return records;
	}
	
	public void setRecords(int records) {
		this.records = records;
	}
	
	public List<?> getRows() {
		return rows;
	}
	
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
}