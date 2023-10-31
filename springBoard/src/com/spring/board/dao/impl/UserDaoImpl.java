package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserDao;
import com.spring.board.vo.UserInfoVo;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int userSignUpAction(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("userInfo.userSignUpAction",userInfoVo);
	}

	@Override
	public UserInfoVo findByUserId(String loginId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userInfo.findByUserId", loginId);
	}

}
