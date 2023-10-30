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
	

	@Override
	public List<BoardVo> selectTestListPaged(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return mbtiDao.selectTestListPaged(pageVo);
	}
	@Override
	public String generateMBTIResult(Map<String, String> sessionData) throws Exception {
		// TODO Auto-generated method stub
		Integer eValue = Integer.parseInt(sessionData.get("E"));
	    Integer iValue = Integer.parseInt(sessionData.get("I"));
	    Integer sValue = Integer.parseInt(sessionData.get("S"));
	    Integer nValue = Integer.parseInt(sessionData.get("N"));
	    Integer fValue = Integer.parseInt(sessionData.get("F"));
	    Integer tValue = Integer.parseInt(sessionData.get("T"));
	    Integer jValue = Integer.parseInt(sessionData.get("J"));
	    Integer pValue = Integer.parseInt(sessionData.get("P"));

	    StringBuilder resultData = new StringBuilder();

	    resultData.append((eValue >= iValue) ? "E" : "I");
	    resultData.append((sValue >= nValue) ? "S" : "N");
	    resultData.append((fValue >= tValue) ? "F" : "T");
	    resultData.append((jValue >= pValue) ? "J" : "P");
	    
	    String sortedResult = new String(resultData);
	    return sortedResult;
	}

}
