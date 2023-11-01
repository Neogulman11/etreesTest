package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.UserInfoVo;

public interface userService {

	int userSignUpAction(UserInfoVo userInfoVo) throws Exception;

	String idCheck(String userId) throws Exception;

	List<ComcodeVo> userPhoneSelectList(List<ComcodeVo> comcodeList) throws Exception;

	UserInfoVo getUserInfo(String userId) throws Exception;

}
