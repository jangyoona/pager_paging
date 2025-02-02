package com.example.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.common.PageDto;
import com.example.dto.BoardDto;
import com.example.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping
	public String findAll(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {
		
		System.out.println("페이지 넘버= " + pageNo);
		
		// 게시물 리스트
		List<BoardDto> boardDtoList = boardService.findAll(pageNo);
		model.addAttribute("boardList", boardDtoList);
		
		// 페이저 생성
		PageDto pager = boardService.createPager(pageNo);
		model.addAttribute("paging", pager);
		
		
		return "board/board";
	}
	
	@GetMapping("/detail")
	public String detailShow(long id, int pageNo, Model model) {
		boardService.updateHits(id);
		BoardDto board = boardService.findById(id);
		model.addAttribute("board", board);
		model.addAttribute("pageNo", pageNo);
		return "board/detail";
	}
	
	// 글 등록
	@GetMapping("save")
	public String saveForm() {
		
		return "board/save";
	}
	
	@PostMapping("/save")
	public String save(BoardDto board) {
		int saveResult = boardService.save(board);
		if(saveResult > 0) {
			return "redirect:/board/save";
		} else {
			return "save";
		}
		
	}
	
	// 삭제
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<HttpStatus> delete(@PathVariable Long id) {
		System.out.println(id);
		boardService.deleteById(id);
		return ResponseEntity.noContent().build();
	}
	
	@GetMapping("edit")
	public String editShow(long id, Model model) {
		BoardDto board = boardService.findById(id);
		model.addAttribute("board", board);
		return "board/edit";
	}
	
	//수정
	@PostMapping("edit")
	public String edit(BoardDto board) {
		boardService.editById(board);
		return "redirect:/board/detail?id=" + board.getId();
	}
	

}
