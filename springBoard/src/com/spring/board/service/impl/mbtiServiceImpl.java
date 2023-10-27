package com.spring.board.service.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.MbtiDao;
import com.spring.board.service.mbtiService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

@Service
public class mbtiServiceImpl implements mbtiService{
	
	@Autowired
	MbtiDao mbtiDao;

	@Override
	public List<BoardVo> selectTestList() throws Exception {
		// TODO Auto-generated method stub
		return mbtiDao.selectTestList();
	}
	@Override
	public int totalCount() throws Exception{
		// TODO Auto-generated method stub
		return mbtiDao.totalCount();
	}
	
//	@Override
//	public List<BoardVo> selectTestListPaged(int page, int pageSize) throws Exception {
//		// TODO Auto-generated method stub
//		int start = (page - 1) * pageSize;
//        return mbtiDao.selectTestListPaged(start, pageSize);
//	}
	
	@Override
	public List<BoardVo> selectTestListPaged(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return mbtiDao.selectTestListPaged(pageVo);
	}

}
