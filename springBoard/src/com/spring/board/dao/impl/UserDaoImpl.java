package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserDao;
import com.spring.board.vo.ComcodeVo;
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
	public UserInfoVo findByUserId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userInfo.findByUserId", userId);
	}

	@Override
	public List<ComcodeVo> userPhoneSelectList(List<ComcodeVo> comcodeList) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userInfo.userPhoneSelectList",comcodeList);
	}

	@Override
	public UserInfoVo getUserInfo(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userInfo.getUserInfo", userId);
    }


	

	

}
