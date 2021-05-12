package com.sty.js.serviceImpl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sty.js.service.UserService;
import com.sty.js.vo.UserVo;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	@Override
	public Map<String, Object> selectUserLogin(Map<String, Object> mapParam) {
		return sqlSession.selectOne("com.sty.js.user.selectUserLogin", mapParam);
	}

	@Override
	public int selecUserSign(UserVo userVo) {
		return sqlSession.insert("com.sty.js.user.selectUserSign", userVo);
	}

	@Override
	public Map<String, Object> selectLoginCheck(Map<String, Object> mapParam) {
		return sqlSession.selectOne("com.sty.js.user.selectLoginCheck", mapParam);
	}

	@Override
	public Map<String, Object> selectSignCheck(Map<String, Object> mapParam) {
		return sqlSession.selectOne("com.sty.js.user.selectSignCheck", mapParam);
	}
	
}
