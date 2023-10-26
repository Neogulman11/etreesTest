package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.MbtiDao;
import com.spring.board.vo.BoardVo;

@Repository
public class MbtiDaoImpl implements MbtiDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVo> selectTestList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mbti.testList");
	}
	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mbti.totalCount");
	}
	@Override
	public List<BoardVo> selectTestListPaged(int offset, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("offset", offset);
		params.put("pageSize", pageSize);
		return sqlSession.selectList("mbti.selectTestListPaged", params);
	}
}
