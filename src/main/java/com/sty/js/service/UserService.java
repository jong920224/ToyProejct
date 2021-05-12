package com.sty.js.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.sty.js.vo.UserVo;

@Service("userService")
public interface UserService {
	
	Map<String, Object> selectUserLogin(Map<String, Object> mapParam);
	
	int selecUserSign(UserVo userVo);
	
	Map<String, Object> selectLoginCheck(Map<String, Object> mapParam);
	
	Map<String, Object> selectSignCheck(Map<String, Object> mapParam);

}
