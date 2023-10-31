package com.spring.board.service;

import com.spring.board.vo.UserInfoVo;

public interface userService {

	int userSignUpAction(UserInfoVo userInfoVo) throws Exception;

	String idCheck(String userId) throws Exception;

}
