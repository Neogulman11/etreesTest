package com.spring.board.service.impl;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.ArrayList;
import java.util.Collections;
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
		Map<String, String> sortedMap = new TreeMap<>(sessionData);
		
		String eKey = "E";
		String iKey = "I";
		String sKey = "S";
		String nKey = "N";
		String fKey = "F";
		String tKey = "T";
		String jKey = "J";
		String pKey = "P";
		
		Integer eValue = Integer.parseInt(sortedMap.get(eKey) != null ? sessionData.get(eKey) : "0");
		Integer iValue = Integer.parseInt(sortedMap.get(iKey) != null ? sessionData.get(iKey) : "0");
		Integer sValue = Integer.parseInt(sessionData.get("S") != null ? sessionData.get("S") : "0");
	    Integer nValue = Integer.parseInt(sessionData.get("N") != null ? sessionData.get("N") : "0");
	    Integer fValue = Integer.parseInt(sessionData.get("F") != null ? sessionData.get("F") : "0");
	    Integer tValue = Integer.parseInt(sessionData.get("T") != null ? sessionData.get("T") : "0");
	    Integer jValue = Integer.parseInt(sessionData.get("J") != null ? sessionData.get("J") : "0");
	    Integer pValue = Integer.parseInt(sessionData.get("P") != null ? sessionData.get("P") : "0");
		
		StringBuilder resultData = new StringBuilder();
		
		if (eValue > iValue) {
			resultData.append(eKey);
		} else if (eValue < iValue){
			resultData.append(iKey);
		} else {
			List<String> keys = new ArrayList<>();
	        keys.add(eKey);
	        keys.add(iKey);
	        Collections.sort(keys);

	        resultData.append(keys.get(0));
		}
		
		if (sValue > nValue) {
			resultData.append(sKey);
		} else if (sValue < nValue){
			resultData.append(nKey);
		} else {
			List<String> keys = new ArrayList<>();
	        keys.add(sKey);
	        keys.add(nKey);
	        Collections.sort(keys);

	        resultData.append(keys.get(0));
		}
		
		if (fValue > tValue) {
			resultData.append(fKey);
		} else if (fValue < tValue){
			resultData.append(tKey);
		} else {
			List<String> keys = new ArrayList<>();
	        keys.add(fKey);
	        keys.add(tKey);
	        Collections.sort(keys);

	        resultData.append(keys.get(0));
		}
		
		if (jValue > pValue) {
			resultData.append(jKey);
		} else if (jValue < pValue){
			resultData.append(pKey);
		} else {
			List<String> keys = new ArrayList<>();
	        keys.add(jKey);
	        keys.add(pKey);
	        Collections.sort(keys);

	        resultData.append(keys.get(0));
		}
		

	    String sortedResult = new String(resultData);
	    return sortedResult;
	}

}
