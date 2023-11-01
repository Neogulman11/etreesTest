package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.UserInfoVo;

public interface UserDao {

	int userSignUpAction(UserInfoVo userInfoVo) throws Exception;

	UserInfoVo findByUserId(String userId) throws Exception;

	List<ComcodeVo> userPhoneSelectList(List<ComcodeVo> comcodeList) throws Exception;

	UserInfoVo getUserInfo(String userId) throws Exception;

	

}
