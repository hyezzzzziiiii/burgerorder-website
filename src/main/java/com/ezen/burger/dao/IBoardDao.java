package com.ezen.burger.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.burger.dto.BoardVO;
import com.ezen.burger.dto.Paging;

@Mapper
public interface IBoardDao {

	public int getAllCount();
	public List<BoardVO> selectAll(Paging paging);
	public int getCountReply( int num );
}
