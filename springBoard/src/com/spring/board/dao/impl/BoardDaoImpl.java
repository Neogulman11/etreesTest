package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	/**
	 * 
	 * */
	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo, List<String> filters) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("pageVo", pageVo);
		paramMap.put("filters", filters);
		return sqlSession.selectList("board.boardList",paramMap);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.boardUpdate", boardVo);
	}
	
	@Override
	public boolean boardDelete(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
        parameters.put("boardType", boardType);
        parameters.put("boardNum", boardNum);

        int result = sqlSession.delete("board.boardDelete", parameters);

        return result > 0;
    }
	@Override
	public List<ComcodeVo> selectComcodeListMenu(List<ComcodeVo> comcodeList) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.typeMenu",comcodeList);
	}
	
	
	
	
}
