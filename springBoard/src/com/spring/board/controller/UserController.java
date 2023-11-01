package com.spring.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.service.userService;
import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.UserInfoVo;

import net.sf.json.JSONObject;

@Controller
public class UserController {
	
	@Autowired
	userService userService;
	
	@RequestMapping(value = "/board/userSignUp.do", method = RequestMethod.GET)
	public String signUpForm(Model model) throws Exception {
		List<ComcodeVo> comcodeList = new ArrayList<ComcodeVo>();
		comcodeList = userService.userPhoneSelectList(comcodeList);
		
		model.addAttribute("comcode",comcodeList);
		return "/board/userSignUp";
	}
	
	@RequestMapping(value = "/board/MemberSignUp.do", method = RequestMethod.POST)
	public String userSignUpAction(@ModelAttribute UserInfoVo userInfoVo) throws Exception {
		int saveResult = userService.userSignUpAction(userInfoVo);
		if (saveResult > 0) {
            return "redirect:/board/userLogIn.do";
        } else {
            return "save";
        }
	}
	
	@RequestMapping(value = "/board/userInfo/id-check.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("userId") String userId) throws Exception {
		String checkrResult = userService.idCheck(userId);
		System.out.println("Controller_" +checkrResult);
		return checkrResult;
	}
	
	@RequestMapping(value = "/board/userLogIn.do", method = RequestMethod.GET)
	public String logInForm() throws Exception {
		
		return "/board/userLogIn";
	}
	
	@RequestMapping(value = "/board/userLogIn.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginAction(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw, HttpSession session) throws Exception {
		UserInfoVo userInfo = userService.getUserInfo(userId);
		
		if (userInfo != null) {
	        if (userPw.equals(userInfo.getUserPw())) {
	        	session.setAttribute("user", userInfo);
	            return "success";
	        } else {
	            return "loginPwerr";
	        }
	    } else {
	        return "loginIderr";
	    }
			
	}
	
	
	
}
	