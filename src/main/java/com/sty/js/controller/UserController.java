package com.sty.js.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sty.js.service.UserService;

@Controller
public class UserController {

	@Resource(name = "userService")
	UserService userService;
	
	@RequestMapping(value ="/userLogin.do")
	public String selectUserLogin(Map<String, Object> mapData) {
		return "user/userLogin";
	}	
	
	@RequestMapping(value ="/userSign.do")
	public String selectUserSign(Map<String, Object> mapData) {
		return "user/userSign";
	}	
	
	@RequestMapping(value = "/loginAction.do")
	public ModelAndView selectLoginAction(HttpServletRequest request) {
		
		Map<String, Object> mapParam = new HashMap<String, Object>();
		
		mapParam.put("USER_ID", request.getParameter("userId"));
		mapParam.put("USER_PWD", request.getParameter("userPwd"));
		
		Map<String, Object> user = userService.selectUserLogin(mapParam);
		
		if(user != null) {
			HttpSession session =  request.getSession();
			session.setAttribute("MEMBER_ID", user.get("USER_ID"));
		} 
		
		ModelAndView mV = new ModelAndView();
		mV.setViewName("redirect:/index.jsp");
		
		return mV;
	}
	
	// 로그인 확인
	@ResponseBody
	@RequestMapping(value = "/loginCheck.do")
	public String selectLoginCheck(@RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd) {
		
		Map<String, Object> mapParam = new HashMap<String, Object>();
		
		mapParam.put("USER_ID", userId);
		mapParam.put("USER_PWD", userPwd);
		
		Map<String, Object> rtnMap = userService.selectLoginCheck(mapParam);
		
		if(rtnMap != null) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "/logoutAction.do")
	public String selectLogoutAction(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
}
