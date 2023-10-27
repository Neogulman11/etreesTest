package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.MbtiDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

@Repository
public class MbtiDaoImpl implements MbtiDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVo> selectTestList() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList("mbti.selectTestList");
	}
	@Override
	public int totalCount() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mbti.totalCount");
	}
//	@Override
//	public List<BoardVo> selectTestListPaged(int start, int pageSize) throws Exception {
//		// TODO Auto-generated method stub
//		Map<String, Integer> params = new HashMap<>();
//	    params.put("start", start);
//	    params.put("end", start + pageSize);
//	    return sqlSession.selectList("mbti.selectTestListPaged", params);
//	}
	@Override
	public List<BoardVo> selectTestListPaged(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mbti.selectTestListPaged", pageVo);
	}

	
}
