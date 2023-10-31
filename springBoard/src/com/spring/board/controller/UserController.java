package com.spring.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.service.userService;
import com.spring.board.vo.UserInfoVo;

@Controller
public class UserController {
	
	@Autowired
	userService userService;
	
	@RequestMapping(value = "/board/userSignUp.do", method = RequestMethod.GET)
	public String signUpForm() {
		return "/board/userSignUp";
	}
	
	@RequestMapping(value = "/board/MemberSignUp.do", method = RequestMethod.POST)
	public String userSignUpAction(@ModelAttribute UserInfoVo userInfoVo) throws Exception {
		int saveResult = userService.userSignUpAction(userInfoVo);
		if (saveResult > 0) {
            return "redirect:/board/boardList.do";
        } else {
            return "save";
        }
	}
	
	@RequestMapping(value = "/board/userInfo/id-check.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("userId") String userId) throws Exception {
		String checkrResult = userService.idCheck(userId);
		return checkrResult;
	}
	
}
	
