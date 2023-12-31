package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.PageVo;

public interface BoardDao {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo, List<String> filters) throws Exception;

	public BoardVo selectBoard(BoardVo boardVo) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public int boardUpdate(BoardVo boardVo) throws Exception;

	public boolean boardDelete(String boardType, int boardNum) throws Exception;

	public List<ComcodeVo> selectComcodeListMenu(List<ComcodeVo> comcodeList) throws Exception;


}
