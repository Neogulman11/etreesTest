package com.spring.board.dao;

import com.spring.board.vo.UserInfoVo;

public interface UserDao {

	int userSignUpAction(UserInfoVo userInfoVo) throws Exception;

	UserInfoVo findByUserId(String loginId) throws Exception;

}
