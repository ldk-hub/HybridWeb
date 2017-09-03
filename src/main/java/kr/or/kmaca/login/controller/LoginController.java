package kr.or.kmaca.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.kmaca.login.service.LoginService;
import kr.or.kmaca.security.vo.UserInfo;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	//로그인
	@RequestMapping(value = "/login")
	public String login(ModelMap map) throws Exception {
		return "login/login";
	}
	//회원가입
	@RequestMapping(value = "/insertId")
	@ResponseBody
	public void insertId(UserInfo userInfo) throws Exception {
		loginService.insertId(userInfo);
	}
	//아이디 중복체크
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public String idCheck(UserInfo userInfo) throws Exception {
		return loginService.idCheck(userInfo);
	}
	
}
