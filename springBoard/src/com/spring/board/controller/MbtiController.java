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
	public String testForm(Model model, @RequestParam(name = "page", defaultValue = "1") int page) throws Exception {
		int pageSize = 5; // 페이지당 게시글 수
		int totalCount = mbtiService.totalCount(); // 전체 아이템 수를 가져오는 메소드
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		boolean hasNextPage = page < totalPages; // 다음 페이지가 있는지 여부

		List<BoardVo> boardList = new ArrayList<BoardVo>();

		// 페이지 번호에 따른 데이터를 가져오는 메소드를 구현해야 합니다.
		int offset = (page - 1) * pageSize;
		boardList = mbtiService.selectTestListPaged(offset, pageSize);

		model.addAttribute("boardList", boardList);
		model.addAttribute("currentPage", page);
		model.addAttribute("hasNextPage", hasNextPage);

		return "mbti/mbtiTest";
	}
	
}
