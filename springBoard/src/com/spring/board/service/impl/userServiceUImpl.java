package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDao;
import com.spring.board.service.userService;
import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.UserInfoVo;

@Service
public class userServiceUImpl implements userService{
	@Autowired
	UserDao userDao;

	@Override
	public int userSignUpAction(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userSignUpAction(userInfoVo);
	}

	@Override
	public String idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		UserInfoVo userInfoVo = userDao.findByUserId(userId);
		System.out.println("userInfoVo_"+userInfoVo);
		if (userInfoVo == null) {
			return "ok";
        } else {
        	return "no";
        }
	}

	@Override
	public List<ComcodeVo> userPhoneSelectList(List<ComcodeVo> comcodeList) throws Exception {
		// TODO Auto-generated method stub	
		return userDao.userPhoneSelectList(comcodeList);
	}

	@Override
	public UserInfoVo getUserInfo(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getUserInfo(userId);
	}

}
