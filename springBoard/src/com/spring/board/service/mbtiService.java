package com.spring.board.service;

import java.util.List;
import java.util.Map;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

public interface mbtiService {

	public List<BoardVo> selectTestList() throws Exception;

	public int totalCount() throws Exception;


	public List<BoardVo> selectTestListPaged(PageVo pageVo) throws Exception;

	public String generateMBTIResult(Map<String, String> sessionData) throws Exception;
}
