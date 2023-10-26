package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;

public interface MbtiDao {

	public List<BoardVo> selectTestList() throws Exception;

	public int totalCount() throws Exception;

	public List<BoardVo> selectTestListPaged(int offset, int pageSize) throws Exception;
}
