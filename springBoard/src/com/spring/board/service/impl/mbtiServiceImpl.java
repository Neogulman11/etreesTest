package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.MbtiDao;
import com.spring.board.service.mbtiService;
import com.spring.board.vo.BoardVo;

@Service
public class mbtiServiceImpl implements mbtiService{
	
	@Autowired
	MbtiDao mbtiDao;

	@Override
	public List<BoardVo> selectTestList() throws Exception {
		// TODO Auto-generated method stub
		return mbtiDao.selectTestList();
	}

}
