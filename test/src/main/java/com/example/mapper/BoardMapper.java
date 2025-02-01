package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.dto.BoardDto;

@Mapper
public interface BoardMapper {
	
	List<BoardDto> findAll(@Param("start") int start, @Param("limit") int limit);
	
	int countBoard();
	
	int save(BoardDto board);

	BoardDto findById(long id);

	void updateHits(long id);

	void deleteById(long id);

	void updateById(BoardDto board);

}
