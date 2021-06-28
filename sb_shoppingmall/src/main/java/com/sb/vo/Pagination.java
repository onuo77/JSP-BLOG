package com.sb.vo;

public class Pagination {

	// 현재 페이지번호
	private int pageNo;
	// 조회된 총 게시글 갯수
	private int totalRows;
	// 총 페이지 갯수
	private int totalPages;
	// 총 페이지블록 갯수(한 페이지블록은 페이지번호를 5개씩 포함한다.)
	private int totalPageBlocks;
	// 현제 페이지번호에 해당하는 블록번호
	private int currentPageBlock;
	// 시작페이지번호
	private int beginPage;
	// 끝페이지번호
	private int endPage;
	
	public Pagination() {}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}
	
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	public int getTotalPageBlocks() {
		return totalPageBlocks;
	}

	public void setTotalPageBlocks(int totalPageBlocks) {
		this.totalPageBlocks = totalPageBlocks;
	}

	public int getCurrentPageBlock() {
		return currentPageBlock;
	}

	public void setCurrentPageBlock(int currentPageBlock) {
		this.currentPageBlock = currentPageBlock;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "Pagination [pageNo=" + pageNo + ", totalRows=" + totalRows + ", totalPages=" + totalPages
				+ ", totalPageBlocks=" + totalPageBlocks + ", currentPageBlock=" + currentPageBlock + ", beginPage="
				+ beginPage + ", endPage=" + endPage + "]";
	}
	
}
