package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.common.PageDto;
import com.example.dto.BoardDto;
import com.example.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	
	private final BoardMapper boardMapper;
	
	public int save(BoardDto board) {
		return boardMapper.save(board);
	}

	public List<BoardDto> findAll(int pageNo) {
		PageDto pager = new PageDto(pageNo, 3);
		return boardMapper.findAll(pager.getPageStart(), pager.getPageLimit());
	}

	public PageDto createPager(int pageNo) {
		int boardCount = countBoard();
		return new PageDto(pageNo, boardCount, 3, 3);
	}
	
	public int countBoard() {
		return boardMapper.countBoard();
	}
	

	public BoardDto findById(long id) {
		return boardMapper.findById(id);
	}

	public void updateHits(long id) {
		boardMapper.updateHits(id);
		
	}

	public void deleteById(long id) {
		boardMapper.deleteById(id);
		
	}

	public void editById(BoardDto board) {
		boardMapper.updateById(board);
		
	}

}
