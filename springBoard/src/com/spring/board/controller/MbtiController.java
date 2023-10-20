package com.spring.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.board.service.mbtiService;
import com.spring.board.vo.BoardVo;

@Controller
public class MbtiController {
	@Autowired
	mbtiService mbtiService;
	
	@RequestMapping(value = "/mbti/mbtiMain.do", method = RequestMethod.GET)
	public String mainForm() {
		return "mbti/mbtiMain";
	}
	
	@RequestMapping(value = "/mbti/mbtiTest.do", method = RequestMethod.GET)
	public String testForm(Model model) throws Exception {
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		boardList = mbtiService.selectTestList();
		
		model.addAttribute("boardList", boardList);
		return "mbti/mbtiTest";
	}
	
}