package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.service.boardService;
import com.spring.board.service.mbtiService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

@Controller
public class MbtiController {
	@Autowired
	mbtiService mbtiService;
	
	@RequestMapping(value = "/mbti/mbtiMain.do", method = RequestMethod.GET)
	public String mainForm() {
		return "mbti/mbtiMain";
	}
	
	@RequestMapping(value = "/mbti/mbtiTest.do", method = RequestMethod.GET)
	public String testForm(Model model, PageVo pageVo) throws Exception {
	    List<BoardVo> boardList = new ArrayList<BoardVo>();
	    
	    int page = 1;
	    int totalCnt = 0;

	    if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);;
		}
	    
	    boardList = mbtiService.selectTestListPaged(pageVo);
	    totalCnt = mbtiService.totalCount();
	    
	    
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("totalCnt", totalCnt);
	    model.addAttribute("currentPage", pageVo);
	    
	    
	    return "mbti/mbtiTest";
	}
	
	@RequestMapping(value = "/mbti/mbtiResult.do", method = RequestMethod.GET)
	public String resultForm(Model model) {
		return "mbti/mbtiResult";
	}

	@RequestMapping(value = "/mbti/mbtiResult.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> handleAjaxRequest(@RequestBody Map<String, String> sessionData, HttpSession session) throws Exception {
	    session.setAttribute("resultData", mbtiService.generateMBTIResult(sessionData));
	    
	    
	    Map<String, String> responseMap = new HashMap<>();
	    responseMap.put("resultDataJson", (String) session.getAttribute("resultData"));
	    System.out.println("Response Map Contents: " + responseMap.get("resultDataJson"));
	    
	    return responseMap;
	}

	
}
