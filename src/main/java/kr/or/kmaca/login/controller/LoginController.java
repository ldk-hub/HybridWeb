package kr.or.kmaca.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.kmaca.login.service.LoginService;

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
	public void insertId(ModelMap map) throws Exception {
		loginService.insertId(map);
	}
	
}
