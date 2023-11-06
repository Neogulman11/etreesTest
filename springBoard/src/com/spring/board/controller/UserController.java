package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.service.userService;
import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.UserInfoVo;
import com.spring.common.CommonUtil;

import net.sf.json.JSONObject;

@Controller
public class UserController {
	
	@Autowired
	userService userService;
	
	// 회원가입 폼
	@RequestMapping(value = "/board/userSignUp.do", method = RequestMethod.GET)
	public String signUpForm(Model model) throws Exception {
		List<ComcodeVo> comcodeList = new ArrayList<ComcodeVo>();
		comcodeList = userService.userPhoneSelectList(comcodeList);
		
		model.addAttribute("comcode",comcodeList);
		return "/board/userSignUp";
	}
	
	//회원가입 버튼 동작버튼
	@RequestMapping(value = "/board/userInfo/SignUpAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String userSignUpAction(UserInfoVo userInfoVo) throws Exception {
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
	    int saveResult = userService.userSignUpAction(userInfoVo);
	
	    result.put("success", (saveResult > 0)?"success":"Failed");
	    String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    
	    return callbackMsg;
	}
	
	// id체크 동작
	@RequestMapping(value = "/board/userInfo/id-check.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("userId") String userId) throws Exception {
		String checkrResult = userService.idCheck(userId);
		System.out.println("Controller_" +checkrResult);
		return checkrResult;
	}
	
	// 로그인 폼
	@RequestMapping(value = "/board/userLogIn.do", method = RequestMethod.GET)
	public String logInForm() throws Exception {
		
		return "/board/userLogIn";
	}
	
	// 로그인 검새 버튼
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
	
