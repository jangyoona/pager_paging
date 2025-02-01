package com.example.common;

import lombok.Getter;

@Getter
public class PageDto {
	
	private int page; 	 	// 현재 페이지
	private int maxPage; 	// 전체 필요한 페이지 갯수
	private int start; 	 	// 현재 페이지 기준 시작 페이지
	private int end;  	 	// 현재 페이지 기준 마지막 페이지
	
	private int pageStart;	// SELECT문 LIMIT 첫 번째 인자 (게시물 SELECT용)
	private int pageLimit;	// 한 페이지에 표시할 게시물 갯수 (LIMIT 두 번째 자리 값)
	private int blockLimit;	// 하단에 보여줄 페이지 번호 갯수 (페이징 숫자 갯수)
	
	
	// 게시물 SELECT용 생성자 (페이지 번호, 한 페이지에 표시할 게시물 갯수, 한 페이지 페이징 보여줄 갯수)
	public PageDto(int pageNo, int pageLimit, int blockLimit) {
		// 1. 초기화
		// 2. getPageStart, getPageLimit를 Limit 절에 넣기 | 예시) Limit #{getPageStart}, #{getPageLimit}
		pageStart = (pageNo -1) * pageLimit;
		
		this.pageLimit = pageLimit;
		this.blockLimit = blockLimit;
	}
	
	// pager 생성자 (페이지 번호, 게시물 총 갯수, 한 페이지에 표시할 게시물 갯수, 한 페이지에 표시할 페이저 갯수)
	public PageDto(int pageNo, int boardCount, int pageLimit, int blockLimit) {
		this.pageLimit = pageLimit;
		this.blockLimit = blockLimit;
		
		page = pageNo;
		maxPage = (int) (Math.ceil((double) boardCount / pageLimit));
		start = (((int)(Math.ceil((double) pageNo / blockLimit))) - 1) * blockLimit + 1;
		end = endPageByStartpage(start);
		
	}
	
	
	private int endPageByStartpage(int startPage) {
	    int endPage = startPage + blockLimit - 1;
	    if (endPage > maxPage) { // 총 게시물 갯수에 따른 마지막 페이지 숫자 계산
	        endPage = maxPage;
	    }
	    return endPage;
	}
	
	/**
	 * maxPage: 전체 페이지 갯수 계산(10/3=3.33333 => 4)   ceil? 남는값 반올림 함수
	 * start: 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)		하단의 페이징 숫자. 가장 앞에 있는 숫자 말하는 거임 '1'~5 '6'~10 '11'~15
	 * end: 끝 페이지 값 계산(3, 6, 9, 12, ~~~~)		하단의 페이징 숫자. 가장 뒤에 있는 숫자 말하는 거임 1~'5' 6~'10' 11~'15'
	 **/

}
